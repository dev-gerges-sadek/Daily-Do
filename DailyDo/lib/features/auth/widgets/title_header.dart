import 'package:flutter/material.dart';
import 'package:nti_final_project/core/helper/extentions/media_query.dart';
import 'package:nti_final_project/core/style/app_colors.dart';
import 'package:nti_final_project/core/style/app_text_style.dart';

class TitleHeaderWidget extends StatelessWidget {
  const TitleHeaderWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Welcome Back to ',
            style: AppStyle.title25White.copyWith(fontSize: context.sp(20)),
          ),
          TextSpan(
            text: 'DO IT\n',
            style: AppStyle.title25White.copyWith(
              fontSize: context.sp(20),
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: text,
            style: AppStyle.body14Grey.copyWith(
              fontSize: context.sp(14),
              color: AppColors.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
