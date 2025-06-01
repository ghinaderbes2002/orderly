import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderly/controller/profile/profile_controller.dart';
import 'package:orderly/core/them/app_colors.dart';
import 'package:orderly/view/screen/profile/address.dart';
import 'package:orderly/view/screen/profile/updateProfile.dart';
import 'package:orderly/view/widget/profile/CustomMenuItem.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileControllerimp());

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.accent2,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: AppColors.accent2,
                ),
               child: GetBuilder<ProfileController>(
                  builder: (_) => Text(
                    controller.name.isEmpty
                        ? "جار التحميل..."
                        : controller.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.accent31,
                    ),
                  ),
                ),

              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      CustomMenuItem(
                        icon: Icons.person_outline_outlined,
                        text: 'المعلومات الشخصية',
                        iconColor: AppColors.primary,
                        onTap: () =>
                           { 
                            Get.to(() => const Updateprofile())
                            // _handleMenuTap(context, 'المعلومات الشخصية'),
                            }
                      ),
                      CustomMenuItem(
                        icon: Icons.map_outlined,
                        text: 'إدارة العناوين',
                        iconColor: AppColors.primary,
                        onTap: () =>{
                          Get.to(() => const AddressScreen())

                        }
                        //  _handleMenuTap(context, 'إدارة العناوين'),
                      ),
                      CustomMenuItem(
                        icon: Icons.settings_outlined,
                        text: 'الإعدادات',
                        iconColor: AppColors.primary,
                        onTap: () =>{}
                        //  _handleMenuTap(context, 'الإعدادات'),
                      ),
                      CustomMenuItem(
                        icon: Icons.notifications_none_outlined,
                        text: 'الإشعارات',
                        iconColor: AppColors.primary,
                        onTap: () =>{}
                        //  _handleMenuTap(context, 'الإشعارات'),
                      ),
                      CustomMenuItem(
                        icon: Icons.favorite_outline,
                        text: 'المفضلة',
                        iconColor: AppColors.primary,
                        onTap: () => {}
                        // _handleMenuTap(context, 'المفضلة'),
                      ),
                      CustomMenuItem(
                        icon: Icons.help_center_outlined,
                        text: 'الأسئلة الشائعة',
                        iconColor: AppColors.primary,
                        onTap: () => {}
                        // _handleMenuTap(context, 'الأسئلة الشائعة'),
                      ),
                       CustomMenuItem(
                        icon: Icons.logout_outlined,
                        text: 'تسجيل الخروج',
                        iconColor: AppColors.primary,
                       onTap: () => _handleLogout(context, controller),
                        isLogout: true,
                      ),
                    ],
                  ),
                ),
              ),

              // Logout button
              // Padding(
              //   padding: const EdgeInsets.all(20),
              //   child: CustomMenuItem(
              //     icon: Icons.logout_outlined,
              //     text: 'تسجيل الخروج',
              //     iconColor: AppColors.primary,
              //     onTap: () => _handleLogout(context),
              //     isLogout: true,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

 

  // void _handleMenuTap(BuildContext context, String menuName) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text('تم النقر على: $menuName'),
  //       duration: const Duration(seconds: 1),
  //     ),
  //   );
  // }

void _handleLogout(BuildContext context, ProfileController controller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: const Text('تسجيل الخروج'),
            content: const Text('هل أنت متأكد من أنك تريد تسجيل الخروج؟'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('إلغاء'),
              ),
              TextButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  await controller.logout();
                },
                child: const Text('تأكيد'),
              ),
            ],
          ),
        );
      },
    );
  }

}
