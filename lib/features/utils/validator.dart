class Validator {
  static String? validateEmail(String value) {
    Pattern pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid email address.';
    } else {
      return null;
    }
  }

  static String? validateDropDefaultData(value, {String? text}) {
    if (value == null || value == '') {
      return text ?? 'Please select an item.';
    } else {
      return null;
    }
  }

  static String? validatePassword(String value) {
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter.';
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter.';
    }

    if (!RegExp(r'\d').hasMatch(value)) {
      return 'Password must contain at least one digit.';
    }

    if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character.';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }

    return null;
  }

  static String? validatePassword1(String value) {
    if (value.length != 6) {
      return 'Password must be 6 digits';
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String value,
      {required String toMatch}) {
    if (toMatch != value) {
      return 'Password must match';
    } else {
      return null;
    }
  }

  static String? validateName(String value) {
    if (value.length < 3) {
      return 'Name is too short';
    } else {
      return null;
    }
  }

  static String? validatePin(String value) {
    if (value.length < 4) {
      return 'Pin must be 6 digits';
    } else {
      return null;
    }
  }

  static String? validateAccountNumber(String value) {
    if (value.length != 10) {
      return 'Account number is invalid';
    } else {
      return null;
    }
  }

  static String? validateBvn(String value, {String? message}) {
    if (value.length != 11) {
      return message ?? 'BVN is invalid';
    } else {
      return null;
    }
  }

  // static String? validateAmount(String value) {
  //   if (value.isEmpty) {
  //     return 'Amount is invalid';
  //   }
  //   final amount = currencyRegEx(value);
  //   if (double.parse(amount) < 1) {
  //     return 'Amount must be 1.00 or more ';
  //   }
  //   return null;
  // }

  static String? fullNameValidate(String fullName) {
    String pattern = r'^[a-z A-Z,.\-]+$';
    RegExp regExp = RegExp(pattern);
    if (fullName.isEmpty) {
      return 'Please enter full name';
    } else if (!regExp.hasMatch(fullName)) {
      return 'Please enter valid full name';
    }
    return null;
  }

  static String? validateText(String value, {String? text}) {
    if (value.isEmpty) {
      return text ?? 'Text is too short.';
    } else {
      return null;
    }
  }

  static String? validateWalletAddress(String value) {
    if (value.isEmpty || value.length < 20) {
      return 'Invalid wallet address';
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return 'Enter phone number';
    } else if (!(value.length > 6 && value.length < 20)) {
      return 'Enter a valid phone number';
    } else {
      return null;
    }
  }
}
