// item_of_settings.dart
import 'package:flutter/material.dart';
import 'package:nti_final_project/core/helper/extentions/media_query.dart';
import 'package:nti_final_project/core/style/app_colors.dart';
import 'package:nti_final_project/core/style/app_text_style.dart';


class BuildItemOfSettingsScreen extends StatelessWidget {
  final IconData icons;
  final String nameOfItem;
  final void Function()? onPressed;
  const BuildItemOfSettingsScreen({super.key, required this.nameOfItem, required this.icons, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      height: context.h(70),
      child: Column(
        children: [
          ListTile(
            title: Text(
              nameOfItem,
              style: AppStyle.body16White.copyWith(fontSize: context.sp(18)),
            ),
            leading: Icon(icons ,color: AppColors.whiteColor,),
            onTap: () {},
            trailing: IconButton(onPressed: onPressed, icon: Icon(Icons.arrow_forward_ios ,color: Color(0xff86DAED),)),
          ),
          const Divider(color: Colors.grey),
        ],
      ),
    );
  }
}
