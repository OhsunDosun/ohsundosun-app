import 'package:go_router/go_router.dart';
import 'package:ohsundosun/module/main/main_view.dart';
import 'package:ohsundosun/module/main/post_detail/post_detail_view.dart';
import 'package:ohsundosun/module/main/post_write/post_write_view.dart';
import 'package:ohsundosun/module/main/setting/rating/rating_view.dart';
import 'package:ohsundosun/module/main/setting/setting_view.dart';
import 'package:ohsundosun/module/main/setting/user_info/user_info_view.dart';
import 'package:ohsundosun/module/onboard/sign_in/sign_in_view.dart';
import 'package:ohsundosun/module/onboard/onboard_view.dart';
import 'package:ohsundosun/module/onboard/find_password/find_password_view.dart';
import 'package:ohsundosun/module/onboard/sign_up/sign_up_view.dart';
import 'package:ohsundosun/module/splash/splash_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

class AppRoute {
  AppRoute._();

  static const splash = '/splash';

  static const onboard = '/onboard';
  static const signIn = '$onboard/sign/in';
  static const signUp = '$onboard/sign/up';
  static const findPassword = '$onboard/find/password';

  static const main = '/main';

  static const postWrite = '$main/post/write';
  static const postDetail = '$setting/post/detail/:postId';

  static const setting = '$main/setting';
  static const userInfo = '$setting/user/info';
  static const rating = '$setting/rating';

  static const init = AppRoute.splash;

  static final routes = [
    GoRoute(
      path: AppRoute.splash,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: AppRoute.onboard,
      builder: (context, state) => const OnboardView(),
      routes: [
        GoRoute(
          path: AppRoute.signIn.replaceAll("$onboard/", ""),
          builder: (context, state) => const SignInView(),
        ),
        GoRoute(
          path: AppRoute.signUp.replaceAll("$onboard/", ""),
          builder: (context, state) => const SignUpView(),
        ),
        GoRoute(
          path: AppRoute.findPassword.replaceAll("$onboard/", ""),
          builder: (context, state) => const PwfindView(),
        ),
      ],
    ),
    GoRoute(
      path: AppRoute.main,
      builder: (context, state) => const MainView(),
      routes: [
        GoRoute(
          path: AppRoute.postWrite.replaceAll("$main/", ""),
          builder: (context, state) => const PostWriteView(),
        ),
        GoRoute(
          path: AppRoute.postDetail.replaceAll("$main/", ""),
          builder: (context, state) => const PostDetailView(),
        ),
        GoRoute(
          path: AppRoute.setting.replaceAll("$main/", ""),
          builder: (context, state) => const SettingView(),
          routes: [
            GoRoute(
              path: AppRoute.userInfo.replaceAll("$setting/", ""),
              builder: (context, state) => const UserInfoView(),
            ),
            GoRoute(
              path: AppRoute.rating.replaceAll("$setting/", ""),
              builder: (context, state) => const RatingView(),
            ),
          ],
        ),
      ],
    ),
  ];
}

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    initialLocation: AppRoute.init,
    routes: AppRoute.routes,
  );
}
