import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ohsundosun/enum/mbti.dart';
import 'package:ohsundosun/enum/post_type.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    required String uuid,
    required MBTI mbti,
    required PostType type,
    required String nickname,
    required String title,
    required String content,
    required String images,
    required DateTime createdAt,
    required int likeCount,
    required int commentCount,
    required bool isLike,
    required bool isMine,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

@freezed
class PostUI with _$PostUI {
  const factory PostUI({
    required String uuid,
    required MBTI mbti,
    required PostType type,
    required String nickname,
    required String title,
    required String content,
    required List<String> images,
    required DateTime createdAt,
    required int likeCount,
    required int commentCount,
    required bool isLike,
    required bool isMine,
  }) = _PostUI;

  factory PostUI.fromJson(Map<String, dynamic> json) => _$PostUIFromJson(json);
}

extension PostExtention on Post {
  PostUI toPostUI() {
    return PostUI(
      uuid: uuid,
      mbti: mbti,
      type: type,
      nickname: nickname,
      title: title,
      content: content,
      images: images.split(",")..removeWhere((image) => image == ""),
      createdAt: createdAt,
      likeCount: likeCount,
      commentCount: commentCount,
      isLike: isLike,
      isMine: isMine,
    );
  }
}
