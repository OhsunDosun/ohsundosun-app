import 'package:ohsundosun/data/api/auth_api.dart';
import 'package:ohsundosun/data/api/posts_api.dart';
import 'package:ohsundosun/data/api/users_api.dart';
import 'package:ohsundosun/data/provider/dio_provider.dart';
import 'package:ohsundosun/provider/app_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_provider.g.dart';

@riverpod
AuthApi authApi(AuthApiRef ref) {
  final dio = ref.watch(dioProvider);
  final baseUrl = ref.watch(baseUrlProvider);

  return AuthApi(dio, baseUrl: baseUrl);
}

@riverpod
UsersApi usersApi(UsersApiRef ref) {
  final dio = ref.watch(dioProvider);
  final baseUrl = ref.watch(baseUrlProvider);

  return UsersApi(dio, baseUrl: baseUrl);
}

@riverpod
PostsApi postsApi(PostsApiRef ref) {
  final dio = ref.watch(dioProvider);
  final baseUrl = ref.watch(baseUrlProvider);

  return PostsApi(dio, baseUrl: baseUrl);
}
