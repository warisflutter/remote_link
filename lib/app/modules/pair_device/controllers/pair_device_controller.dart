import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PairDeviceController extends GetxController {
  final otpControllers = List.generate(6, (index) => TextEditingController());
  final otpFocusNodes = List.generate(6, (index) => FocusNode());

  String get otpCode =>
      otpControllers.map((c) => c.text).join(); // return full OTP

  @override
  void onClose() {
    for (var c in otpControllers) {
      c.dispose();
    }
    for (var f in otpFocusNodes) {
      f.dispose();
    }
    super.onClose();
  }
}
