import 'package:ohsundosun/module/login/login_view.dart';
import 'package:ohsundosun/module/main/main_view.dart';

class AppRoute {
  AppRoute._();

  static const main = '/';
  static const login = '/login';

  static const init = AppRoute.main;

  static final routes = {
    AppRoute.main: (context) => const MainView(),
    AppRoute.login: (context) => const LoginView(),
  };
}
