import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ohsundosun/asset/index.dart';
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

class MainView extends ConsumerStatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  MainViewState createState() => MainViewState();
}

class MainViewState extends ConsumerState<MainView> {
  final scrollController = ScrollController();

  double appbarShadowOpacity = 0;
  final Tween<double> appbarShadowOpacityTween = Tween(begin: 0, end: 0.05);
  double sortOpacity = 0;
  double mbtiOpacity = 1;
  double sortPaddingLeft = 0.w;
  final Tween<double> sortPaddingLeftTween = Tween(begin: 0.w, end: 33.w);
  double offset = 0;

  int? openMBTIMenu;

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      final openHeight = (ref.watch(mainMBTIProvider) == null ? 201.h : 232.h) - 99.h;

      scrollController.addListener(() {
        setState(() {
          offset = scrollController.offset;
          if (offset < 0) {
            offset = 0;
          } else if (offset > openHeight) {
            offset = openHeight;
          }

          sortOpacity = offset / openHeight;
          mbtiOpacity = 1 - offset / openHeight;
          sortPaddingLeft = sortPaddingLeftTween.transform(offset / openHeight);
          appbarShadowOpacity = appbarShadowOpacityTween.transform(offset / openHeight);
        });
      });

      getPosts(ref);

      ref.watch(pagingControllerProvider).addPageRequestListener((pageKey) {
        getPosts(ref, lastKey: pageKey);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final userInfo = ref.watch(userInfoProvider);
    final pagingController = ref.watch(pagingControllerProvider);

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
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  backgroundColor: ColorStyles.transparent,
                  actions: const [SizedBox.shrink()],
                  pinned: true,
                  toolbarHeight: 99.h,
                  expandedHeight: ref.watch(mainMBTIProvider) == null ? 201.h : 232.h,
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
                              padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
                              child: Wrap(
                                clipBehavior: Clip.hardEdge,
                                children: [
                                  if (ref.watch(mainMBTIProvider) == null)
                                    Container(
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
                                    ),
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
                    noItemsFoundIndicatorBuilder: (_) => const SizedBox.shrink(),
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
                onTap: () => context.go(AppRoute.postWrite),
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
