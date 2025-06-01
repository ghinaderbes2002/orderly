import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderly/controller/profile/updateProfile_controller.dart';
import 'package:orderly/core/function/validinput.dart';
import 'package:orderly/core/them/app_colors.dart';
import 'package:orderly/view/widget/onBoarding/CustomButton.dart';
import 'package:orderly/view/widget/onBoarding/CustomTextFormFiled.dart';

class Updateprofile extends StatelessWidget {
  const Updateprofile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(UpdateprofileControllerimp());

    return Scaffold(
      backgroundColor: AppColors.accent2,
   appBar: AppBar(
        backgroundColor: AppColors.accent2,
        centerTitle: true,
        title: const Text("المعلومات الشخصية"),
      ),

      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GetBuilder<UpdateprofileControllerimp>(
            builder: (controller) => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFormField(
                    label: 'الاسم',
                    onChanged: controller.updateName,
                    validator: (val) => validInput(val!, 5, 100, "name"),
                    hintText: 'الاسم والكنية',
                    isDarkMode: false,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    label: 'رقم الهاتف',
                    onChanged: controller.updatePhone,
                    keyboardType: TextInputType.phone,
                    validator: (val) => validInput(val!, 5, 100, "phone"),
                    hintText: 'أدخل رقم الهاتف الجديد',
                    isDarkMode: false,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    label: 'العنوان',
                    onChanged: controller.updateAddress,
                    validator: (value) =>
                        value!.isEmpty ? 'الرجاء إدخال العنوان' : null,
                    hintText: 'أدخل العنوان الجديد',
                    isDarkMode: false,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<UpdateprofileControllerimp>(
          builder: (controller) => CustomButton(
            text: 'حفظ',
            onPressed: () {
              controller.saveProfile();
            },
          ),
        ),
      ),
    );
  }
}
