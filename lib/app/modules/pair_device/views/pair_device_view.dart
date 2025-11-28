import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remote_link/app/core/colors.dart';
import 'package:remote_link/app/modules/loading_screen/views/loading_screen_view.dart';
import '../controllers/pair_device_controller.dart';

class PairDeviceView extends GetView<PairDeviceController> {
  const PairDeviceView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pair New Device",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Get.back(),
        ),
      ),

      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 150),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  const SizedBox(height: 10),

                  Text(
                    "Enter Pairing Code",
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "Enter the 6-digit pairing code shown on your other device.",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: isDark ? AppColors.textSecondaryDark : Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 35),

                  // ------ OTP BOXES ------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(6, (index) {
                      return SizedBox(
                        height: 55,
                        width: 45,
                        child: TextField(
                          controller: controller.otpControllers[index],
                          focusNode: controller.otpFocusNodes[index],
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            counterText: "",
                            filled: true,
                            fillColor: isDark ? AppColors.cardDark : AppColors.cardLight,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),

                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              // Move to next field
                              if (index < 5) {
                                controller.otpFocusNodes[index + 1].requestFocus();
                              } else {
                                FocusScope.of(context).unfocus(); // last field
                              }
                            } else {
                              // Backspace → move to previous
                              if (index > 0) {
                                controller.otpFocusNodes[index - 1].requestFocus();
                              }
                            }
                          },
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 130),

                  // ---------- CONNECT BUTTON ----------
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => LoadingScreenView(),
                        transition: Transition.rightToLeft,
                          duration: Duration(milliseconds: 300),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(      // <-- Fix: move style here
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text("Connect"),       // <-- No TextStyle here
                    ),
                  ),

                  const SizedBox(height: 14),

                  // ---------- SCAN QR CODE BUTTON ----------
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isDark ? Colors.white12 : Colors.black12,
                        foregroundColor: AppColors.primary,
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,   // <-- Correct place
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text("🔍  Scan QR Code"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
