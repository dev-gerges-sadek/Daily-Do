import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  final String taskTitle;
  @HiveField(1)
  final String taskDescription;
  @HiveField(2)
  final String taskDate;
  @HiveField(3)
  final String taskTime;
  @HiveField(4)
  final bool isDone;

  TaskModel({
    required this.taskTitle,
    required this.taskDescription,
    required this.taskDate,
    required this.taskTime,
    required this.isDone,
  });

  Map<String, dynamic> toMap() {
    return {
      "title": taskTitle,
      "description": taskDescription,
      "date": taskDate,
      "time": taskTime,
      "isDone": isDone,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      taskTitle: map["title"],
      taskDescription: map["description"],
      taskDate: map["date"],
      taskTime: map["time"],
      isDone: map["isDone"],
    );
  }
}
