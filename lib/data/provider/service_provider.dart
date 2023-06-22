import 'package:ohsundosun/data/provider/api_provider.dart';
import 'package:ohsundosun/data/service/auth_service.dart';
import 'package:ohsundosun/data/service/images_service.dart';
import 'package:ohsundosun/data/service/posts_service.dart';
import 'package:ohsundosun/data/service/users_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'service_provider.g.dart';

@riverpod
AuthService authService(AuthServiceRef ref) {
  final api = ref.watch(authApiProvider);

  return AuthService(api);
}

@riverpod
UsersService usersService(UsersServiceRef ref) {
  final api = ref.watch(usersApiProvider);

  return UsersService(api);
}

@riverpod
PostsService postsService(PostsServiceRef ref) {
  final api = ref.watch(postsApiProvider);

  return PostsService(api);
}

@riverpod
ImagesService imagesService(ImagesServiceRef ref) {
  final api = ref.watch(imagesApiProvider);

  return ImagesService(api);
}
