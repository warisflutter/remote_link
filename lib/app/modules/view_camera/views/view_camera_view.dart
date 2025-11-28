import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/colors.dart';
import '../../../widget/front_camera_button.dart';
import '../controllers/view_camera_controller.dart';

class ViewCameraView extends GetView<ViewCameraController> {
  const ViewCameraView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,

      // --------------------------
      // APP BAR (THEME-BASED)
      // --------------------------
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        elevation: theme.appBarTheme.elevation,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        iconTheme: theme.iconTheme,

        title: Row(
          children: [
            // Back Button
            IconButton(
              icon: Icon(Icons.arrow_back_ios_new, color: theme.iconTheme.color),
              onPressed: () => Get.back(),
            ),

            const SizedBox(width: 70),

            // Title + LIVE
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "John's Phone",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 4),

                Row(
                  children: [
                    const SizedBox(width: 30),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      "LIVE",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    )
                  ],
                )
              ],
            ),

            const Spacer(),

            // Signal Icon
            Container(
              decoration: BoxDecoration(
                color: isDark ? Colors.white12 : Colors.black12,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(6),
              child: Icon(
                Icons.signal_cellular_alt,
                color: theme.iconTheme.color,
              ),
            ),
          ],
        ),
      ),

      // --------------------------
      // BODY
      // --------------------------
        body: Stack(
          children: [
            // Phone Frame (Moved UP using Padding)
            Padding(
              padding: const EdgeInsets.only(bottom: 55), // 🔥 Image ko upar shift
              child: Center(
                child: Container(
                  width: 280,
                  height: 560,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: isDark ? AppColors.cardDark : AppColors.cardLight,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 24,
                        offset: const Offset(0, 20),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      "assets/images/camera.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

            // Bottom Controls (More space at bottom)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10), // 🔥 Space increased
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // 🔥 Single container holding BOTH buttons
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                        color: theme.brightness == Brightness.dark
                            ? Colors.white12
                            : Colors.black12,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          cameraButton(
                            title: "Front",
                            icon: Icons.rotate_90_degrees_cw_outlined,
                            active: true,
                            theme: theme,
                          ),

                          // Divider between buttons
                          Container(
                            width: 1,
                            height: 28,
                            color: Colors.white24,
                            margin: const EdgeInsets.symmetric(horizontal: 14),
                          ),

                          cameraButton(
                            title: "Back",
                            icon: Icons.rotate_90_degrees_ccw,
                            active: false,
                            theme: theme,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 10), // slightly more spacing

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        smallIconButton(icon: Icons.mic_off, theme: theme),
                        const SizedBox(width: 16),
                        smallIconButton(icon: Icons.nightlight_round, theme: theme),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }

}
