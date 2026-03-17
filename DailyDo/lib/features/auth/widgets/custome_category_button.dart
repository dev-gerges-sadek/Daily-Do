import 'package:flutter/material.dart';
import 'package:nti_final_project/core/helper/extentions/media_query.dart';
import 'package:nti_final_project/core/style/app_colors.dart';

class CustomeCategoryButton extends StatelessWidget {
  const CustomeCategoryButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.w(4),
        vertical: context.h(8),
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondaryBlue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(context.w(12)),
          ),
          padding: EdgeInsets.symmetric(
            vertical: context.h(14),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: context.sp(14),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
