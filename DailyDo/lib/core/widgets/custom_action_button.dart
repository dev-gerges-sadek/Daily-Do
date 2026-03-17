// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:nti_final_project/core/helper/extentions/media_query.dart';

class CustomActionButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final void Function()? onTap;

  const CustomActionButton({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(context.w(12)),
      onTap: onTap,
      child: Container(
        width: context.w(88),
        height: context.h(71),
        decoration: BoxDecoration(
          color: const Color(0xFF0D1B2A),
          borderRadius: BorderRadius.circular(context.w(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.3),
              blurRadius: context.w(10),
              spreadRadius: context.w(2),
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: context.sp(24)),
            SizedBox(height: context.h(6)),
            Text(label, style: TextStyle(color: Colors.white, fontSize: context.sp(13))),
          ],
        ),
      ),
    );
  }
}
