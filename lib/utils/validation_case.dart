class ValidationCase {
  static String validateEmail(String value) {
    RegExp exp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    if (value.isEmpty) {
      return 'E-mail is empty!';
    } else if (!exp.hasMatch(value.trim())) {
      return 'Invalid e-mail format.';
    }
    return null;
  }

  static String validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password is empty!';
    } else if (value.length < 6) {
      return 'Password length must be greater than 6.';
    }
    return null;
  }
}
