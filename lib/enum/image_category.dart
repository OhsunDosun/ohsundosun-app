enum ImageCategory {
  post;

  String toValue() {
    switch (this) {
      case ImageCategory.post:
        return "POST";
    }
  }
}
