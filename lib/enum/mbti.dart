import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ohsundosun/widget/index.dart';

enum MBTI {
  @JsonValue("INTJ")
  intj,
  @JsonValue("INTP")
  intp,
  @JsonValue("ENTJ")
  entj,
  @JsonValue("ENTP")
  entp,

  @JsonValue("INFJ")
  infj,
  @JsonValue("INFP")
  infp,
  @JsonValue("ENFJ")
  enfj,
  @JsonValue("ENFP")
  enfp,

  @JsonValue("ISFJ")
  isfj,
  @JsonValue("ISTJ")
  istj,
  @JsonValue("ESFJ")
  esfj,
  @JsonValue("ESTJ")
  estj,

  @JsonValue("ISFP")
  isfp,
  @JsonValue("ISTP")
  istp,
  @JsonValue("ESFP")
  esfp,
  @JsonValue("ESTP")
  estp;

  ODBadgeType toODBadgeType() {
    switch (this) {
      case MBTI.intj:
      case MBTI.intp:
      case MBTI.entj:
      case MBTI.entp:
        return ODBadgeType.purple;

      case MBTI.infj:
      case MBTI.infp:
      case MBTI.enfj:
      case MBTI.enfp:
        return ODBadgeType.green;

      case MBTI.isfj:
      case MBTI.istj:
      case MBTI.esfj:
      case MBTI.estj:
        return ODBadgeType.blue;

      case MBTI.isfp:
      case MBTI.istp:
      case MBTI.esfp:
      case MBTI.estp:
        return ODBadgeType.orange;
    }
  }

  @override
  String toString() {
    switch (this) {
      case MBTI.intj:
        return "INTJ";
      case MBTI.intp:
        return "INTP";
      case MBTI.entj:
        return "ENTJ";
      case MBTI.entp:
        return "ENTP";

      case MBTI.infj:
        return "INFJ";
      case MBTI.infp:
        return "INFP";
      case MBTI.enfj:
        return "ENFJ";
      case MBTI.enfp:
        return "ENFP";

      case MBTI.isfj:
        return "ISFJ";
      case MBTI.istj:
        return "ISTJ";
      case MBTI.esfj:
        return "ESFJ";
      case MBTI.estj:
        return "ESTJ";

      case MBTI.isfp:
        return "ISFP";
      case MBTI.istp:
        return "ISTP";
      case MBTI.esfp:
        return "ESFP";
      case MBTI.estp:
        return "ESTP";
    }
  }
}
