import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderly/core/classes/staterequest.dart';
import 'package:orderly/core/services/auth/auth_service.dart';

abstract class SignUpController extends GetxController {
  signup();
  togglePasswordVisibility();
  String? validatePassword(String? value);
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController name;
  late TextEditingController phone;
  late TextEditingController password;
  late TextEditingController address;

  Staterequest staterequest = Staterequest.none;
  bool isPasswordHidden = true;

  final AuthService  signUpService = AuthService();

  @override
  signup() async {
    if (formState.currentState!.validate()) {
      staterequest = Staterequest.loading;
      update();
      try {
        Staterequest result = await signUpService.signup(
          name: name.text,
          phone: phone.text,
          password: password.text,
          address: address.text,
        );
        staterequest = result;
      } finally {
        update();
      }
    }
  }

  @override
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'الرجاء إدخال كلمة المرور';
    }
    if (value.length < 8) {
      return 'كلمة المرور يجب أن تحتوي على 8 أحرف على الأقل';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'كلمة المرور يجب أن تحتوي على حرف كبير واحد على الأقل';
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'كلمة المرور يجب أن تحتوي على حرف صغير واحد على الأقل';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'كلمة المرور يجب أن تحتوي على رقم واحد على الأقل';
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'كلمة المرور يجب أن تحتوي على رمز خاص واحد على الأقل (@\$!%*?& وغيرها)';
    }
    return null;
  }

  @override
  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    update();
  }

  @override
  void onInit() {
    name = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    address = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    phone.dispose();
    password.dispose();
    address.dispose();
    super.dispose();
  }
}
