part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class Loading extends HomeState {}

final class Showtasks extends HomeState {
  final List<TaskModel> tasks ;

  Showtasks(this.tasks);

}





