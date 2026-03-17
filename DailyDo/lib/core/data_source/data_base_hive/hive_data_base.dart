

import 'package:hive/hive.dart';
import 'package:nti_final_project/core/data_source/models/task_model.dart';

class HiveDataBase {

  // Box مخصوص لـ Task
  final Box<TaskModel> _taskBox = Hive.box<TaskModel>("daily");

  // Add Task
  Future<void> addTask(TaskModel task) async {
  await _taskBox.add(task);
  }

  // Get all Tasks
  List<TaskModel> getTasks() {
  return _taskBox.values.toList();
  }

  // Update Task by index
  Future<void> updateTask(int index, TaskModel task) async {
  await _taskBox.putAt(index, task);
  }

  // Remove Task by index
  Future<void> removeTask(int index) async {
  await _taskBox.deleteAt(index);
  }

  //  Clear all tasks
  Future<void> clearAll() async {
  await _taskBox.clear();
  }











}