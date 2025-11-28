import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/colors.dart';
import '../controllers/loading_screen_controller.dart';

class LoadingScreenView extends GetView<LoadingScreenController> {
  const LoadingScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Remote Control",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: theme.scaffoldBackgroundColor,

        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.close,
            size: 22,
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.wifi_tethering,
              size: 24,
            ),
          ),
        ],
      ),

      body: Column(
        children: [

          const SizedBox(height: 40),

          // ---------------- TOP ANIMATION ----------------
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                _circle(210, isDark),
                _circle(160, isDark),
                _circle(110, isDark),

                // Center Icon (Router)
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.router,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          // ---------------- PHONE IMAGE ----------------
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "assets/images/device.png",
              height: 140,
            ),
          ),

          const SizedBox(height: 40),

          // ---------------- TEXT + PROGRESS ----------------
          Column(
            children: [
              Text(
                "Connecting Secure Channel...",
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 10),

              // Progress bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: LinearProgressIndicator(
                  minHeight: 6,
                  borderRadius: BorderRadius.circular(50),
                  valueColor: AlwaysStoppedAnimation(AppColors.primary),
                  backgroundColor: isDark ? Colors.white12 : Colors.black12,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                "Authenticating Device: iPhone 15 Pro",
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),

          const Spacer(),

          // ---------------- CANCEL BUTTON ----------------
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 300,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isDark ? Colors.white12 : Colors.black12,
                  borderRadius: BorderRadius.circular(50),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Cancel",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- CIRCLES FOR RIPPLE ----------------
  Widget _circle(double size, bool isDark) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isDark ? Colors.white10 : Colors.black12,
          width: 2,
        ),
      ),
    );
  }
}
