import 'package:flutter/material.dart';

import '../core/colors.dart';

// Camera Buttons
Widget cameraButton({
  required String title,
  required IconData icon,
  required bool active,
  required ThemeData theme,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
    decoration: BoxDecoration(
      color: active
          ? AppColors.primary
          : (theme.brightness == Brightness.dark
          ? Colors.white12
          : Colors.black12),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      children: [
        Icon(icon, color: Colors.white, size: 20),
        const SizedBox(width: 6),
        Text(
          title,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    ),
  );
}

// Small bottom icons
Widget smallIconButton({
  required IconData icon,
  required ThemeData theme,
}) {
  final isDark = theme.brightness == Brightness.dark;

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 8),
    decoration: BoxDecoration(
      color: isDark ? Colors.white12 : Colors.black12,
      borderRadius: BorderRadius.circular(18),
    ),
    child: Icon(icon, size: 22, color: theme.iconTheme.color),
  );
}