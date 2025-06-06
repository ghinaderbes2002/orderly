import 'package:flutter/material.dart';
import 'package:orderly/core/them/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? buttonColor; // خاصية اختيارية لتغيير اللون

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.buttonColor, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 675,
      left: 24,
      child: SizedBox(
        width: 327,
        height: 62,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor ??
                AppColors.primary, // لو ما حددت، استخدم اللون الأساسي
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
