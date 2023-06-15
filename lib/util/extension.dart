import 'package:dio/dio.dart';
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

extension ResponseExtension on Response {
  (String?, String?) getToken() {
    String? accessToken;
    String? refreshToken;

    headers.forEach(
      (name, values) async {
        if (name == "set-cookie") {
          for (var value in values) {
            if (value.contains("access-token=")) {
              accessToken = value.split(';')[0].split('=')[1];
            }
            if (value.contains("refresh-token=")) {
              refreshToken = value.split(';')[0].split('=')[1];
            }
          }
        }
      },
    );

    return (accessToken, refreshToken);
  }
}
