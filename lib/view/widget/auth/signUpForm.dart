import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderly/controller/auth/signUp_controller.dart';
import 'package:orderly/core/function/validinput.dart';
import 'package:orderly/core/them/app_colors.dart';
import 'package:orderly/view/widget/onBoarding/CustomButton.dart';
import 'package:orderly/view/widget/onBoarding/CustomTextFormFiled.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.accent2,
        body: SafeArea(
          child: GetBuilder<SignUpControllerImp>(
            builder: (controller) {
              return SingleChildScrollView(
                child: Form(
                  key: controller.formState,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        // const SizedBox(height: ),
                        CustomTextFormField(
                          controller: controller.name,
                          label: 'الاسم الكامل',
                          hintText: 'أدخل الاسم الكامل',
                          prefixIcon: Icons.person_outline,
                          validator: (val) =>
                              validInput(val!, 3, 100, "username"),
                          isDarkMode: false,
                        ),
                        const SizedBox(height: 16),
                        CustomTextFormField(
                          controller: controller.phone,
                          validator: (val) =>
                              validInput(val!, 10, 100, "phone"),
                          label: "رقم الهاتف ",
                          hintText: "أدخل رقم الهاتف ",
                          prefixIcon: Icons.phone,
                          isDarkMode: false,
                        ),
                        const SizedBox(height: 16),
                        CustomTextFormField(
                          controller: controller.password,
                          label: "كلمة المرور",
                          hintText: "********",
                          prefixIcon: Icons.lock_outline,
                          isPassword: controller.isPasswordHidden,
                          onPasswordToggle: controller.togglePasswordVisibility,
                          validator: controller.validatePassword,
                          isDarkMode: false,
                        ),
                        const SizedBox(height: 16),
                        CustomTextFormField(
                          controller: controller.password,

                          label: " تأكيد كلمة المرور",
                          hintText: "********",
                          prefixIcon: Icons.lock_outline,
                          isPassword: controller.isPasswordHidden,
                          onPasswordToggle: controller.togglePasswordVisibility,
                          validator: controller.validatePassword,
                          isDarkMode: false,
                        ),
                        const SizedBox(height: 40),
                        CustomButton(
                          text: 'إنشاء حساب',
                          onPressed: () {
                            controller.signup();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
