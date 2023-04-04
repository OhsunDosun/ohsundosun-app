import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:ohsundosun/asset/index.dart';
import 'package:ohsundosun/enum/loading_type.dart';
import 'package:ohsundosun/module/main/post_detail/post_detail_provider.dart';
import 'package:ohsundosun/style/index.dart';
import 'package:ohsundosun/util/extension.dart';
import 'package:ohsundosun/widget/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';

class PostDetailView extends HookConsumerWidget {
  final String id;

  const PostDetailView({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, ref) {
    final loading = ref.watch(loadingProvider);
    final post = ref.watch(postDetailProvider);

    useEffect(() {
      ref.read(postDetailProvider.notifier).load(id);

      return null;
    }, []);

    return Scaffold(
      body: Stack(
        children: [
          ODSafeColumn(
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
                child: ODSingleScroll(
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
                    ],
                  ),
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
                    child: Row(children: [
                      ODWidth(10),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "댓글을 입력해주세요.",
                            hintStyle: SpoqaHanSansNeo.regular.set(
                              size: 14,
                              height: 15,
                              letter: -1,
                              color: ColorStyles.black40,
                            ),
                          ),
                          cursorColor: ColorStyles.black100,
                          style: SpoqaHanSansNeo.regular.set(
                            size: 14,
                            height: 15,
                            letter: -1,
                            color: ColorStyles.black100,
                          ),
                        ),
                      ),
                      ODWidth(10),
                      const ODSvgImage(
                        SvgImage.icSend,
                        size: 20,
                      ),
                      ODWidth(10),
                    ]),
                  ),
                ),
              )
            ],
          ),
          if (loading == LoadingType.load) const ODLoading(),
        ],
      ),
    );
  }
}
