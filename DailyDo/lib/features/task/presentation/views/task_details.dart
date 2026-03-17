// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/core/data_source/models/task_model.dart';
import 'package:nti_final_project/core/helper/extentions/media_query.dart';
import 'package:nti_final_project/core/style/app_colors.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../../../../core/style/app_text_style.dart';
import '../../../../core/widgets/custom_action_button.dart';
import '../../../../core/widgets/header_widget.dart';
import '../task_cubit/task_cubit.dart';

class TaskDetailsScreen extends StatelessWidget {
  final int index;

  const TaskDetailsScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        final task = state.tasks[index];

        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.w(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerWidget(
                  context,
                  "Task Details",
                  () => Navigator.pop(context),
                ),

                SizedBox(height: context.h(30)),

                Row(
                  children: [
                    Expanded(
                      child: Text(task.taskTitle, style: AppStyle.body18White),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<TaskCubit>().updateTasks(index, task);
                      },
                      icon: Icon(Icons.edit, color: AppColors.whiteColor),
                    ),
                  ],
                ),

                SizedBox(height: context.h(5)),

                Text(
                  "${task.taskDate} | ${task.taskTime}",
                  style: AppStyle.body14Grey,
                ),

                SizedBox(height: context.h(20)),
                Divider(color: Colors.grey),
                SizedBox(height: context.h(20)),

                Text(
                  task.taskDescription,
                  style: AppStyle.body18White.copyWith(
                    fontSize: context.sp(14),
                  ),
                ),

                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomActionButton(
                      icon: Icons.edit,
                      iconColor: Colors.green,
                      label: "Done",
                      onTap: () {
                        final updatedTask = TaskModel(
                          taskTitle: state.tasks[index].taskTitle,
                          taskDescription: state.tasks[index].taskDescription,
                          taskDate: state.tasks[index].taskDate,
                          taskTime: state.tasks[index].taskTime,
                          isDone: true,
                        );
                        context
                            .read<TaskCubit>()
                            .updateTasks(index, updatedTask)
                            .then((value) {
                              QuickAlert.show(
                                context: context,
                                type: QuickAlertType.success,
                                text: "Task Done",
                                customAsset: "assets/done.gif",
                              );
                            });
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: context.w(15)),
                    CustomActionButton(
                      icon: Icons.delete,
                      iconColor: Colors.red,
                      label: "Delete",
                      onTap: () {
                        context.read<TaskCubit>().removeTasks(index).then((
                          value,
                        ) {
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.error,
                            text: "deleted",
                            customAsset: "assets/delete.gif",
                          );
                        });
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: context.w(15)),
                    CustomActionButton(
                      icon: Icons.close,
                      iconColor: Colors.grey,
                      label: "Close",
                      onTap: () => Navigator.pop(context),
                    ),
                  ],
                ),
                SizedBox(height: context.h(80)),
              ],
            ),
          ),
        );
      },
    );
  }
}
