import 'package:flutter/material.dart';
import 'package:orderly/core/constant/App_images.dart';
import 'package:orderly/model/OnBoardingModel.dart';
import 'package:orderly/view/screen/profile/profile.dart';
import 'package:orderly/view/screen/search.dart';
import 'package:orderly/view/widget/auth/ForgetPassForm.dart';
import 'package:orderly/view/widget/auth/LoginForm.dart';
import 'package:orderly/view/widget/auth/signUpForm.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    title: "كل الأشياء المفضلة لديك",
    image: AppImage.on1,
    description:
        "احصل على جميع أطعمتك المفضلة في مكان واحد، فقط قدِّم طلبك وسنقوم بالتوصيل",
  ),
];



final List<Widget> page = [
   Profile(),
  const SignUpForm(),
  const Search(),
  const SignUpForm(),
  
];
