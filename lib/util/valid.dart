class Valid {
  Valid._();

  static final password = RegExp(r'^(?=.*\d)(?=.*[a-zA-Z])[\da-zA-Z]{8,16}$');
}
