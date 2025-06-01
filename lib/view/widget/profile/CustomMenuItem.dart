import 'package:flutter/material.dart';
import 'package:orderly/core/them/app_colors.dart';

class CustomMenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  final VoidCallback onTap;
  final bool isLogout;

  const CustomMenuItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.iconColor,
    required this.onTap,
    this.isLogout = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  //   final backgroundColor =
  //       isLogout ? const Color(0xFFFFF5F5) : const Color(0xFFF8F9FA);
    final borderColor =
        isLogout ? const  Color(0xFFE9ECEF): const Color(0xFFE9ECEF);
  //   final textColor =
  //       isLogout ? const Color(0xFFE53E3E) : const Color(0xFF495057);
  //   final arrowColor =
  //       isLogout ? const Color(0xFFE53E3E) : const Color(0xFF6C757D);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Material(
        color: AppColors.accent1,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: borderColor),
            ),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                Icon(
                  icon,
                  color: isLogout ? AppColors.primary : iconColor,
                  size: 22,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.accent31,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.accent31,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
