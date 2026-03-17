import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/core/data_source/models/task_model.dart';
import 'package:nti_final_project/core/helper/extentions/media_query.dart';
import 'package:nti_final_project/features/home/presentation/home_cubit/home_cubit.dart';

import '../../../../core/style/app_text_style.dart';
import '../../../../core/widgets/app_bar_widget.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      height: context.h(812),
      padding: EdgeInsets.all(context.w(25)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildAppBarWidgets(),
          SizedBox(height: context.h(16)),

          Text(
            "Incomplete Tasks",
            style: AppStyle.body16White.copyWith(
              fontSize: context.sp(18),
              color: Colors.white,
            ),
          ),
          SizedBox(height: context.h(10)),

          // Incomplete Tasks List
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is Loading) {
                return Center(child: CircularProgressIndicator());
              }
              else if (state is Showtasks) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.tasks.length,
                    itemBuilder: (context, index) {
                      final incompleteTasks = state.tasks[index].isDone == false;
                      List<TaskModel> tasks = state.tasks.where((element) => element.isDone == incompleteTasks,) as List<TaskModel>;
                      return Card(
                        margin: EdgeInsets.only(bottom: context.h(10)),
                        child: ListTile(
                          title: Text(
                            tasks[index].taskTitle,
                            style: TextStyle(fontSize: context.sp(14)),
                          ),
                          subtitle: Text(
                            "${tasks[index].taskDate} | ${tasks[index].taskTime}",
                            style: TextStyle(fontSize: context.sp(12)),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      );
                    },
                  ),
                );
              }
              else {
                return SizedBox(
                  height: context.h(200),
                  child: Center(child: Text("No tasks yet ❤️" , style: AppStyle.body14Grey,)),
                );
              }
            },
          ),

          Text(
            "Complete Tasks",
            style: AppStyle.body16White.copyWith(
              fontSize: context.sp(18),
              color: Colors.white,
            ),
          ),
          SizedBox(height: context.h(10)),

          // Complete Tasks List
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is Loading) {
                return Center(child: CircularProgressIndicator());
              }
              else if (state is Showtasks) {

                return Expanded(
                  child: ListView.builder(
                    itemCount: state.tasks.length,
                    itemBuilder: (context, index) {
                      final incompleteTasks = state.tasks[index].isDone == true;
                      List<TaskModel> tasks = state.tasks.where((element) => element.isDone == incompleteTasks,) as List<TaskModel>;
                      return Card(
                        margin: EdgeInsets.only(bottom: context.h(10)),
                        color: Colors.grey[300],
                        child: ListTile(
                          title: Text(
                            tasks[index].taskTitle,
                            style: TextStyle(fontSize: context.sp(14)),
                          ),
                          subtitle: Text(
                            "${tasks[index].taskDate} | ${tasks[index].taskTime}",
                            style: TextStyle(fontSize: context.sp(12)),
                          ),
                          trailing: Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
              else {
                return SizedBox(
                  height: context.h(200),
                  child: Center(child: Text("No tasks yet ❤️" , style: AppStyle.body14Grey,)),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
