import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderly/controller/auth/auth_controller.dart';
import 'package:orderly/controller/auth/forgetPass_controller.dart';
import 'package:orderly/core/function/validinput.dart';
import 'package:orderly/view/widget/onBoarding/CustomButton.dart';
import 'package:orderly/view/widget/onBoarding/CustomTextFormFiled.dart';

class ForgetPassForm extends StatelessWidget {
  const ForgetPassForm({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPassControllerImp controller = Get.put(ForgetPassControllerImp());
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
     const SizedBox(height: 40),
      CustomButton(
        text: 'إرسال',
        onPressed: () {
        controller1.switchForm(3);        },
      ),
      ]
    );
    
  }
}
