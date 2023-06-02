import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:ohsundosun/asset/index.dart';
import 'package:ohsundosun/enum/loading_type.dart';
import 'package:ohsundosun/model/common/comment.dart';
import 'package:ohsundosun/module/main/post_detail/post_detail_provider.dart';
import 'package:ohsundosun/style/index.dart';
import 'package:ohsundosun/util/extension.dart';
import 'package:ohsundosun/widget/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';

part 'post_detail_widget.dart';

class PostDetailView extends HookConsumerWidget {
  final String id;

  const PostDetailView({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, ref) {
    ref.watch(postIdProvider);
    ref.watch(postDetailCommentProvider);

    final loading = ref.watch(loadingProvider);
    final post = ref.watch(postDetailProvider);
    final pagingController = ref.watch(pagingProvider);

    useEffect(() {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        ref.read(postIdProvider.notifier).update(id);

        ref.read(postDetailProvider.notifier).init();
      });

      return null;
    }, []);

    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            FocusScope.of(context).unFocus();
            ref.read(commentIdProvider.notifier).update(null);
          },
          child: Scaffold(
            body: ODSafeColumn(
              top: true,
              children: [
                ODBackAppBar(
                  right: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.all(10.r),
                      child: const ODSvgImage(
                        SvgImage.icDot,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: CustomScrollView(
                    controller: ref.watch(scrollControllerProvider),
                    physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics(),
                    ),
                    slivers: [
                      CupertinoSliverRefreshControl(
                        onRefresh: () async => await ref.read(postDetailProvider.notifier).refresh(),
                      ),
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            if (post != null)
                              Padding(
                                padding: EdgeInsets.only(top: 15.h, bottom: 18.h, left: 20.w, right: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      children: [
                                        ODBadge(
                                          post.mbti.toString(),
                                          type: post.mbti.toODBadgeType(),
                                        ),
                                        ODWidth(5),
                                        ODBadge(post.type.toString()),
                                      ],
                                    ),
                                    ODHeight(14),
                                    Text(
                                      post.title,
                                      style: SpoqaHanSansNeo.bold.set(
                                        size: 18,
                                        height: 27,
                                        letter: -1,
                                        color: ColorStyles.black100,
                                      ),
                                    ),
                                    ODHeight(6),
                                    Text(
                                      post.content.length > 200 ? "${post.content.substring(0, 199)}..." : post.content,
                                      style: SpoqaHanSansNeo.regular.set(
                                        size: 15,
                                        height: 22.5,
                                        letter: -1,
                                        color: ColorStyles.black80,
                                      ),
                                    ),
                                    if (post.images.isNotEmpty) ...[
                                      ODHeight(15),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          ...[0, 1, 2].map(
                                            (index) => Expanded(
                                              child: post.images.elementAtOrNull(index) != null
                                                  ? CachedNetworkImage(
                                                      imageUrl: post.images.elementAt(index),
                                                      errorWidget: (context, url, error) => const SizedBox.shrink(),
                                                    )
                                                  : const SizedBox.shrink(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                    ODHeight(15),
                                    Row(
                                      children: [
                                        const ODSvgImage(
                                          SvgImage.icLikeOff,
                                          size: 20,
                                        ),
                                        ODWidth(5),
                                        Text(
                                          post.likeCount.toString(),
                                          style: SpoqaHanSansNeo.medium.set(
                                            size: 12,
                                            height: 18,
                                            letter: -1,
                                            color: ColorStyles.black60,
                                          ),
                                        ),
                                        ODWidth(10),
                                        const ODSvgImage(
                                          SvgImage.icComment,
                                          size: 20,
                                        ),
                                        ODWidth(5),
                                        Text(
                                          post.commentCount.toString(),
                                          style: SpoqaHanSansNeo.medium.set(
                                            size: 12,
                                            height: 18,
                                            letter: -1,
                                            color: ColorStyles.black60,
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          post.nickname,
                                          style: SpoqaHanSansNeo.medium.set(
                                            size: 12,
                                            height: 18,
                                            letter: -1,
                                            color: ColorStyles.black60,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(horizontal: 5.w),
                                          height: 2.r,
                                          width: 2.r,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: ColorStyles.black40,
                                          ),
                                        ),
                                        Text(
                                          DateTime.now().difference(post.createdAt.unixTimestampToDateTime()) <= const Duration(minutes: 10)
                                              ? DateFormat('${DateTime.now().difference(post.createdAt.unixTimestampToDateTime()).inMinutes}분전')
                                                  .format(post.createdAt.unixTimestampToDateTime())
                                              : DateFormat('yy.MM.dd').format(post.createdAt.unixTimestampToDateTime()),
                                          style: SpoqaHanSansNeo.medium.set(
                                            size: 12,
                                            height: 18,
                                            color: ColorStyles.black40,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            Container(
                              height: 6.h,
                              color: ColorStyles.black5,
                            ),
                          ],
                        ),
                      ),
                      PagedSliverList<String?, Comment>(
                        pagingController: pagingController,
                        builderDelegate: PagedChildBuilderDelegate<Comment>(
                          itemBuilder: (context, item, index) => CommentItem(item),
                          firstPageErrorIndicatorBuilder: (_) => const SizedBox.shrink(),
                          newPageErrorIndicatorBuilder: (_) => const SizedBox.shrink(),
                          firstPageProgressIndicatorBuilder: (_) => const SizedBox.shrink(),
                          newPageProgressIndicatorBuilder: (_) => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ODHeight(40),
                              SpinKitThreeBounce(
                                size: 18.r,
                                color: ColorStyles.black40,
                              ),
                              Text(
                                '내용을 불러오고 있어요!',
                                style: SpoqaHanSansNeo.regular.set(
                                  size: 12,
                                  height: 35,
                                  letter: -1,
                                  color: ColorStyles.black40,
                                ),
                              ),
                              ODHeight(20),
                              const ODSafeBox(
                                bottom: true,
                              ),
                            ],
                          ),
                          noItemsFoundIndicatorBuilder: (_) => ODSafeBox(
                            bottom: true,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ODHeight(65),
                                ODSvgImage(
                                  SvgImage.icMainEmpty,
                                  height: 50.h,
                                  fit: BoxFit.fitHeight,
                                ),
                                ODHeight(12),
                                Text(
                                  "댓글이 없어요.\n첫 댓글을 올려주세요!",
                                  textAlign: TextAlign.center,
                                  style: SpoqaHanSansNeo.regular.set(
                                    size: 18,
                                    height: 27,
                                    letter: -1,
                                    color: ColorStyles.black80,
                                  ),
                                ),
                                ODHeight(20),
                              ],
                            ),
                          ),
                          noMoreItemsIndicatorBuilder: (_) => Column(
                            children: [
                              ODHeight(20),
                              const ODSafeBox(
                                bottom: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: ColorStyles.black10,
                  child: ODSafeBox(
                    bottom: true,
                    child: Container(
                      height: 40.h,
                      margin: EdgeInsets.all(5.r),
                      decoration: BoxDecoration(
                        color: ColorStyles.white,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Row(
                        children: [
                          ODWidth(10),
                          Expanded(
                            child: TextField(
                              controller: ref.watch(postDetailCommentControllerProvider),
                              focusNode: ref.watch(postDetailCommentFocusNodeProvider),
                              decoration: InputDecoration(
                                isDense: true,
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: "${ref.watch(commentIdProvider) != null ? "답글" : "댓글"}을 입력해주세요.",
                                hintStyle: SpoqaHanSansNeo.regular.set(
                                  size: 14,
                                  height: 15,
                                  letter: -1,
                                  color: ColorStyles.black40,
                                ),
                              ),
                              onChanged: (value) => ref.read(postDetailCommentProvider.notifier).update(value),
                              cursorColor: ColorStyles.black100,
                              style: SpoqaHanSansNeo.regular.set(
                                size: 14,
                                height: 15,
                                letter: -1,
                                color: ColorStyles.black100,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => onAddComment(context, ref),
                            child: Padding(
                              padding: EdgeInsets.all(10.r),
                              child: const ODSvgImage(
                                SvgImage.icSend,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (loading == LoadingType.load) const ODLoading(),
        if (loading == LoadingType.init) const ODInitLoading(),
      ],
    );
  }
}
