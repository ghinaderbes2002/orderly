import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  // عدد خانات OTP
  final int otpLength = 5;

  // الكنترولرات والفوكس نودز لكل خانة
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void onInit() {
    super.onInit();
    controllers = List.generate(otpLength, (_) => TextEditingController());
    focusNodes = List.generate(otpLength, (_) => FocusNode());
  }

  // عند إدخال أو حذف قيمة داخل خانة معينة
  void handleInput(String value, int index) {
    if (value.isNotEmpty) {
      if (index < otpLength - 1) {
        if (index + 1 < focusNodes.length) {
          focusNodes[index + 1].requestFocus();
        }
      } else {
        if (index < focusNodes.length) {
          focusNodes[index].unfocus();
        }
      }
    } else {
      if (index > 0) {
        if (index - 1 >= 0) {
          focusNodes[index - 1].requestFocus();
        }
      }
    }
  }

  // التحقق من الكود
  void verifyOtp() {
    final otp = controllers.map((c) => c.text).join();
    print("رمز OTP المُدخل: $otp");

    // ضيف التحقق الفعلي هون، مثلاً:
    // if (otp == expectedOtp) { ... }
  }

  @override
  void onClose() {
    for (var c in controllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
    super.onClose();
  }
}
