// log_out_button.dart
import 'package:flutter/material.dart';
import 'package:nti_final_project/core/helper/extentions/media_query.dart';
import 'package:nti_final_project/core/style/app_text_style.dart';
import '../../../../core/style/app_colors.dart';


class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.w(226),
      height: context.h(42),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(context.w(30)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.logout, color: Colors.red),
          SizedBox(width: context.w(5)),
          Text(
            "Logout",
            style: AppStyle.body18White.copyWith(
                color: Colors.red, fontSize: context.sp(16)),
          ),
        ],
      ),
    );
  }
}
