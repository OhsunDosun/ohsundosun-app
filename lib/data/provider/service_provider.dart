import 'package:ohsundosun/data/provider/api_provider.dart';
import 'package:ohsundosun/data/service/auth_service.dart';
import 'package:ohsundosun/data/service/users_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'service_provider.g.dart';

@riverpod
AuthService authService(AuthServiceRef ref) {
  final authApi = ref.watch(authApiProvider);

  return AuthService(authApi);
}

@riverpod
UsersService usersService(UsersServiceRef ref) {
  final usersApi = ref.watch(usersApiProvider);

  return UsersService(usersApi);
}
