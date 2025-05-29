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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImage.s),
            SizedBox(height: 10),
            Text(
              "ORDERLY",
              style: TextStyle(
                fontSize: 36, // 👈 حجم خط كبير وواضح
                fontWeight: FontWeight.bold, // اختياري: بيعطي ثقل للكلمة
                color: AppColors.black,
                letterSpacing: 2, // اختياري: بيباعد بين الحروف وبيعطي شكل مرتب
              ),
            ),

            CircularProgressIndicator(color: AppColors.primary),
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'dart:async';

// import 'package:orderly/core/constant/App_images.dart';
// import 'package:orderly/core/them/app_colors.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   void goToNextScreen(BuildContext context) {
//     Timer(Duration(seconds: 3), () {
//       Navigator.pushReplacementNamed(context, '/onboarding');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     goToNextScreen(context);

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             // الصورة مع حجم محدد
//             Image.asset(
//   AppImage.splash,
//   width: MediaQuery.of(context).size.width,
//   height: MediaQuery.of(context).size.height,
//   fit: BoxFit.cover, // أو BoxFit.fill حسب النتيجة اللي بدك ياها
// ),


//             // دائرة التحميل فوق الصورة
//             CircularProgressIndicator(
//               strokeWidth: 3,
//               color: AppColors.primary,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
