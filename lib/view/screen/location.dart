import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderly/controller/location_controller.dart';
import 'package:orderly/core/constant/App_images.dart';
import 'package:orderly/core/them/app_colors.dart';
import 'package:orderly/view/widget/onBoarding/CustomButton.dart';


class LocationScreen extends StatelessWidget {
  // إنشاء الـ Controller باستخدام Get.put
  final LocationController controller = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Image.asset(
             AppImage.map
            ),
                SizedBox(height: 20),
               GetBuilder<LocationController>(
                  builder: (controller) => CustomButton(
                    text: controller.isLoading
                        ? 'جارٍ التحميل...'
                        : 'الوصول إلى الموقع',
                    onPressed: controller.isLoading
                        ? () {}
                        : controller.getCurrentLocation,
                  ),
                ),
                Text(
                  "سيصل تطبيق ORDERLY إلى موقعك فقط أثناء استخدامك للتطبيق",
                  style: TextStyle(color: AppColors.accent3),
                )

              ],
            ),
          ),
        
        ],
      ),
    );
  }
}