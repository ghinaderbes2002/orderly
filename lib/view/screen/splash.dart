import 'package:flutter/material.dart';
import 'dart:async';
import 'package:orderly/core/constant/App_images.dart';
import 'package:orderly/core/them/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/onboarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.accent2,
      body: Stack(
        children: [
          // الصورة تغطي الشاشة كاملة
          Positioned.fill(
            child: Image.asset(
              AppImage.splash,
              fit: BoxFit.cover,
            ),
          ),
          // مؤشر التحميل بالمركز
         Align(
            alignment: Alignment(0, 0.2),
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          ),

        ],
      ),
    );
  }
}

