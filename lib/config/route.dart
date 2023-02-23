import 'package:ohsundosun/module/login/login_view.dart';
import 'package:ohsundosun/module/onboard/onboard_view.dart';
import 'package:ohsundosun/module/register/register_view.dart';
import 'package:ohsundosun/module/pwfind/pwfind_view.dart';

class AppRoute {
  AppRoute._();

  static const onboard = '/';
  static const login = '/login';
  static const register = '/register';
  static const pwfind = '/pwfind';

  static const main = '/main';

  static const init = AppRoute.onboard;

  static final routes = {
    AppRoute.onboard: (context) => const OnboardView(),
    AppRoute.login: (context) => const LoginView(),
    AppRoute.register: (context) => const RegisterView(),
    AppRoute.main: (context) => const RegisterView(),
    AppRoute.pwfind: (context) => const PwfindView(),
  };
}
