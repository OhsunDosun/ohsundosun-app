import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohsundosun/asset/index.dart';
import 'package:ohsundosun/provider/app_provider.dart';
import 'package:ohsundosun/provider/router_provider.dart';
import 'package:ohsundosun/style/index.dart';
import 'package:ohsundosun/widget/index.dart';

class MainView extends ConsumerWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final userInfo = ref.watch(userInfoProvider);

    return Scaffold(
      endDrawer: SizedBox(
        width: 305.w,
        child: Drawer(
          child: SafeArea(
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
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          ODSafeBox(
            top: true,
            child: Column(
              children: const [
                ODMainAppBar(),
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
        ],
      ),
    );
  }
}
