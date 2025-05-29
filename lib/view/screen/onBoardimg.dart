import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderly/controller/onboarding_controller.dart';
import 'package:orderly/core/them/app_colors.dart';
import 'package:orderly/view/widget/onBoarding/CustomButton.dart';
import 'package:orderly/view/widget/onBoarding/CustomSliderOnBoarding.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Onboardingcontrollerimp controller = Get.put(Onboardingcontrollerimp());

   
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const Expanded(
            child: CustomSliderOnBoarding(),
          ),
          const SizedBox(height: 20),
           CustomButton(
            text: 'ابدأ الان ',
             onPressed: () { 
            controller.next();          
             },
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
