import 'package:flutter/material.dart';
import 'package:nti_final_project/core/helper/extentions/media_query.dart';

import '../../../../core/style/app_text_style.dart';
class GroupTaskCard extends StatelessWidget {
  final BuildContext context;
  final String title;
  final String time;

  const GroupTaskCard(this.context, this.title, this.time, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(this.context.w(12)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppStyle.title30White),
            SizedBox(height: this.context.h(6)),
            Text(time, style: AppStyle.body14Grey),
          ],
        ),
      ),
    );
  }
}