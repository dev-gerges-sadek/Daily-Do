import 'package:flutter/material.dart';
import 'package:nti_final_project/app/routes/app_routes.dart';
import 'package:nti_final_project/core/helper/extentions/media_query.dart';
import '../../../../core/data_source/models/task_model.dart';
import '../../../../core/style/app_text_style.dart';


class BuildCardItem extends StatelessWidget {
   final TaskModel taskModel;
   final int index;
  const BuildCardItem({super.key,required this.taskModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.only(bottom: context.h(10)),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.w(8))),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(left: context.w(15)),
        child: ListTile(
          title: Text(
            taskModel.taskTitle,
            style: AppStyle.body18White.copyWith(
                color: Colors.black, fontSize: context.sp(14)),
          ),
          subtitle: Text(
            "${taskModel.taskDate} | ${taskModel.taskTime}",
            style: AppStyle.body18White.copyWith(
                fontSize: context.sp(12), color: Colors.grey),
          ),
          contentPadding: EdgeInsets.all(context.w(5)),
          trailing: IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppRoutes.taskDetails,
                arguments: index,
              );
              // // مجرد UI placeholder
              // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //     content: Text("Clicked on ")));
            },
            icon: Icon(Icons.arrow_forward_ios , color: Color(0xff0EA5E9),),
          ),
        ),
      ),
    );
  }
}
