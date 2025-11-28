import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:remote_link/app/modules/home/views/home_view.dart';
import 'package:remote_link/app/modules/verify_screen/views/verify_screen_view.dart';
import '../../../core/colors.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {

  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());  // 👈 FIX
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),   // 👈 SCREEN TAP → KEYBOARD CLOSE
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: theme.scaffoldBackgroundColor,
          automaticallyImplyLeading: true,
          iconTheme: theme.iconTheme,
          title: Text(
            "Create Account",
            style: theme.textTheme.bodyLarge?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),

        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              // ---------------- TOP ICON ----------------
              Center(
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: isDark ? Colors.white10 : Colors.black12,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person_add_alt,
                    color: theme.iconTheme.color,
                    size: 32,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // ---------------- HEADING ----------------
              Center(
                child: Text(
                  "Create Account",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ---------------- EMAIL ----------------
              Text(
                "Email",
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 3),

              TextField(
                controller: controller.emailController,
                focusNode: controller.emailFocus,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next, // 👈 NEXT BUTTON
                onSubmitted: (_) =>
                    controller.passwordFocus.requestFocus(), // NEXT FIELD
                decoration: const InputDecoration(
                  hintText: "Enter your email",
                  prefixIcon: Icon(Icons.mail_outline),
                ),
              ),

              const SizedBox(height: 15),

              // ---------------- PASSWORD ----------------
              Text(
                "Password",
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 3),

              Obx(() {
                return TextField(
                  controller: controller.passwordController,
                  focusNode: controller.passwordFocus,
                  obscureText: controller.obscurePassword.value,
                  textInputAction: TextInputAction.next, // 👈 NEXT BUTTON
                  onSubmitted: (_) => controller.confirmPasswordFocus.requestFocus(),
                  decoration: InputDecoration(
                    hintText: "Create a password",
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.obscurePassword.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: controller.togglePassword, // 👈 EYE WORKING
                    ),
                  ),
                );
              }),

              const SizedBox(height: 15),

              // ---------------- CONFIRM PASSWORD ----------------
              Text(
                "Confirm Password",
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 3),

              Obx(() => TextField(
                  controller: controller.confirmPasswordController,
                  focusNode: controller.confirmPasswordFocus,
                  obscureText: controller.obscurePassword.value,
                  textInputAction: TextInputAction.done, // 👈 DONE BUTTON
                  onSubmitted: (_) => FocusScope.of(context).unfocus(),
                  decoration: InputDecoration(
                    hintText: "Confirm your password",
                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.obscurePassword.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: controller.togglePassword, // 👈 EYE WORKING
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // ---------------- CREATE ACCOUNT BUTTON ----------------
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    Get.to(() => VerifyScreenView(),
                      transition: Transition.rightToLeft,
                      duration: Duration(milliseconds: 300),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text("Create Account"),
                ),
              ),

              const SizedBox(height: 10),

              // ---------------- DIVIDER ----------------
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: isDark ? Colors.white12 : Colors.black12,
                      thickness: 1.2,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text("or", style: theme.textTheme.bodyMedium),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Divider(
                      color: isDark ? Colors.white12 : Colors.black12,
                      thickness: 1.2,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // ---------------- GOOGLE BUTTON ----------------
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/google.svg",
                      width: 28,
                      height: 28,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Sign in with Google",
                      style: theme.textTheme.bodyMedium?.copyWith(fontSize: 15),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ---------------- LOGIN LINK ----------------
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondaryDark,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    "Sign in",
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
