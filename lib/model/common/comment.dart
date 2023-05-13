import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ohsundosun/enum/mbti.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    required String key,
    required MBTI mbti,
    required String nickname,
    required String content,
    required int createdAt,
    required List<Reply> replys,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
}

@freezed
class Reply with _$Reply {
  const factory Reply({
    required String key,
    required MBTI mbti,
    required String nickname,
    required String content,
    required int createdAt,
  }) = _Reply;

  factory Reply.fromJson(Map<String, dynamic> json) => _$ReplyFromJson(json);
}
