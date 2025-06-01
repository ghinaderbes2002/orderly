import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:orderly/core/constant/App_routes.dart';
import 'package:orderly/view/screen/auth/authScreen.dart';
import 'package:orderly/view/screen/location.dart';
import 'package:orderly/view/screen/onBoardimg.dart';
import 'package:orderly/view/screen/profile/address.dart';
import 'package:orderly/view/screen/profile/updateProfile.dart';
import 'package:orderly/view/screen/search.dart';
import 'package:orderly/view/screen/splash.dart';
import 'package:orderly/view/widget/auth/OtpVerificationForm.dart';


List<GetPage<dynamic>>? routes = [
  
  GetPage(
    name: "/",
    page: () => const SplashScreen(),
  ),
  //  GetPage(
  //   name: "/",
  //   page: () =>  LocationScreen(),
  // ),

  GetPage(
    name: AppRoute.onBoarding,
    page: () => const OnBoarding(),
  ),

  GetPage(
    name: AppRoute.auth,
    page: () => const AuthPage(),
  ),

   GetPage(
    name: AppRoute.search,
    page: () => const Search(),
  ),

   GetPage(
    name: AppRoute.updateprofile,
    page: () => const Updateprofile(),
  ),

   GetPage(
    name: AppRoute.otpVerificationForm,
    page: () => OtpVerificationForm(),
  ),

   GetPage(
    name: AppRoute.updateprofile,
    page: () => const AddressScreen(),
  ),
];
