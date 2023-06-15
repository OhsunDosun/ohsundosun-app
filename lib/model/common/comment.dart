import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ohsundosun/enum/mbti.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    required String uuid,
    required MBTI mbti,
    required int level,
    required String nickname,
    required String content,
    required DateTime createdAt,
    required bool isMine,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
}
