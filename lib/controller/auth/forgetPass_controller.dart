import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderly/core/classes/staterequest.dart';
import 'package:orderly/core/services/auth/auth_service.dart';

abstract class ForgetPassController extends GetxController {
  sendResetCode();
}

class ForgetPassControllerImp extends ForgetPassController {
  
  final AuthService authService = AuthService();

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController phone;
  late TextEditingController newPassword;
  late TextEditingController confirmPassword ;




  Staterequest staterequest = Staterequest.none;

 
@override
 sendResetCode() async {
    if (formState.currentState!.validate()) {
      // تحقق من تطابق كلمة السر وتأكيدها
      if (confirmPassword.text.trim() != newPassword.text.trim()) {
        Get.snackbar("خطأ", "كلمتا السر غير متطابقتين");
        return;
      }

      staterequest = Staterequest.loading;
      update();

      staterequest = await authService.forgotPassword(
        phone: phone.text.trim(),
      );

      update();

      if (staterequest == Staterequest.success) {
        // انتقل لصفحة OTP ومرر الرقم + كلمة السر الجديدة
        Get.toNamed("/otpVerificationForm", arguments: {
          "phone": phone.text.trim(),
          "newPassword": newPassword.text.trim(),
        });
      }
    }
  }



   @override
  void onInit() {
    phone = TextEditingController();
    newPassword = TextEditingController();
    confirmPassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    phone.dispose();
    newPassword.dispose();
    confirmPassword.dispose();


    super.dispose();
  }
}
