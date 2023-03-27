extension IntExtension on int {
  DateTime unixTimestampToDateTime() {
    return DateTime.fromMillisecondsSinceEpoch(this * 1000);
  }
}
