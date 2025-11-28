import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // Password visibility
  RxBool obscurePassword = true.obs;

  // Remember me
  RxBool rememberMe = false.obs;

  // Text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Focus nodes
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  void togglePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  void signUp(String email, String password) {
    // Your signup logic
  }

  @override
  void onClose() {
    // Dispose controllers & focus nodes
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    super.onClose();
  }
}
