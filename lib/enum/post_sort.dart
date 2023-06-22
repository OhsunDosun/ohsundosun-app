import 'package:freezed_annotation/freezed_annotation.dart';

enum PostSort {
  @JsonValue("NEW")
  newPost,
  @JsonValue("LIKE")
  likePost;

  String toValue() {
    switch (this) {
      case PostSort.newPost:
        return "NEW";
      case PostSort.likePost:
        return "LIKE";
    }
  }

  @override
  String toString() {
    switch (this) {
      case PostSort.newPost:
        return "최신순";
      case PostSort.likePost:
        return "인기순";
    }
  }
}
