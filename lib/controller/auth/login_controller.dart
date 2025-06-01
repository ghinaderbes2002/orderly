import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderly/core/classes/staterequest.dart';
import 'package:orderly/core/services/auth/auth_service.dart';

abstract class LoginController extends GetxController {
  login();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController phone;
  late TextEditingController password;

  Staterequest staterequest = Staterequest.none;
  bool isPasswordHidden = true;

  final AuthService authService = AuthService();

  @override
  login() async {
    if (formState.currentState!.validate()) {
      staterequest = Staterequest.loading;
      update();
      staterequest = await authService.loginUser(
        phone: phone.text,
        password: password.text,
      );
      update();

      if (staterequest == Staterequest.success) {
        // Navigate to home or save token
        // Get.offAll(() => const MainHome());
      }
    }
  }

  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    update();
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'الرجاء إدخال كلمة المرور';
    if (value.length < 6) return 'كلمة المرور يجب أن تكون 6 خانات على الأقل';
    return null;
  }

  @override
  void onInit() {
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
