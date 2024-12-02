import 'dart:io';

import 'package:contact_app/styles/text_styles.dart';
import 'package:contact_app/widgets/custom_divider.dart';
import 'package:contact_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class BottomSheetWidget extends StatefulWidget {
  BottomSheetWidget({super.key});

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey();
    return Padding(
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 16.0,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () {
                      pickImage();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(
                          width: 1,
                          color: const Color(0xffFFF1D4),
                        ),
                      ),
                      child: selectedImage != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(28),
                              child: Image.file(
                                selectedImage!,
                                fit: BoxFit.cover,
                                height: 130,
                              ),
                            )
                          : Lottie.asset(
                              'assets/animations/pick_image.json',
                              repeat: true,
                            ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'User Name',
                        style: TextStyles.font16weight500,
                      ),
                      const CustomDivider(),
                      Text(
                        'messi@gmail.com',
                        style: TextStyles.font16weight500,
                      ),
                      const CustomDivider(),
                      Text(
                        '+201002238716',
                        style: TextStyles.font16weight500,
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextFormField(
                    controller: nameController,
                    textInputType: TextInputType.name,
                    hintText: 'Enter User Name',
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    controller: emailController,
                    textInputType: TextInputType.emailAddress,
                    hintText: 'Enter User Email',
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    controller: phoneController,
                    textInputType: TextInputType.phone,
                    hintText: 'Enter User Phone',
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffFFF1D4),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {}
                    },
                    child: Text(
                      'Enter User',
                      style: TextStyles.font20weight400,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future pickImage() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) {
      return;
    }
    setState(() {
      selectedImage = File(returnedImage.path);
    });
  }
}
