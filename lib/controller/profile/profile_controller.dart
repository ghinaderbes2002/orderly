// lib/controller/profile_controller.dart
import 'package:get/get.dart';
import 'package:orderly/core/classes/staterequest.dart';
import 'package:orderly/core/services/auth/auth_service.dart';


  abstract class ProfileController extends GetxController {
    logout();
    fetchProfile();
}

class ProfileControllerimp extends ProfileController {
  String name = '';
  Staterequest status = Staterequest.none;

  final AuthService authService = AuthService();

  
@override
  Future<void> fetchProfile() async {
    status = Staterequest.loading;
    update();

    final response = await authService.getProfile();

    // if (response != null) {
    //   name = response['name'] ?? '';
    //   status = Staterequest.success;
    // } else {
    //   status = Staterequest.failure;
    // }

    update();
  }

@override
  Future<void> logout() async {
    await authService.logout();
    Get.offAllNamed('/login'); // رجع للمسار المناسب عندك
  }


  @override
  void onInit() {
    fetchProfile();
    super.onInit();
  }
}
