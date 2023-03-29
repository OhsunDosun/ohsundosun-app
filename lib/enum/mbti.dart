import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ohsundosun/asset/index.dart';
import 'package:ohsundosun/style/index.dart';
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

  String toIcon() {
    switch (this) {
      case MBTI.intj:
      case MBTI.intp:
      case MBTI.entj:
      case MBTI.entp:
        return SvgImage.icLogoPurple;

      case MBTI.infj:
      case MBTI.infp:
      case MBTI.enfj:
      case MBTI.enfp:
        return SvgImage.icLogoGreen;

      case MBTI.isfj:
      case MBTI.istj:
      case MBTI.esfj:
      case MBTI.estj:
        return SvgImage.icLogoBlue;

      case MBTI.isfp:
      case MBTI.istp:
      case MBTI.esfp:
      case MBTI.estp:
        return SvgImage.icLogoOrange;
    }
  }

  Color toColor() {
    switch (this) {
      case MBTI.intj:
      case MBTI.intp:
      case MBTI.entj:
      case MBTI.entp:
        return ColorStyles.purpleDeep;

      case MBTI.infj:
      case MBTI.infp:
      case MBTI.enfj:
      case MBTI.enfp:
        return ColorStyles.greenDeep;

      case MBTI.isfj:
      case MBTI.istj:
      case MBTI.esfj:
      case MBTI.estj:
        return ColorStyles.blueDeep;

      case MBTI.isfp:
      case MBTI.istp:
      case MBTI.esfp:
      case MBTI.estp:
        return ColorStyles.orangeDeep;
    }
  }

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

  String toTypeName() {
    switch (this) {
      case MBTI.intj:
      case MBTI.intp:
      case MBTI.entj:
      case MBTI.entp:
        return "분석형";

      case MBTI.infj:
      case MBTI.infp:
      case MBTI.enfj:
      case MBTI.enfp:
        return "외교형";

      case MBTI.isfj:
      case MBTI.istj:
      case MBTI.esfj:
      case MBTI.estj:
        return "관리자형";

      case MBTI.isfp:
      case MBTI.istp:
      case MBTI.esfp:
      case MBTI.estp:
        return "탐험가형";
    }
  }

  String toTypeCode() {
    switch (this) {
      case MBTI.intj:
      case MBTI.intp:
      case MBTI.entj:
      case MBTI.entp:
        return "NT";

      case MBTI.infj:
      case MBTI.infp:
      case MBTI.enfj:
      case MBTI.enfp:
        return "NF";

      case MBTI.isfj:
      case MBTI.istj:
      case MBTI.esfj:
      case MBTI.estj:
        return "SJ";

      case MBTI.isfp:
      case MBTI.istp:
      case MBTI.esfp:
      case MBTI.estp:
        return "SP";
    }
  }

  String toSubTitle() {
    switch (this) {
      case MBTI.intj:
        return "용의주도한 전략가";
      case MBTI.intp:
        return "논리적인 사색가";
      case MBTI.entj:
        return "대담한 통솔자";
      case MBTI.entp:
        return "뜨거운 논쟁을 즐기는 변론가";

      case MBTI.infj:
        return "통찰력 있는 선지자";
      case MBTI.infp:
        return "열정적인 중재자";
      case MBTI.enfj:
        return "정의로운 사회운동가";
      case MBTI.enfp:
        return "재기발랄한 활동가";

      case MBTI.isfj:
        return "용감한 수호자";
      case MBTI.istj:
        return "청렴결백한 논리주의자";
      case MBTI.esfj:
        return "사교적인 외교관";
      case MBTI.estj:
        return "엄격한 관리자";

      case MBTI.isfp:
        return "호기심 많은 예술가";
      case MBTI.istp:
        return "논리적인 실용주의자";
      case MBTI.esfp:
        return "자유로운 영혼의 연예인";
      case MBTI.estp:
        return "모험을 즐기는 사업가";
    }
  }

  String toTitle() {
    switch (this) {
      case MBTI.intj:
        return "과학자형";
      case MBTI.intp:
        return "아이디어 뱅크형";
      case MBTI.entj:
        return "지도자형";
      case MBTI.entp:
        return "발명가형";

      case MBTI.infj:
        return "예언자형";
      case MBTI.infp:
        return "잔다르크형";
      case MBTI.enfj:
        return "언변능숙형";
      case MBTI.enfp:
        return "스파크형";

      case MBTI.isfj:
        return "수호자형";
      case MBTI.istj:
        return "세상의 소금형";
      case MBTI.esfj:
        return "친선도모형";
      case MBTI.estj:
        return "사업자형";

      case MBTI.isfp:
        return "성인군자형";
      case MBTI.istp:
        return "백과사전형";
      case MBTI.esfp:
        return "사교형";
      case MBTI.estp:
        return "활동가형";
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
