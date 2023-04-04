class Valid {
  Valid._();

  static final password = RegExp(r'^(?=.*\d)(?=.*[a-zA-Z])[\da-zA-Z]{8,16}$');

  static final nickname = RegExp(r'^[ㄱ-ㅎ가-힣a-zA-Z]{1,8}$');
}
