import 'package:contact_app/styles/text_styles.dart';
import 'package:contact_app/widgets/bottom_sheet_widget.dart';
import 'package:contact_app/widgets/contact_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../models/contact_model_and_list.dart';

class ContactsScreen extends StatelessWidget {
  static const String routeName = 'contacts_screen';
  ContactsScreen({super.key});

  final List<ContactModel> contactsList = [];

  // List<ContactModel> fakeContacts() {
  //   for (var i = 1; i < 20; i++) {
  //     contactsList.add(
  //       ContactModel(
  //         image: 'assets/images/osta_3bdo.jpg',
  //         name: 'Osta $i',
  //         email: 'osta3bdo@gmail.com',
  //         phone: '+201002238716',
  //       ),
  //     );
  //   }
  //   return contactsList;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff29384D),
      appBar: AppBar(
        backgroundColor: const Color(0xff29384D),
        title: Image.asset(
          'assets/images/logo.png',
          width: 117,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          contactsList.isNotEmpty
              ? Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 16.0, right: 16, top: 16),
                    child: GridView.builder(
                      padding: const EdgeInsets.only(bottom: 16),
                      itemCount: contactsList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: 1 / 1.7),
                      itemBuilder: (context, index) => ContactWidget(
                        contactModel: contactsList[index],
                      ),
                    ),
                  ),
                )
              : Center(
                  child: Column(
                    children: [
                      Lottie.asset(
                        'assets/animations/loading.json',
                        repeat: true,
                        fit: BoxFit.fill,
                        width: 250,
                        height: 250,
                      ),
                      const SizedBox(height: 80),
                      Text(
                        'There is No Contacts Added Here',
                        style: TextStyles.font20weight500,
                      )
                    ],
                  ),
                ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            backgroundColor: const Color(0xff29384D),
            builder: (context) =>  BottomSheetWidget(),
          );
        },
        backgroundColor: const Color(0xffFFF1D4),
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}