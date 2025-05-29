import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  final List<TextEditingController> controllers =
      List.generate(5, (_) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(5, (_) => FocusNode());

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

  void handleInput(String value, int index) {
    if (value.length == 1 && index < 4) {
      focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }

    bool allFilled = controllers.every((c) => c.text.length == 1);
    if (allFilled) {
      String otp = controllers.map((c) => c.text).join();
      print("OTP: $otp");
      // call verify method here if needed
    }
  }

  void verifyOtp() {
    String otp = controllers.map((c) => c.text).join();
    print("Verifying OTP: $otp");
    // تحقق من الرمز أو أرسل للباك
  }
}
