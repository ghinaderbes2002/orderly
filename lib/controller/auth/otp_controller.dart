import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderly/core/classes/staterequest.dart';
import 'package:orderly/core/services/auth/auth_service.dart';

class OtpController extends GetxController {
  List<TextEditingController> controllers = List.generate(5, (_) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(5, (_) => FocusNode());

  late String phone;
  late String newPassword;

  final AuthService authService = AuthService();
  Staterequest staterequest = Staterequest.none;

  @override
  void onInit() {
    // استقبل البيانات الممررة من صفحة نسيان كلمة السر
    // phone = Get.arguments['phone'];
    // newPassword = Get.arguments['newPassword'];
    super.onInit();
  }

  void handleInput(String val, int index) {
    if (val.isNotEmpty && index < focusNodes.length - 1) {
      focusNodes[index + 1].requestFocus();
    }
    if (val.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }
  }

  void verifyOtp() async {
    String otpCode = controllers.map((c) => c.text).join();

    if (otpCode.length < 5) {
      Get.snackbar("خطأ", "يرجى إدخال رمز مكون من 5 أرقام");
      return;
    }

    staterequest = Staterequest.loading;
    update();

    final response = await authService.resetPassword(
      phone: phone,
      otp: otpCode,
      newPassword: newPassword,
    );

    staterequest = response;
    update();

    if (staterequest == Staterequest.success) {
      Get.snackbar("تم", "تم تغيير كلمة السر بنجاح");
      Get.offAllNamed("/login");
    }
  }
}
