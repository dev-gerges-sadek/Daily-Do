
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data_source/data_base_hive/hive_data_base.dart';
import '../../../../core/data_source/models/task_model.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial(tasks: []));
  final HiveDataBase _dataBase = HiveDataBase();

  void loadTasks() {
    final tasks = _dataBase.getTasks();
    emit(TaskInitial(tasks: tasks));
  }

  Future<void> addTask(TaskModel task) async {
    await _dataBase.addTask(task);

    final tasks = _dataBase.getTasks();

    emit(AddTasks(tasks: tasks));
  }

  Future<void> removeTasks(int index) async {
    await _dataBase.removeTask(index);
    final tasks = _dataBase.getTasks();
    emit(RemoveTasks(tasks: tasks));
  }

  Future<void> updateTasks(int index, TaskModel task) async {
    await _dataBase.updateTask(index, task);
    final tasks = _dataBase.getTasks();
    emit(UpdateTasks(tasks: tasks));
  }
}
