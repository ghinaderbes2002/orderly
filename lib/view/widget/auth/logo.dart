import 'package:flutter/material.dart';
import 'package:orderly/core/constant/App_images.dart';
import 'package:orderly/core/them/app_colors.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(AppImage.logo),
          backgroundColor: Colors.transparent,
        ),
        const SizedBox(height: 15),
        const Text(
          "ORDERLY",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.accent1,
          ),
        ),
      ],
    );
  }
}
