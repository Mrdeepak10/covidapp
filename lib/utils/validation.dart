String? requiredField(val, field) {
  if (val.isEmpty) return '$field is required';
}

validEmailField(val, field) {
  final RegExp nameExp =
       RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
  if (!nameExp.hasMatch(val)) return 'Please enter valid email address.';
}

String validateEmpty(String value, fieldName) {
  if (value == '') return fieldName + " is required";
  return 'success';
}

validRefereceField(val, field) {
  final RegExp nameExp =
       RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
  if (!nameExp.hasMatch(val)) return 'Please enter a valid email id.';
}

validPasswordField(val, field) {
  final RegExp nameExp =  RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$');
  if (!nameExp.hasMatch(val)) {
    return "Password is not secure.\nMust contain 1 uppercase, 1 lowercase,\n1 number";
  }
}

validPasswordFormet(val) {
  final RegExp nameExp =
       RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[-.@!$£%&#]).{8,15}$');
  if (!nameExp.hasMatch(val)) {
    return "Password must be a combination of uppercase, lowercase, numerical and special characters";
  }
}

passwordNum(val, field, [min = '8', max = '18']) {
  final RegExp nameExp =  RegExp("^\\w{$min,$max}\$");
  if (val != "") {
    if (!nameExp.hasMatch(val)) return "Please enter 8 digit number";
  }
  return null;
}

referenceFormate(val) {
  final RegExp nameExp =  RegExp(r'^[A-z0-9-. ()@$£%&#]+$');
  if (!nameExp.hasMatch(val)) return "allowed alpha and -.()@\$£%&# with space";
}

otpCode(val, field, [min = '6', max = '6']) {
  final RegExp nameExp =  RegExp("^\\w{$min,$max}\$");
  if (!nameExp.hasMatch(val)) return "OTP must be of 6-digits";
}

vage(val, field, [min = '18', max = '99']) {
  final RegExp nameExp =  RegExp("^\\w{$min,$max}\$");
  if (!nameExp.hasMatch(val)) return "Min age 18";
}

docNum(val, field, [min = '5', max = '8']) {
  final RegExp nameExp =  RegExp("^\\w{$min,$max}\$");
  if (val != "") {
    if (!nameExp.hasMatch(val)) return "Please enter 5 digit number";
  }
  return null;
}

phoneNo(val, fieldName) {
  RegExp nameExp =  RegExp(r'^([0-9]{10})$');
  if (val != "") {
    if (val.length != 10) {
      return fieldName + " should be 10 charectors long";
    } else if (!nameExp.hasMatch(val)) {
      return fieldName + " should be in correct Indian format";
    }

    return null;
  }
  return null;
}

postCode(val, fieldName) {
  RegExp nameExp =  RegExp(
      r'^([a-zA-Z]{1,2}([0-9]{1,2}|[0-9][a-zA-Z])( {0,1})[0-9][a-zA-Z]{2})$');
  if (!nameExp.hasMatch(val)) return fieldName + " should be in correct format";

  return null;
}

alphaSpaceNumber(val, fieldName) {
  RegExp nameExp =  RegExp(r'^[a-zA-Z0-9.-; ]+$');
  print(val);
  if (val != "") {
    if (!nameExp.hasMatch(val)) return fieldName + ' has invalid format';
    return null;
  }
  return null;
}

commonValidation(val, fieldName, exp) {
  RegExp nameExp =  RegExp(exp);
  if (val != "") {
    var matchResult = nameExp.hasMatch(val);
    if (matchResult == false) {
      return fieldName + ' has invalid format';
    } else {
      return null;
    }
  }
  return null;
}

sortCode(val, fieldName) {
  RegExp nameExp =  RegExp(r'^[0-9-]+$');
  if (val != "") {
    if (!nameExp.hasMatch(val)) return fieldName + ' has invalid format';
    return null;
  }
  return null;
}

alphaSpace(val, fieldName) {
  RegExp nameExp =  RegExp(r'^[a-zA-Z ]+$');
  print(val);
  if (val != "") {
    if (!nameExp.hasMatch(val)) return fieldName + ' has invalid format';
    return null;
  }
  return null;
}

alphaNumber(val, fieldName) {
  RegExp nameExp =  RegExp(r'^[a-zA-Z0-9#&()-`.,"]*$');
  if (val != "") {
    if (!nameExp.hasMatch(val)) return fieldName + ' has invalid format';
    return null;
  }
  return null;
}

oneDotAllowed(val, field) {
  final RegExp oneDot = RegExp(r'(^[0-9]+(\.[0-9]+)?)$');
  if (!oneDot.hasMatch(val)) return "invalid amount";
}

String validateEmptyDropdown(String value, fieldName) {
  if (value == null || value == '') return fieldName + " is required";
  return 'success';
}

String? matchFields(String value, fieldName, String value1, fieldName1) {
  if (value != value1) return fieldName1 + " & " + fieldName + " should same";
  return null;
}

String? numbersOnly(String value, fieldName) {
  print("blank");
  RegExp nameExp =  RegExp(r'^\d+$');
  if (value != "") {
    if (!nameExp.hasMatch(value)) {
      return fieldName + " should be numeric only  ";
    }
  }
  return null;
}

String? floatOnly(val, fieldName) {
  RegExp number = RegExp(r'^[0-9.;]+$');
  if (val != "") {
    if (!number.hasMatch(val)) return fieldName + " should be numeric only ";
  }
  return null;
}

String? minLength(String value, fieldName, minLength) {
  if (value != "") {
    if (value.length < minLength) {
      return fieldName +
          " should be minimum " +
          minLength.toString() +
          " characters";
    }
  }
  return null;
}

String? maxLength(String value, fieldName, maxLength) {
  if (value != null) {
    if (value.length > maxLength) {
      return fieldName +
          " should be at most " +
          maxLength.toString() +
          " characters";
    }
  }
  return null;
}

String? exactLength(String value, fieldName, exactLength) {
  if (value != null) {
    if (value.length != exactLength) {
      return fieldName +
          " should be exact " +
          exactLength.toString() +
          " characters";
    }
  }
  return null;
}

String? validateCardNum(String input) {
  if (input.isEmpty) {
    return "Card Number is required.";
  }

  if (input.length < 8) {
    // No need to even proceed with the validation if it's less than 8 characters
    return "Card Number is not valid.";
  }

  int sum = 0;
  int length = input.length;
  for (var i = 0; i < length; i++) {
    // get digits in reverse order
    int digit = int.parse(input[length - i - 1]);

    // every 2nd number multiply with 2
    if (i % 2 == 1) {
      digit *= 2;
    }
    sum += digit > 9 ? (digit - 9) : digit;
  }

  if (sum % 10 == 0) {
    return null;
  }

  return "Card Number is not valid.";
}
