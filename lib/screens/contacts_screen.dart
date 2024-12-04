import 'package:contact_app/styles/text_styles.dart';
import 'package:contact_app/widgets/bottom_sheet_widget.dart';
import 'package:contact_app/widgets/contact_widget.dart';
import 'package:contact_app/widgets/delete_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../models/contact_model.dart';

class ContactsScreen extends StatefulWidget {
  static const String routeName = 'contacts_screen';
  const ContactsScreen({super.key});
  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

List<ContactModel> contactsList = [];

class _ContactsScreenState extends State<ContactsScreen> {
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
                        onDeletePressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => DeleteAlertDialog(
                                    content: 'Delete This Contact ?',
                                    confirmDelete: () {
                                      contactsList.removeAt(index);
                                      setState(() {});
                                      Navigator.pop(context);
                                    },
                                  ));
                        },
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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          contactsList.isNotEmpty
              ? FloatingActionButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => DeleteAlertDialog(
                              content: 'Delete Last Added Contact ?',
                              confirmDelete: () {
                                Navigator.pop(context);
                                contactsList.removeAt(contactsList.length - 1);
                                setState(() {});
                              },
                            ));
                  },
                  backgroundColor: Colors.red,
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 30,
                  ),
                )
              : Container(),
          contactsList.length != 6
              ? Column(
                  children: [
                    const SizedBox(height: 16),
                    FloatingActionButton(
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          backgroundColor: const Color(0xff29384D),
                          builder: (context) => const BottomSheetWidget(),
                        ).then((value) {
                          return setState(() {});
                        });
                      },
                      backgroundColor: const Color(0xffFFF1D4),
                      child: const Icon(
                        Icons.add,
                        size: 30,
                      ),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
