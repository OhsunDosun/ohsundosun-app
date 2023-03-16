import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'storage_provider.g.dart';

@riverpod
FlutterSecureStorage secureStorage(SecureStorageRef ref) {
  return throw UnimplementedError();
}

@riverpod
SharedPreferences localStorage(LocalStorageRef ref) {
  return throw UnimplementedError();
}
