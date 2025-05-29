import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderly/core/classes/staterequest.dart';

abstract class ForgetPassController extends GetxController {
}

class ForgetPassControllerImp extends ForgetPassController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController email;

  Staterequest staterequest = Staterequest.none;


  
  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
