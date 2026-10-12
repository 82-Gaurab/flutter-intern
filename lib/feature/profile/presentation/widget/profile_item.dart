import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback onTap;
  final IconData icon;

  const ProfileItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: backgroundColor ?? Color(0xFFf0ebea),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: (Color(0xfff0ebea)).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: textColor ?? Colors.black54, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: textColor ?? Colors.black87,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: textColor ?? Colors.black54,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
