import 'package:freezed_annotation/freezed_annotation.dart';

enum SignInType {
  @JsonValue("DEFAULT")
  defaultSignIn,
  @JsonValue("NEW_PASSWORD")
  newPasswordSignIn;

  @override
  String toString() {
    switch (this) {
      case SignInType.defaultSignIn:
        return "DEFAULT";
      case SignInType.newPasswordSignIn:
        return "NEW_PASSWORD";
    }
  }
}

extension StringExtension on String? {
  SignInType? toSignInType() {
    switch (this) {
      case "DEFAULT":
        return SignInType.defaultSignIn;
      case "NEW_PASSWORD":
        return SignInType.newPasswordSignIn;
      default:
        return null;
    }
  }
}
