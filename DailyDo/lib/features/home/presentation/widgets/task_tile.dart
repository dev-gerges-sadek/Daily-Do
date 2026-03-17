import 'package:flutter/material.dart';
import 'package:nti_final_project/core/helper/extentions/media_query.dart';

import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_text_style.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final String time;
  final bool isDone;

  const TaskTile({
    super.key,
    required this.title,
    required this.time,
    this.isDone = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: context.h(10)),
      padding: EdgeInsets.all(context.w(14)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(
            isDone ? Icons.check_circle : Icons.radio_button_unchecked,
            color: isDone ? AppColors.greenColor : AppColors.primaryBlue,
          ),
          SizedBox(width: context.w(12)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppStyle.title30White),
                Text(time, style: AppStyle.body14Grey),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }
}
