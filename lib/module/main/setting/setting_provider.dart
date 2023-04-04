import 'package:async/async.dart';
import 'package:ohsundosun/data/provider/service_provider.dart';
import 'package:ohsundosun/provider/app_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'setting_provider.g.dart';

@riverpod
class NotificationCancelableOperation extends _$NotificationCancelableOperation {
  @override
  CancelableOperation<void>? build() => null;

  void update(CancelableOperation<void>? value) {
    state = value;
  }
}

@riverpod
class Notification extends _$Notification {
  @override
  bool build() => ref.read(userInfoProvider).notification;

  void update(bool value) async {
    state = value;
    final usersService = ref.watch(usersServiceProvider);

    await usersService.updateNotification(notification: value);
    ref.read(userInfoProvider.notifier).update(await usersService.getUserInfo());
  }
}
