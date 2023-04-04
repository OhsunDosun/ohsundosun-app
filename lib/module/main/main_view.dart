import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ohsundosun/asset/index.dart';
import 'package:ohsundosun/enum/loading_type.dart';
import 'package:ohsundosun/enum/mbti.dart';
import 'package:ohsundosun/model/common/post.dart';
import 'package:ohsundosun/module/main/main_provider.dart';
import 'package:ohsundosun/provider/app_provider.dart';
import 'package:ohsundosun/provider/router_provider.dart';
import 'package:ohsundosun/style/index.dart';
import 'package:ohsundosun/util/extension.dart';
import 'package:ohsundosun/widget/index.dart';
import 'package:intl/intl.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

part 'main_widget.dart';

class MainView extends HookConsumerWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appbarShadowOpacity = ref.watch(appbarShadowOpacityProvider);
    final sortOpacity = ref.watch(sortOpacityProvider);
    final mbtiOpacity = ref.watch(mbtiOpacityProvider);
    final sortPaddingLeft = ref.watch(sortPaddingLeftProvider);

    final userInfo = ref.watch(userInfoProvider);
    final pagingController = ref.watch(pagingProvider);
    final mbti = ref.watch(mainMBTIProvider);
    final scrollController = ref.watch(scrollControllerProvider);

    useEffect(() {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        ref.read(pagingProvider.notifier).load(type: LoadingType.init);

        scrollController.addListener(() {
          ref.read(scrollOffsetProvider.notifier).update(scrollController.offset);
        });
      });
      return null;
    }, []);

    return Scaffold(
      endDrawer: SizedBox(
        width: 305.w,
        child: Drawer(
          backgroundColor: ColorStyles.white,
          child: ODSafeBox(
            top: true,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                    top: 20.h,
                    bottom: 22.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ODWidth(1),
                          ODBadge(
                            userInfo.mbti.toString(),
                            type: userInfo.mbti.toODBadgeType(),
                          ),
                        ],
                      ),
                      ODHeight(5),
                      Row(
                        children: [
                          ODWidth(1),
                          Text(
                            userInfo.nickname,
                            style: SpoqaHanSansNeo.bold.set(
                              size: 20,
                              height: 30,
                              letter: -1,
                              color: ColorStyles.black100,
                            ),
                          ),
                        ],
                      ),
                      ODHeight(10),
                      InkWell(
                        onTap: () => context.go(AppRoute.setting),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const ODSvgImage(
                              SvgImage.icSetting,
                              size: 16,
                            ),
                            ODWidth(3),
                            Text(
                              "환경설정",
                              style: SpoqaHanSansNeo.regular.set(
                                size: 13,
                                letter: -1,
                                color: ColorStyles.black40,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 6.h,
                  color: ColorStyles.black5,
                ),
                Expanded(
                  child: ODSingleScroll(
                    child: Column(
                      children: const [
                        MBTIMenu(
                          icon: SvgImage.icLogoPurple,
                          title: '분석형',
                          subTitle: 'NT',
                          items: [
                            MBTI.intj,
                            MBTI.entj,
                            MBTI.intp,
                            MBTI.entp,
                          ],
                        ),
                        MBTIMenu(
                          icon: SvgImage.icLogoGreen,
                          title: '외교형',
                          subTitle: 'NF',
                          items: [
                            MBTI.infj,
                            MBTI.enfj,
                            MBTI.infp,
                            MBTI.enfp,
                          ],
                        ),
                        MBTIMenu(
                          icon: SvgImage.icLogoBlue,
                          title: '관리자형',
                          subTitle: 'SJ',
                          items: [
                            MBTI.isfj,
                            MBTI.esfj,
                            MBTI.istj,
                            MBTI.estj,
                          ],
                        ),
                        MBTIMenu(
                          icon: SvgImage.icLogoOrange,
                          title: '탐험가형',
                          subTitle: 'SP',
                          items: [
                            MBTI.isfp,
                            MBTI.esfp,
                            MBTI.istp,
                            MBTI.estp,
                          ],
                        ),
                        ODSafeBox(
                          bottom: true,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          ODSafeBox(
            top: true,
            child: CustomScrollView(
              controller: scrollController,
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              slivers: [
                SliverAppBar(
                  backgroundColor: ColorStyles.transparent,
                  actions: const [SizedBox.shrink()],
                  pinned: true,
                  toolbarHeight: 99.h,
                  expandedHeight: mbti == null ? 201.h : 232.h,
                  elevation: 0,
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                      color: ColorStyles.white,
                      boxShadow: [
                        BoxShadow(
                          color: ColorStyles.black100.withOpacity(appbarShadowOpacity),
                          offset: Offset(0, 6.h),
                          blurRadius: 20.r,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        const ODMainAppBar(),
                        Expanded(
                          child: Opacity(
                            opacity: mbtiOpacity,
                            child: Container(
                              padding: EdgeInsets.only(top: 25.h, left: 20.w, right: 20.w),
                              child: Wrap(
                                clipBehavior: Clip.hardEdge,
                                children: [
                                  mbti == null
                                      ? Container(
                                          alignment: Alignment.topLeft,
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: '16개의 성격 유형,\n',
                                                  style: SpoqaHanSansNeo.regular.set(
                                                    size: 24,
                                                    height: 35,
                                                    letter: -1,
                                                    color: ColorStyles.black100,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: '오순도순 ',
                                                  style: SpoqaHanSansNeo.bold.set(
                                                    size: 24,
                                                    height: 35,
                                                    letter: -1,
                                                    color: ColorStyles.black100,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: '우리들의 이야기',
                                                  style: SpoqaHanSansNeo.regular.set(
                                                    size: 24,
                                                    height: 35,
                                                    letter: -1,
                                                    color: ColorStyles.black100,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      : Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            Row(
                                              children: [
                                                ODSvgImage(
                                                  mbti.toIcon(),
                                                  size: 18,
                                                ),
                                                ODWidth(5),
                                                Text(
                                                  mbti.toTypeName(),
                                                  style: SpoqaHanSansNeo.bold.set(
                                                    size: 18,
                                                    letter: -1,
                                                    color: ColorStyles.black100,
                                                  ),
                                                ),
                                                ODWidth(5),
                                                Text(
                                                  "/ ${mbti.toTypeCode()}",
                                                  style: SpoqaHanSansNeo.regular.set(
                                                    size: 15,
                                                    color: ColorStyles.black40,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            ODHeight(13),
                                            Text(
                                              mbti.toSubTitle(),
                                              style: SpoqaHanSansNeo.regular.set(
                                                size: 24,
                                                height: 35,
                                                letter: -1,
                                                color: ColorStyles.black100,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  mbti.toTitle(),
                                                  style: SpoqaHanSansNeo.bold.set(
                                                    size: 24,
                                                    height: 35,
                                                    letter: -1,
                                                    color: ColorStyles.black100,
                                                  ),
                                                ),
                                                ODWidth(2),
                                                Text(
                                                  mbti.toString(),
                                                  style: SpoqaHanSansNeo.bold.set(
                                                    size: 24,
                                                    height: 30,
                                                    color: mbti.toColor(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 45.h,
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Opacity(
                                  opacity: sortOpacity,
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "필터",
                                      style: SpoqaHanSansNeo.medium.set(
                                        size: 13,
                                        height: 20,
                                        letter: -1,
                                        color: ColorStyles.black80,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned.fill(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(left: sortPaddingLeft),
                                  child: InkWell(
                                    onTap: () {
                                      showModalBottomSheet(
                                        enableDrag: false,
                                        isScrollControlled: true,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(8.r),
                                          ),
                                        ),
                                        context: context,
                                        builder: (context) {
                                          return ODPostSortBottomSheet(
                                            sort: ref.watch(mainPostSortProvider),
                                            onTap: (sort) {
                                              if (ref.read(mainPostSortProvider) != sort) {
                                                ref.read(mainPostSortProvider.notifier).update(sort);
                                                ref.read(pagingProvider.notifier).load(type: LoadingType.reload);
                                              }
                                            },
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      height: 30.h,
                                      width: 80.w,
                                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.r),
                                        color: ColorStyles.black5,
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              ref.watch(mainPostSortProvider).toString(),
                                              style: SpoqaHanSansNeo.medium.set(
                                                size: 12,
                                                letter: -1,
                                                color: ColorStyles.black60,
                                              ),
                                            ),
                                          ),
                                          const ODSvgImage(
                                            SvgImage.icSort,
                                            size: 13,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CupertinoSliverRefreshControl(
                  onRefresh: () => ref.read(pagingProvider.notifier).load(type: LoadingType.refresh),
                ),
                PagedSliverList<String?, Post>(
                  pagingController: pagingController,
                  builderDelegate: PagedChildBuilderDelegate<Post>(
                    itemBuilder: (context, item, index) => PostItem(item),
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
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ODSvgImage(
                              SvgImage.icMainEmpty,
                              height: 50.h,
                              fit: BoxFit.fitHeight,
                            ),
                            ODHeight(12),
                            Text(
                              "작성된 게시글이 없어요.\n첫 게시글을 작성해주세요!",
                              textAlign: TextAlign.center,
                              style: SpoqaHanSansNeo.regular.set(
                                size: 18,
                                height: 27,
                                letter: -1,
                                color: ColorStyles.black80,
                              ),
                            ),
                            ODHeight(207),
                          ],
                        ),
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
          SafeArea(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.only(right: 15.w, bottom: 20.h),
              child: InkWell(
                onTap: () async {
                  final result = await context.push(AppRoute.postWrite);

                  if (result == true) {
                    ref.read(pagingProvider.notifier).load(type: LoadingType.reload);
                  }
                },
                child: Container(
                  height: 55.r,
                  width: 55.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorStyles.red100,
                    boxShadow: [
                      BoxShadow(
                        color: ColorStyles.black20.withOpacity(0.5),
                        blurRadius: 10.r,
                        offset: Offset(0, 4.h),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: ODSvgImage(
                      SvgImage.icWrite17,
                      size: 17,
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (ref.watch(loadingProvider)) const ODLoading(),
        ],
      ),
    );
  }
}
