import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:orderly/view/screen/main_home.dart';

class LocationController extends GetxController {
  var locationMessage = "اضغط على الزر للحصول على الموقع";
  var isLoading = false;

  Future<void> getCurrentLocation() async {
    isLoading = true;
    update();

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        locationMessage = "تم رفض إذن الموقع";
        isLoading = false;
        update();
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      locationMessage = "إذن الموقع مرفوض نهائيًا، يرجى تفعيله من الإعدادات";
      isLoading = false;
      update();
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      locationMessage =
          "خط العرض: ${position.latitude}, خط الطول: ${position.longitude}";

      // لما ينجح بالحصول على الموقع، ننتقل للـ MainHome
      isLoading = false;
      update();

      // تنقل للصفحة الرئيسية (بدل الشاشة الحالية)
      Get.off(() => MainHome());
    } catch (e) {
      locationMessage = "فشل في الحصول على الموقع: $e";
      isLoading = false;
      update();
    }
  }
}
