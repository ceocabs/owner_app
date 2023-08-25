class DataValidator {
  static String? validateMobile(String? value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);

    var val = value;

    if (val != null) {
      if (val == 0 || value == "") {
        return 'Number can\'t be empty';
      } else if (!regExp.hasMatch(val)) {
        return 'Please enter valid mobile number';
      }
    }

    return null;
  }

  static String? validateEmail(String? value) {
    String pattern = r'\S+@\S+\.\S+';
    RegExp regExp = new RegExp(pattern);

    var val = value;

    if (val != null) {
      if (val == 0 || value == "") {
        return 'Email can\'t be empty';
      } else if (!regExp.hasMatch(val)) {
        return 'Please enter valid email';
      }
    }

    return null;
  }

  static String? compulsoryField(
      {required String? value,
      String? fieldName = "",
      int minLength = 3,
      int maxLength = 100}) {
    if (value == null || value.isEmpty || value == "") {
      return ('$fieldName Can\'t be empty');
    }
    if (value.length < minLength || value.length > maxLength) {
      if (minLength == maxLength) {
        return ('$fieldName should contain $minLength characters');
      } else {
        return ('$fieldName range should be between $minLength-$maxLength');
      }
    }
    return null;
  }
}
