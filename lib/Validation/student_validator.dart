class studentValidationMixin {
  String validateFirstName(String value) {
    if (value.length < 2) {
      return "İsim en az iki karakter olmalıdır";
    } else
      return "giriş başarılı";
  }
}
