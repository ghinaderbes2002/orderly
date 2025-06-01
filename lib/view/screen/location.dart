import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderly/controller/location_controller.dart';
import 'package:orderly/core/constant/App_images.dart';
import 'package:orderly/core/them/app_colors.dart';
import 'package:orderly/view/widget/onBoarding/CustomButton.dart';


class LocationScreen extends StatelessWidget {
  final LocationController controller = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.accent2,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImage.map),
            const SizedBox(height: 40),
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
            const SizedBox(height: 30),
            Text(
              "ORDERLY سيصل تطبيق\nإلى موقعك فقط أثناء استخدامك التطبيق",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: AppColors.accent3),
            ),
          ],
        ),
      ),
    );
  }
}
