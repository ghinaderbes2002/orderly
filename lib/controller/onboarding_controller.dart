import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:orderly/core/constant/App_routes.dart';
import 'package:orderly/core/services/SharedPreferences.dart';
import 'package:orderly/core/static/static.dart';


abstract class Onboardingcontroller extends GetxController {
  next();
  onPageChanged(int index);
}

class Onboardingcontrollerimp extends Onboardingcontroller {
  int currentPage = 0;
  MyServices myServices = Get.find();

  late PageController pageController;

  @override
  next() {
    // currentPage++;
    if (currentPage == onBoardingList.length - 1) {
      myServices.sharedPref.setString("onBoarded", "1");
      Get.offAllNamed(AppRoute.auth);
    } else {
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
