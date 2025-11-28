import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:remote_link/app/core/colors.dart';
import 'package:remote_link/app/modules/register/views/register_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).unfocus(); // dismiss keyboard
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 24),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  width: 100,
                  height: 100,
                ),
                const SizedBox(height: 12),
                Text(
                  "Welcome Back",
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Sign in to manage your devices",
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontSize: 16,
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 35),

                // Email field
                TextField(
                  controller: controller.emailController,
                  focusNode: controller.emailFocus,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email, color: theme.iconTheme.color),
                    hintText: "Email Address",
                    hintStyle: theme.inputDecorationTheme.hintStyle,
                    filled: true,
                    isDense:true,
                    fillColor: theme.inputDecorationTheme.fillColor,
                    border: theme.inputDecorationTheme.enabledBorder,
                  ),
                  style: TextStyle(color: theme.textTheme.bodyLarge?.color),
                  onSubmitted: (_) {
                    controller.passwordFocus.requestFocus();
                  },
                ),

                const SizedBox(height: 12),

                // Password field
                Obx(() => TextField(
                  controller: controller.passwordController,
                  focusNode: controller.passwordFocus,
                  textInputAction: TextInputAction.done,
                  obscureText: controller.obscurePassword.value,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: theme.iconTheme.color),
                    hintText: "Password",
                    hintStyle: theme.inputDecorationTheme.hintStyle,
                    filled: true,
                    isDense:true,
                    fillColor: theme.inputDecorationTheme.fillColor,
                    border: theme.inputDecorationTheme.enabledBorder,
                    suffixIcon: IconButton(
                      onPressed: controller.togglePassword,
                      icon: Icon(
                        controller.obscurePassword.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  style: TextStyle(color: theme.textTheme.bodyLarge?.color),
                  onSubmitted: (_) {
                    FocusScope.of(context).unfocus();
                  },
                )),

                const SizedBox(height: 2),

                // Remember Me & Forget Password
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Obx(() => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) =>
                          controller.rememberMe.value = value!,
                          activeColor: AppColors.primary,
                        )),
                        const Text(
                          "Remember me",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      "Forget Password?",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                // Sign up button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();

                      //  Call your signup function
                      controller.signUp(
                        controller.emailController.text,
                        controller.passwordController.text,
                      );

                      Get.to(() => const RegisterView(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 300),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      textStyle: theme.textTheme.labelLarge?.copyWith(
                        color: Colors.white,
                        inherit: true,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      "Sign up",
                      style: TextStyle(inherit: true),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Divider
                Row(
                  children: [
                    Expanded(child: Divider(color: AppColors.dividerDark)),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text("or"),
                    ),
                    Expanded(child: Divider(color: AppColors.dividerDark)),
                  ],
                ),

                const SizedBox(height: 20),

                // Google Sign in button
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    color: AppColors.cardDark,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/google.svg",
                        width: 28,
                        height: 28,
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          "Sign in with Google",
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontSize: 15,
                            color: AppColors.textPrimaryDark,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // Create account text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: AppColors.textSecondaryDark,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      "Create One",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
