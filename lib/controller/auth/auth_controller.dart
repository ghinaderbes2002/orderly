import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderly/view/widget/auth/ForgetPassForm.dart';
import 'package:orderly/view/widget/auth/LoginForm.dart';
import 'package:orderly/view/widget/auth/OtpVerificationForm.dart';
import 'package:orderly/view/widget/auth/signUPForm.dart';

class AuthController extends GetxController {
  final formState = GlobalKey<FormState>();
  int currentFormIndex = 0;

  // قائمة النماذج
  final List<Widget> forms = [
    const LoginForm(),
    const SignUpForm(),
    const ForgetPassForm(),
     OtpVerificationForm(),
  ];

  // دالة لتبديل النموذج
  void switchForm(int index) {
    currentFormIndex = index;
    update(); // إشعار GetBuilder بإعادة البناء
  }
}
