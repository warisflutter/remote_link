import 'package:flutter/material.dart';

import '../core/colors.dart';

Widget buildSettingTile(
    ThemeData theme, {
      required IconData icon,
      required String title,
      required bool switchValue,
      required Function(bool) onChanged,
      Function()? onTap,
    }) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 22, color: theme.iconTheme.color),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: theme.textTheme.bodyLarge?.copyWith(fontSize: 15),
            ),
          ),
          Switch(
            value: switchValue,
            activeColor: AppColors.primary,
            onChanged: onChanged,
          ),
        ],
      ),
    ),
  );
}

Widget buildDivider() {
  return Container(
    height: 1,
    color: Colors.white12,
    margin: const EdgeInsets.symmetric(horizontal: 0),
  );
}