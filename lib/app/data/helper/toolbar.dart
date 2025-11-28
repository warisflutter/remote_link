import 'package:flutter/material.dart';

/// Side toolbar icons
class ToolIcon extends StatelessWidget {
  final IconData icon;

  const ToolIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Icon(
        icon,
        size: 26,
        color: Colors.grey,
      ),
    );
  }

}