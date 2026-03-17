import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/core/helper/extentions/media_query.dart';
import 'package:nti_final_project/core/style/app_colors.dart';
import 'package:nti_final_project/core/style/app_text_style.dart';
import '../cubit/cubit.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.h(16)),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Sign $text with',
              style: AppStyle.body16White.copyWith(fontSize: context.sp(16)),
            ),
            SizedBox(width: context.w(80)),

            Container(
              width: context.w(40),
              height: context.w(40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(context.w(5)),
              ),
              child: const Icon(Icons.apple, color: AppColors.greyText),
            ),

            SizedBox(width: context.w(12)),

            GestureDetector(
              onTap: () {
                context.read<AuthCubit>().signInWithGoogle();
              },
              child: Container(
                width: context.w(40),
                height: context.w(40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(context.w(5)),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/google_image.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
