import 'package:flutter/material.dart';
import 'package:nti_final_project/core/helper/extentions/media_query.dart';
import 'package:nti_final_project/core/style/app_colors.dart';

class CustomeFormTextField extends StatelessWidget {
  const CustomeFormTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.keyboardType,
    this.validator,
    this.obscureText = false,
    this.labelText,
  });

  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final IconData icon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      style: const TextStyle(color: AppColors.blackColor),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.whiteColor,
        labelText: labelText,
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.greyText),
        prefixIcon: Icon(icon, color: AppColors.blackColor),
        contentPadding: EdgeInsets.symmetric(
          horizontal: context.w(16),
          vertical: context.h(14),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.w(12)),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.w(12)),
          borderSide: BorderSide(color: AppColors.primaryBlue, width: context.w(2)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.w(12)),
          borderSide: const BorderSide(color: AppColors.redColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.w(12)),
          borderSide: BorderSide(color: AppColors.redColor, width: context.w(2)),
        ),
      ),
    );
  }
}
