import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ohsundosun/enum/mbti.dart';
import 'package:ohsundosun/enum/post_type.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    required String key,
    required String userKey,
    required MBTI mbti,
    required PostType type,
    required String nickname,
    required String title,
    required String content,
    required List<String> images,
    required int createdAt,
    required int likeCount,
    required int commentCount,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
