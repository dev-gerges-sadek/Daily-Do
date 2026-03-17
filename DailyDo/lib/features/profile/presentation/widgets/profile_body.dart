import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nti_final_project/core/helper/extentions/media_query.dart';
import 'package:nti_final_project/core/style/app_colors.dart';
import 'package:nti_final_project/core/style/app_text_style.dart';
import 'package:nti_final_project/core/widgets/custom_text_feild.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nti_final_project/core/widgets/header_widget.dart';

class ProfileScreenBody extends StatefulWidget {
  const ProfileScreenBody({super.key});

  @override
  State<ProfileScreenBody> createState() => _ProfileScreenBodyState();
}

class _ProfileScreenBodyState extends State<ProfileScreenBody> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  final ImagePicker _picker = ImagePicker();
  File? imageFile;

  Future<void> pickImageFromGallery() async {
    final XFile? pickedImage =
    await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      imageFile = File(pickedImage.path);
    }
  }

  @override
  void initState() {
    nameController = TextEditingController(text: "omar sayed");
    emailController = TextEditingController(text: "omardowek@gmail.com");
    phoneController = TextEditingController(text: "01507000415");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Padding(
        padding: EdgeInsets.all(context.w(16)),
        child: Column(
          children: [
               headerWidget(context, "", () => Navigator.pop(context),),
            SizedBox(height: context.h(40)),

            InkWell(
              onTap: () async {
                await pickImageFromGallery();
                setState(() {});
              },
              child: CircleAvatar(
                radius: context.w(45),
                backgroundColor: AppColors.greyText,
                backgroundImage:
                imageFile != null ? FileImage(imageFile!) : null,
                child: imageFile == null
                    ? Icon(
                  Icons.person,
                  size: context.sp(40),
                  color: AppColors.whiteColor,
                )
                    : null,
              ),
            ),


            SizedBox(height: context.h(12)),

            Text(
              "Omar Sayed",
              style: AppStyle.body16White.copyWith(
                color: AppColors.blackColor,
                fontSize: context.sp(18),
              ),
            ),

            SizedBox(height: context.h(30)),

            CustomTextField(
              controller: nameController,
              hintText: "Full Name",
              width: double.infinity,
              suffixIcon: const Icon(Icons.person),
            ),

            SizedBox(height: context.h(12)),

            CustomTextField(
              controller: emailController,
              hintText: "Email",
              width: double.infinity,
              suffixIcon: const Icon(Icons.email),
            ),

            SizedBox(height: context.h(12)),

            CustomTextField(
              controller: phoneController,
              hintText: "Phone",
              width: double.infinity,
              suffixIcon: const Icon(Icons.phone),
            ),

            SizedBox(height: context.h(30)),

            SizedBox(
              width: double.infinity,
              height: context.h(48),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: Text(
                  "Save Changes",
                  style: AppStyle.body16White,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
