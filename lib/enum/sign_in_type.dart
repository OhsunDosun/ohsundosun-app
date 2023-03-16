import 'package:freezed_annotation/freezed_annotation.dart';

enum SignInType {
  @JsonValue("DEFAULT")
  signIn,
  @JsonValue("NEW_PASSWORD")
  temporarySignIn;

  @override
  String toString() {
    switch (this) {
      case SignInType.signIn:
        return "DEFAULT";
      case SignInType.temporarySignIn:
        return "NEW_PASSWORD";
    }
  }
}

extension StringExtension on String? {
  SignInType? toSignInType() {
    switch (this) {
      case "DEFAULT":
        return SignInType.signIn;
      case "NEW_PASSWORD":
        return SignInType.temporarySignIn;
      default:
        return null;
    }
  }
}
