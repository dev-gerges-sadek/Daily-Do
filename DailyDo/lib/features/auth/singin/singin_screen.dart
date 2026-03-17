import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/app/routes/app_routes.dart';
import 'package:nti_final_project/core/helper/extentions/media_query.dart';
import 'package:nti_final_project/core/style/app_colors.dart';
import 'package:nti_final_project/core/style/app_text_style.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../widgets/custome_category_button.dart';
import '../widgets/custome_form_text_field.dart';
import '../widgets/or_divider.dart';
import '../widgets/title_header.dart';

class SinginScreen extends StatefulWidget {
  const SinginScreen({super.key});

  @override
  State<SinginScreen> createState() => _SinginScreenState();
}

class _SinginScreenState extends State<SinginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: context.w(16),
            vertical: context.h(16),
          ),
          child: BlocConsumer<AuthCubit, AuthStates>(
            listener: (context, state) {
              if (state is LoginSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Welcome Back!'),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.home,
                  (route) => false,
                );
              } else if (state is ResetPasswordSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Check your email to reset password'),
                    backgroundColor: Colors.blue,
                  ),
                );
              } else if (state is LoginErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                    backgroundColor: Colors.red,
                  ),
                );
              } else if (state is ResetPasswordErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              return Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: context.w(30),
                        child: const Image(
                          image: AssetImage('assets/images/Logo.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    SizedBox(height: context.h(24)),

                    TitleHeaderWidget(text: 'Have another productive day!'),

                    SizedBox(height: context.h(32)),

                    Text(
                      'Email',
                      style: AppStyle.body14Grey.copyWith(
                        fontSize: context.sp(14),
                      ),
                    ),

                    SizedBox(height: context.h(8)),

                    CustomeFormTextField(
                      controller: emailController,
                      hintText: 'example@gmail.com',
                      icon: Icons.email,
                      validator: (value) => (value == null || value.isEmpty)
                          ? 'Email is required'
                          : null,
                    ),

                    SizedBox(height: context.h(16)),

                    Text(
                      'Password',
                      style: AppStyle.body14Grey.copyWith(
                        fontSize: context.sp(14),
                      ),
                    ),

                    SizedBox(height: context.h(8)),

                    CustomeFormTextField(
                      controller: passwordController,
                      hintText: '********',
                      icon: Icons.lock,
                      obscureText: true,
                      validator: (value) =>
                          (value == null || value.length < 8)
                              ? '8+ characters required'
                              : null,
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          context.read<AuthCubit>().resetPassword(
                                emailController.text,
                              );
                        },
                        child: Text(
                          'forgot password?',
                          style: AppStyle.body14Grey.copyWith(
                            fontSize: context.sp(12),
                            color: AppColors.greyText,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: context.h(16)),

                    state is LoginLoadingState ||
                            state is ResetPasswordLoadingState
                        ? const Center(child: CircularProgressIndicator())
                        : SizedBox(
                            width: double.infinity,
                            child: CustomeCategoryButton(
                              text: 'Login',
                              onTap: () {
                                if (formKey.currentState?.validate() ?? false) {
                                  context.read<AuthCubit>().login(
                                        emailController.text,
                                        passwordController.text,
                                      );
                                }
                              },
                            ),
                          ),

                    SizedBox(height: context.h(24)),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: AppStyle.body14Grey.copyWith(
                            fontSize: context.sp(14),
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, AppRoutes.signup),
                          child: Text(
                            'Sign Up',
                            style: AppStyle.body16White.copyWith(
                              fontSize: context.sp(14),
                              color: AppColors.secondaryBlue,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: context.h(32)),

                    const OrDivider(text: 'in'),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
