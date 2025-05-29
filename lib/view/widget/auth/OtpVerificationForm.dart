import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderly/controller/auth/otp_controller.dart';
import 'package:orderly/core/them/app_colors.dart';
import 'package:orderly/view/widget/onBoarding/CustomButton.dart';

class OtpVerificationForm extends StatelessWidget {
  OtpVerificationForm({super.key});

  final OtpController controller = Get.put(OtpController());

  Widget buildOtpBox(int index) {
    return Container(
      width: 50,
      height: 60,
      alignment: Alignment.center,
      child: TextField(
        controller: controller.controllers[index],
        focusNode: controller.focusNodes[index],
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        cursorColor: AppColors.primary,
        style: const TextStyle(fontSize: 24),
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: Colors.grey.withOpacity(0.15),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: AppColors.primary,
              width: 2,
            ),
          ),
        ),
        onChanged: (val) => controller.handleInput(val, index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: GestureDetector(
          onTap: () =>
              FocusScope.of(context).unfocus(), // يخفي الكيبورد عند الضغط خارج
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "تم إرسال رمز التحقق إلى بريدك الإلكتروني\nالرجاء إدخاله أدناه",
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.center,
                  children: List.generate(5, (index) => buildOtpBox(index)),
                ),
                const SizedBox(height: 40),
                CustomButton(
                  text: 'التالي',
                  onPressed: controller.verifyOtp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
