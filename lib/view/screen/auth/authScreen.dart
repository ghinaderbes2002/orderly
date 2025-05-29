import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderly/controller/auth/auth_controller.dart';
import 'package:orderly/core/them/app_colors.dart';
import 'package:orderly/view/widget/auth/logo.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.secondary,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: GetBuilder<AuthController>(
            builder: (controller) {
              return Form(
                key: controller.formState,
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    // 👇 زر الرجوع يظهر فقط لو currentFormIndex > 0
                    if (controller.currentFormIndex > 0)
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: () {
                              int previousIndex =
                                  controller.currentFormIndex - 1;
                              controller.switchForm(previousIndex);
                            },
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: AppColors.accent2,
                              child: const Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: AppColors.black,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),

                    const Logo(),
                    const SizedBox(height: 30),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        decoration: BoxDecoration(
                          color: AppColors.accent2,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return SingleChildScrollView(
                              padding:
                                  const EdgeInsets.only(bottom: 20, top: 24),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minHeight: constraints.maxHeight,
                                ),
                                child: IntrinsicHeight(
                                  child: controller
                                      .forms[controller.currentFormIndex],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
