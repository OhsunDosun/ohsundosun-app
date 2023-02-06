import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@riverpod
String helloWorld(HelloWorldRef ref) {
  return 'Hello world';
}

@riverpod
String hello123123World(Hello123123WorldRef ref) {
  return 'Hello world';
}
