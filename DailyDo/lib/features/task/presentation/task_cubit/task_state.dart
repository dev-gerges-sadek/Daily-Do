part of 'task_cubit.dart';

@immutable
sealed class TaskState {
  final List<TaskModel> tasks;

  const TaskState({required this.tasks});
}

final class TaskInitial extends TaskState {
  const TaskInitial({required super.tasks});

}

final class Loading extends TaskState {
  const Loading({required super.tasks});
}

final class GetTasks extends TaskState {
  const GetTasks({required super.tasks});
}

final class AddTasks extends TaskState {
  const AddTasks({required super.tasks});
}

final class UpdateTasks extends TaskState {
  const UpdateTasks({required super.tasks});
}

final class RemoveTasks extends TaskState {
  const RemoveTasks({required super.tasks});
}

