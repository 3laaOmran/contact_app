import 'package:flutter/material.dart';

import '../styles/text_styles.dart';

class DeleteAlertDialog extends StatelessWidget {
  final Function() confirmDelete;
  final String content;
  const DeleteAlertDialog({super.key,required this.confirmDelete, required this.content});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xffFFF1D4),
      title: Text(
        'Are you sure ?!!',
        style: TextStyles.font20weight400,
      ),
      content: Text(
        content,
        style: TextStyles.font14weight500,
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xff29384D)),
          onPressed: confirmDelete,
          child: Text('Yes', style: TextStyles.font16weight500),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xff29384D)),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('No', style: TextStyles.font16weight500),
        ),
      ],
    );
  }
}
