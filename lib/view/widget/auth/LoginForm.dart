import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderly/controller/auth/auth_controller.dart';
import 'package:orderly/controller/auth/login_controller.dart';
import 'package:orderly/core/constant/App_images.dart';
import 'package:orderly/core/constant/App_routes.dart';
import 'package:orderly/core/function/validinput.dart';
import 'package:orderly/core/them/app_colors.dart';
import 'package:orderly/view/screen/onBoardimg.dart';
import 'package:orderly/view/widget/onBoarding/CustomButton.dart';
import 'package:orderly/view/widget/onBoarding/CustomTextFormFiled.dart';

class LoginForm extends StatelessWidget {

  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller   = Get.put(LoginControllerImp());
    AuthController controller1  = Get.put(AuthController());


    return Column(
      children: [
        const SizedBox(height: 10),
        CustomTextFormField(
          controller: controller.email,
          label: 'البريد الإلكتروني',
          hintText: 'example@gmail.com',
          prefixIcon: Icons.email_outlined,
          validator: (val) => validInput(val!, 5, 100, "email"),
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
        const SizedBox(height: 8),
       Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // "تذكرني" مع الـ Checkbox على اليمين
            Row(
              children: [
                // Text('تذكرني'),
                // Checkbox(
                //   value: controller.rememberMe,
                //   onChanged: (value) {
                //     controller.toggleRememberMe(value ?? false);
                //   },
                // ),
              ],
            ),

            GestureDetector(
              onTap: () => controller1.switchForm(2),
              child: Text(
                'نسيت كلمة المرور؟',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 40),
        CustomButton(
          text: 'تسجيل الدخول',
          onPressed: () {
            controller.login();
          },
        ),
        const SizedBox(height: 40),

          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("ليس لديك حساب؟"),
            SizedBox(width: 5),
            GestureDetector(
              onTap: () => controller1.switchForm(1),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "إنشاء حساب",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.person_add, size: 18, color: AppColors.primary),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),

        const Row(
          children: [
            Expanded(
              child: Divider(
                color: Color(0xFFDDDDDD),
                thickness: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'أو',
                style: TextStyle(
                  color: Color(0xFF666666),
                  fontSize: 14,
                ),
              ),
            ),
            Expanded(
              child: Divider(
                color: Color(0xFFDDDDDD),
                thickness: 1,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                // أضف هنا منطق تسجيل الدخول بـ Facebook
              },
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: Image.asset(
                  AppImage.facebook,
                  height: 25,
                ),
              ),
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                // أضف هنا منطق تسجيل الدخول بـ Google
              },
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: Image.asset(
                  AppImage.google,
                  height: 25,
                ),
              ),
            ),
          ],
        ),
      
      ],
    );
  }
}
