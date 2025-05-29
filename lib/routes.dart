import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:orderly/core/constant/App_routes.dart';
import 'package:orderly/view/screen/auth/authScreen.dart';
import 'package:orderly/view/screen/onBoardimg.dart';


List<GetPage<dynamic>>? routes = [
  GetPage(
    name: "/",
    page: () => const OnBoarding(),
  ),

  GetPage(
    name: AppRoute.auth,
    page: () => const AuthPage(),
  ),
];
