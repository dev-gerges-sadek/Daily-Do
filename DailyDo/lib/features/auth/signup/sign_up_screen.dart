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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController passwordController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();
    nameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
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
              if (state is SignUpSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Sign-Up successful'),
                    backgroundColor: Colors.green,
                  ),
                );

                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.singin,
                  (route) => false,
                );
              } else if (state is SignUpErrorState) {
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
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

                    TitleHeaderWidget(
                      text: 'create an account and Join us now!',
                    ),

                    SizedBox(height: context.h(24)),

                    Text(
                      'Name',
                      style: AppStyle.body14Grey.copyWith(
                        fontSize: context.sp(14),
                      ),
                    ),

                    SizedBox(height: context.h(8)),

                    CustomeFormTextField(
                      controller: nameController,
                      hintText: 'Enter your name',
                      icon: Icons.person_outline,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: context.h(16)),

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
                      icon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!value.contains('@')) return 'Invalid email format';
                        return null;
                      },
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
                      icon: Icons.lock_outline,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.length < 8) {
                          return 'Password must be at least 8 characters';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: context.h(32)),

                    state is SignUpLoadingState
                        ? const Center(child: CircularProgressIndicator())
                        : CustomeCategoryButton(
                            text: 'Save',
                            onTap: () {
                              if (formKey.currentState?.validate() ?? false) {
                                context.read<AuthCubit>().signUp(
                                  emailController.text,
                                  passwordController.text,
                                  nameController.text,
                                );
                              }
                            },
                          ),

                    SizedBox(height: context.h(16)),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: AppStyle.body16White.copyWith(
                            fontSize: context.sp(14),
                            color: AppColors.greyText,
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, AppRoutes.singin),
                          child: Text(
                            'Sign in',
                            style: AppStyle.body16White.copyWith(
                              fontSize: context.sp(14),
                              color: AppColors.secondaryBlue,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: context.h(24)),

                    const OrDivider(text: 'Up'),
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
