import 'package:freezed_annotation/freezed_annotation.dart';

enum PostType {
  @JsonValue("DAILY")
  daily,
  @JsonValue("LOVE")
  love,
  @JsonValue("FRIEND")
  friend;

  String toValue() {
    switch (this) {
      case PostType.daily:
        return "DAILY";
      case PostType.love:
        return "LOVE";
      case PostType.friend:
        return "FRIEND";
    }
  }

  @override
  String toString() {
    switch (this) {
      case PostType.daily:
        return "일상";
      case PostType.love:
        return "연애";
      case PostType.friend:
        return "친구";
    }
  }
}
