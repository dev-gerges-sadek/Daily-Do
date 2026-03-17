import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/core/helper/extentions/media_query.dart';
import 'package:nti_final_project/core/style/app_colors.dart';
import 'package:nti_final_project/core/widgets/custom_text_feild.dart';
import '../../../../core/data_source/models/task_model.dart';
import '../../../../core/style/app_text_style.dart';
import '../task_cubit/task_cubit.dart';
import '../widgets/task_item.dart';

class TaskScreenBody extends StatefulWidget {
  const TaskScreenBody({super.key});

  @override
  State<TaskScreenBody> createState() => _TaskScreenBodyState();
}

class _TaskScreenBodyState extends State<TaskScreenBody> {
  late TextEditingController searchController;
  late TextEditingController time;
  late TextEditingController discribtion;
  late TextEditingController date;
  late TextEditingController title;

  @override
  void initState() {
    searchController = TextEditingController();
    title = TextEditingController();
    time = TextEditingController();
    discribtion = TextEditingController();
    date = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void addTask() {
      if (date.text.isNotEmpty &&
          time.text.isNotEmpty &&
          discribtion.text.isNotEmpty &&
          title.text.isNotEmpty) {
        final task = TaskModel(
          taskTitle: title.text,
          taskDescription: discribtion.text,
          taskDate: date.text,
          taskTime: time.text,
          isDone: false,
        );

        context.read<TaskCubit>().addTask(task);

        Navigator.of(context).pop();

        title.clear();
        discribtion.clear();
        time.clear();
        date.clear();
      }
    }

    Future<void> pickDate() async {
      DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2018),
        lastDate: DateTime(2030),
        initialDate: DateTime.now(),
      );
      if (picked != null) {
        date.text =
            "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      }
    }

    Future<void> pickTime() async {
      TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (picked != null) {
        time.text = "${picked.hour}:${picked.minute}";
      }
    }

    Future showAddTaskSheet() {
      return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(context.w(25)),
          ),
        ),
        builder: (_) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
              context.w(15),
              context.h(16),
              context.w(15),
              MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: context.w(40),
                    height: context.h(4),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(context.w(25)),
                    ),
                  ),
                  SizedBox(height: context.h(12)),

                  CustomTextField(
                    controller: title,
                    hintText: "Title",
                    width: context.w(358),
                    suffixIcon: const Icon(Icons.title),
                  ),
                  SizedBox(height: context.h(8)),

                  CustomTextField(
                    controller: discribtion,
                    hintText: "Description",
                    width: context.w(358),
                    height: context.h(100),
                    maxLines: 5,
                    suffixIcon: const Icon(Icons.description,),
                  ),
                  SizedBox(height: context.h(14)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextField(
                        controller: date,
                        onTap: pickDate,
                        readonly: true,
                        hintText: "Date",
                        width: context.w(170),
                        suffixIcon: const Icon(Icons.date_range),
                      ),
                      SizedBox(width: context.w(8),),
                      CustomTextField(
                        controller: time,
                        onTap: pickTime,
                        readonly: true,
                        hintText: "Time",
                        width: context.w(170),
                        suffixIcon: const Icon(Icons.timelapse),
                      ),
                    ],
                  ),
                  SizedBox(height: context.h(10)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: context.w(174),
                        child: ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: const BorderSide(
                              color: Colors.blue,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            "Cancel",
                            style: AppStyle.body16White.copyWith(
                              color: AppColors.blackColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.w(174),
                        child: ElevatedButton(
                          onPressed: addTask,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          child: Text("Create", style: AppStyle.body16White),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return SafeArea(
      child: Scaffold(

        // floating Action Button
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: showAddTaskSheet,
          child: Icon(Icons.add, size: context.sp(25), color: Colors.black),
        ),

        body: Padding(
          padding: EdgeInsets.all(context.w(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                width: context.w(252),
                hintText: "Search by task title.....",
                controller: searchController,
                suffixIcon: Icon(Icons.search, color: AppColors.greyText),
              ),
              SizedBox(height: context.h(45)),
              Text("Tasks List", style: AppStyle.body16White),
              SizedBox(height: context.h(10)),

              // Task List
              BlocBuilder<TaskCubit, TaskState>(
                builder: (context, state) {
                  if (state.tasks.isEmpty) {
                    return const Center(child: Text("No Tasks Yet"));
                  }
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.tasks.length,
                      itemBuilder: (context, index) {
                        return BuildCardItem(taskModel: state.tasks[index], index: index,);
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
