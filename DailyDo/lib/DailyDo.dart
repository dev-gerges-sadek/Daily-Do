// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/app/routes/routing.dart';
import 'package:nti_final_project/app/routes/app_routes.dart';
import 'package:nti_final_project/core/style/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti_final_project/features/auth/cubit/cubit.dart';
import 'features/home/presentation/home_cubit/home_cubit.dart';
import 'features/task/presentation/task_cubit/task_cubit.dart';

class DailyDoApp extends StatelessWidget {
  const DailyDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => TaskCubit()..loadTasks()),
              BlocProvider(create: (context) => HomeCubit()),
              BlocProvider(create: (context) => AuthCubit()),

            ],
            child: MaterialApp(
              title: 'DailyDo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                scaffoldBackgroundColor: AppColors.primaryBlue,
                fontFamily: 'Poppins',
                appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
              ),
              initialRoute: AppRoutes.mainLayout,
              onGenerateRoute: generateRoute,
            ),
          );
        }
    );
  }
}
