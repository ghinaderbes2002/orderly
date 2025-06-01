// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:line_icons/line_icons.dart';
// import 'package:orderly/controller/navigation_controller.dart';
// import 'package:orderly/core/static/static.dart';
// import 'package:orderly/core/them/app_colors.dart';

// class MainHome extends StatelessWidget {
//   const MainHome({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Navigationcontrollerimp navcontroller = Get.put(Navigationcontrollerimp());

//     return Scaffold(
//       body: GetBuilder<Navigationcontrollerimp>(
//         builder: (controller) => page[controller.selectedIendex],
//       ),
//       bottomNavigationBar: SafeArea(
//         child: Container(
//           margin: const EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(25),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.2),
//                 blurRadius: 10,
//                 offset: const Offset(0, 5),
//               ),
//             ],
//           ),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//             child: GNav(
//               rippleColor: AppColors.primary.withOpacity(0.2),
//               hoverColor: AppColors.primary.withOpacity(0.1),
//               haptic: true,
//               gap: 10,
//               tabBorderRadius: 20,
//               tabBackgroundColor: AppColors.primary.withOpacity(0.1),
//               activeColor: AppColors.primary,
//               color: Colors.black54,
//               iconSize: 26,
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//               duration: const Duration(milliseconds: 300),
//               tabs: const [
//                 GButton(icon: LineIcons.home, text: 'الرئيسية'),
//                 GButton(icon: LineIcons.clock, text: 'المحفوظات'),
//                 GButton(icon: LineIcons.searchLocation, text: 'الطلبات'),
//                 GButton(icon: LineIcons.user, text: 'الحساب'),
//               ],
//               selectedIndex: navcontroller.selectedIendex,
//               onTabChange: (index) {
//                 navcontroller.changeTabIendex(index);
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:orderly/controller/navigation_controller.dart';
import 'package:orderly/core/static/static.dart';
import 'package:orderly/core/them/app_colors.dart';

class MainHome extends StatelessWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Navigationcontrollerimp navcontroller = Get.put(Navigationcontrollerimp());

    return Scaffold(
      body: GetBuilder<Navigationcontrollerimp>(
        builder: (controller) => page[controller.selectedIendex],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1), // ظل أسود خفيف
                blurRadius: 10,
                offset: const Offset(0, -2), // باتجاه الأعلى
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: GNav(
              rippleColor: AppColors.primary.withOpacity(0.2),
              hoverColor: AppColors.primary.withOpacity(0.1),
              haptic: true,
              gap: 10,
              tabBorderRadius: 15,
              tabBackgroundColor: AppColors.primary.withOpacity(0.1),
              activeColor: AppColors.primary,
              color: Colors.black54,
              iconSize: 26,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              duration: const Duration(milliseconds: 300),
              tabs: const [
                GButton(icon: LineIcons.user, text: 'حسابي'),
                GButton(icon: LineIcons.bars, text: 'طلباتي'),
                GButton(icon: LineIcons.search, text: 'البحث'),
                GButton(icon: LineIcons.home, text: 'الرئيسية'),

              ],
              selectedIndex: navcontroller.selectedIendex,
              onTabChange: (index) {
                navcontroller.changeTabIendex(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
