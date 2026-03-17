import 'package:flutter/material.dart';
import 'package:nti_final_project/features/Onboarding/onbourding_screen.dart';
import 'package:nti_final_project/features/auth/signup/sign_up_screen.dart';
import 'package:nti_final_project/features/auth/singin/singin_screen.dart';
import 'package:nti_final_project/features/profile/presentation/view/profile_view.dart';
import 'package:nti_final_project/features/splash/splash_screen.dart';
import '../../features/home/presentation/views/nav_bar.dart';
import '../../features/settings/presentation/view/settings-view.dart';
import '../../features/task/presentation/views/calender_view.dart';
import '../../features/task/presentation/views/task_details.dart';
import '../../features/task/presentation/views/task_view.dart';
import 'app_routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.mainLayout:
    case AppRoutes.splash:
      return MaterialPageRoute(builder: (_) => const SplashScreen());

    case AppRoutes.onboarding:
      return MaterialPageRoute(builder: (_) => const OnboardingScreen());

    case AppRoutes.singin:
      return MaterialPageRoute(builder: (_) => const SinginScreen());

    case AppRoutes.signup:
      return MaterialPageRoute(builder: (_) => const SignUpScreen());

    case AppRoutes.home:
      return MaterialPageRoute(builder: (_) => const HomeScreen());

    case AppRoutes.tasks:
      return MaterialPageRoute(builder: (_) => const TaskScreenBody());

    case AppRoutes.calendar:
      return MaterialPageRoute(builder: (_) => const CalenderScreenBody());

    case AppRoutes.settings:
      return MaterialPageRoute(builder: (_) => const SettingScreen());

    case AppRoutes.profile:
      return MaterialPageRoute(builder: (_) => const ProfileScreen());

    case AppRoutes.taskDetails:
      final task = settings.arguments as int;
      return MaterialPageRoute(
        builder: (_) => TaskDetailsScreen(index: task),
      );

    default:
      return MaterialPageRoute(
        builder: (_) =>
            const Scaffold(body: Center(child: Text('Unknown Route'))),
      );
  }
}
