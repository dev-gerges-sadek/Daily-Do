// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:nti_final_project/app/routes/app_routes.dart';
import 'package:nti_final_project/core/helper/extentions/media_query.dart';
import '../../../../core/widgets/header_widget.dart';
import '../widgets/item_of_settings.dart';
import '../widgets/log_out_button.dart';


class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          headerWidget(context,"Settings" , () {
            Navigator.pop(context);
          },),
          SizedBox(height: context.h(105)),
          BuildItemOfSettingsScreen(nameOfItem: "Profile", icons: Icons.person ,onPressed: () => Navigator.pushNamed(context, AppRoutes.profile),),
          BuildItemOfSettingsScreen(nameOfItem: "Conversations", icons: Icons.mode_comment),
          BuildItemOfSettingsScreen(nameOfItem: "Projects", icons: Icons.manage_accounts),
          BuildItemOfSettingsScreen(nameOfItem: "Terms and Policies", icons: Icons.policy_outlined),
          SizedBox(height: context.h(102)),
          const LogOutButton(),
        ],
      ),
    );
  }
}
