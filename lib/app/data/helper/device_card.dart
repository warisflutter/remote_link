import 'package:flutter/material.dart';
import 'package:remote_link/app/core/colors.dart';

class DeviceCard extends StatelessWidget {
  final String title;
  final String status;
  final bool isOnline;
  final IconData icon;

  final VoidCallback? onTap;

  const DeviceCard({
    super.key,
    required this.title,
    required this.status,
    required this.isOnline,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(height: 4,),
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: isOnline
                                ? AppColors.online
                                : AppColors.offline,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 6,),
                        Text(
                          status,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontSize: 13
                          ),
                        ),
                      ],
                    )
                  ],
                )
            ),
            Icon(icon, color: theme.iconTheme.color,)
          ],
        ),
      ),
    );
  }
}
