import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderly/core/services/SharedPreferences.dart';
import 'package:orderly/routes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      getPages: routes,
    );
  }
}
