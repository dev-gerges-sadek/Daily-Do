import 'package:flutter/material.dart';
import 'package:nti_final_project/core/helper/extentions/media_query.dart';

import '../style/app_colors.dart';


Widget headerWidget(BuildContext context , String title ,void Function()? onTap ){

  return InkWell(
    onTap: onTap,
    child: AppBar(
      leading: Icon(Icons.arrow_back_ios , color: Color(0xff1AA2C0)),
      title: Text(
        title,
        style: TextStyle(fontSize: context.sp(25), color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: AppColors.primaryBlue,
    ),
  );
}