import 'package:flutter/material.dart';

extension IntExtension on int {
  DateTime unixTimestampToDateTime() {
    return DateTime.fromMillisecondsSinceEpoch(this * 1000);
  }
}

extension FocusScopeNodeExtension on FocusScopeNode {
  void unFocus() {
    unfocus();
    requestFocus(FocusNode());
  }
}
