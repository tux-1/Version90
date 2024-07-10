class MyValidators {
  static String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return 'يجب ادخال البريد الالكتروني';
    }
    if (!RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
        .hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return 'يجب ادخال كلمة المرور';
    }
    if (value.length < 6) {
      return 'Password must be atleast 6 characters';
    }
    return null;
  }
}
