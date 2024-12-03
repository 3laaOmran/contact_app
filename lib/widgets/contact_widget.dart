import 'package:contact_app/models/contact_model.dart';
import 'package:flutter/material.dart';

import '../styles/text_styles.dart';

class ContactWidget extends StatelessWidget {
  final ContactModel contactModel;
  const ContactWidget({super.key, required this.contactModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffFFF1D4),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  child: Image.file(
                    contactModel.image,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 8, left: 7),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xffFFF1D4),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    contactModel.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyles.font14weight500,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 8),
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                child: Row(
                  children: [
                    const Icon(
                      Icons.email_rounded,
                      color: Color(0xff29384D),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        contactModel.email,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyles.font10weight500,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                child: Row(
                  children: [
                    const Icon(
                      Icons.phone_in_talk_rounded,
                      color: Color(0xff29384D),
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        contactModel.phone,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyles.font10weight500,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 30,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffF93E3E),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/delete.png'),
                      const SizedBox(width: 8),
                      Text(
                        'Delete',
                        style: TextStyles.font10weight500
                            .copyWith(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          )
        ],
      ),
    );
  }
}
