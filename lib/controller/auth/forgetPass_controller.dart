import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderly/core/classes/staterequest.dart';

abstract class ForgetPassController extends GetxController {
}

class ForgetPassControllerImp extends ForgetPassController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController phone;

  Staterequest staterequest = Staterequest.none;


  
  @override
  void onInit() {
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    phone.dispose();
    super.dispose();
  }
}
