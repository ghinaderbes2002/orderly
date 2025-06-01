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
          controller: controller.phone,
          label: ' رقم الهاتف',
          hintText: 'أدخل رقم الهاتف',
          prefixIcon: Icons.email_outlined,
          validator: (val) => validInput(val!, 9, 15, "phone"),
          isDarkMode: false,
        ),
       const SizedBox(height: 16),
      CustomTextFormField(
        controller: controller.newPassword,
        label: ' كلمة السر الجديدة ',
        hintText: 'أدخل كلمة السر الجديدة ',
        prefixIcon: Icons.email_outlined,
        validator: (val) => validInput(val!, 5, 100, "phone"),
        isDarkMode: false,
      ),
       const SizedBox(height: 16),
    CustomTextFormField(
        controller: controller.confirmPassword,
        label: ' تأكيد كلمة السر',
        hintText: 'أعد كتابة كلمة السر',
        prefixIcon: Icons.lock_outline,
        validator: (val) {
          if (val == null || val.isEmpty) {
            return 'يرجى تأكيد كلمة السر';
          } else if (val != controller.newPassword.text) {
            return 'كلمتا السر غير متطابقتين';
          }
          return null;
        },
        isDarkMode: false,
      ),

     const SizedBox(height: 40),
      CustomButton(
        text: 'إرسال',
        onPressed: () {
          controller.sendResetCode();
        //  controller1.switchForm(3);   
       },
      ),
    ]
    );
    
  }
}
