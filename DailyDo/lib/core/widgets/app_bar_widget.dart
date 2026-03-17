import 'package:flutter/material.dart';
import 'package:nti_final_project/core/helper/extentions/media_query.dart';
import 'package:nti_final_project/core/style/app_text_style.dart';
class BuildAppBarWidgets extends StatelessWidget {
  const BuildAppBarWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.h(27)),
      child: Row(
        children: [
          Image.asset("assets/image.png", width: context.w(50), height: context.h(50)),
          SizedBox(width: context.w(3)),
          SizedBox(
            width: context.w(267),
            height: context.h(51),
            child: ListTile(
              title: Text("Omar Sayed", style: AppStyle.body16White.copyWith(fontSize: context.sp(18))),
              subtitle: Text("omardowek5@gmail.com"),
              subtitleTextStyle: AppStyle.body14Grey.copyWith(fontSize: context.sp(14)),
            ),
          ),
          Image.asset("assets/Bell.png"),
        ],
      ),
    );
  }
}
