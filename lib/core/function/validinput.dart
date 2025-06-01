import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "الرجاء إدخال الاسم";
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return " الرجاء إدخال البريد الالكتروني";
    }
  }
  
  if (type == "address") {
    if (val == null || val.isEmpty) {
      return "الرجاء إدخال العنوان";
    }
    if (val.length < 3) {
      return "العنوان يجب أن يحتوي على 3 أحرف على الأقل";
    }
  }


  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "الرجاء إدخال رقم الهاتف";
    }
  }

  if (val.isEmpty) {
    return "can't be Empty";
  }

  if (val.length < min) {
    return "can't be less than $min";
  }

  if (val.length > max) {
    return "can't be larger than $max";
  }
}
