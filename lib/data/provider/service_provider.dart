import 'package:ohsundosun/data/provider/api_provider.dart';
import 'package:ohsundosun/data/service/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'service_provider.g.dart';

@riverpod
AuthService authService(AuthServiceRef ref) {
  final authApi = ref.watch(authApiProvider);

  return AuthService(authApi);
}
