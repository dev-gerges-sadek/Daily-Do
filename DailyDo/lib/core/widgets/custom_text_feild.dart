import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti_final_project/core/helper/extentions/media_query.dart';
import 'package:nti_final_project/core/style/app_text_style.dart';
import '../style/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final Widget? suffixIcon;
  final double? width;
  final double? height;
  final bool? isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int? maxLines;
  final bool? readonly ;
  final void Function()? onTap;
  const  CustomTextField(
      {super.key,
        this.onTap,
        this.hintText,
        this.suffixIcon,
        this.readonly,
        this.width,
        this.isPassword,
        this.controller,
        this.keyboardType,
        this.validator,
        this.maxLines,
        this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width ?? 331.w,
        height: height ??  context.h(50) ,
        child: TextFormField(
            onTap: onTap,
            style: AppStyle.body16White,
            readOnly: readonly ?? false,
            controller: controller,
            validator: validator,
            autofocus: false,
            maxLines: maxLines ?? 1,
            obscureText: isPassword ?? false,
            cursorColor: AppColors.primaryBlue,
            keyboardType: keyboardType ?? TextInputType.text,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xff05243E),
              hintText: hintText ?? "",
              hintStyle: AppStyle.body14Grey.copyWith(fontSize: context.sp(12) ),
              contentPadding:
              EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: Color(0xffE8ECF4), width: 1)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(
                      color: AppColors.whiteColor, width: 1)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(color: Colors.red, width: 1)),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(color: Colors.red, width: 1),
              ),
              suffixIcon: suffixIcon,
            )));
  }
}