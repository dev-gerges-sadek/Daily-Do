
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/data_source/data_base_hive/hive_data_base.dart';
import '../../../../core/data_source/models/task_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final HiveDataBase _dataBase = HiveDataBase();

  void getTasks() {
    emit(Loading());
    try {
      final tasks = _dataBase.getTasks();
      emit(Showtasks(tasks));
    } catch (e) {
      throw e.toString();
    }
  }
}
