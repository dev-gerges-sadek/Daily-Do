// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/core/data_source/firebase/auth_service.dart';

import 'states.dart';

class AuthCubit extends Cubit<AuthStates> {
  final AuthService authService = AuthService();

  AuthCubit() : super(IntialState());

  //sign up method
  void signUp(String email, String password, String name) async {
    emit(SignUpLoadingState());
    try {
      await authService.signUp(email, password, name);

      emit(SignUpSuccessState());
      print("SIGNUP SUCCESS");
    } catch (e) {
      emit(SignUpErrorState(e.toString()));
    }
  }

  //login method
  void login(String email, String password) async {
    emit(LoginLoadingState());
    try {
      await authService.signIn(email, password);
      emit(LoginSuccessState());
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }

  //sign out method
  void signOut() async {
    await authService.signOut();
    emit(SignOutState());
  }

  //sign in with google method
  void signInWithGoogle() async {
    emit(LoginLoadingState());
    try {
      await authService.signInWithGoogle();
      emit(LoginSuccessState());
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }

  //Forget password method
  void resetPassword(String email) async {
    if (email.isEmpty) {
      emit(ResetPasswordErrorState("Please enter your email first"));
      return;
    }
    emit(ResetPasswordLoadingState());
    try {
      await authService.resetPassword(email);
      emit(ResetPasswordSuccessState());
    } catch (e) {
      emit(ResetPasswordErrorState(e.toString()));
    }
  }
}
