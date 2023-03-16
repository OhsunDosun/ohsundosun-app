enum AppMode {
  dev,
  prod;
}

extension StringExtension on String {
  AppMode toAppMode() {
    switch (toLowerCase()) {
      case "dev":
        return AppMode.dev;
      case "prod":
        return AppMode.prod;
      default:
        throw ("not found app mode");
    }
  }
}
