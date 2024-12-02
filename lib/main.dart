import 'package:contact_app/screens/contacts_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ContactApp());
}

class ContactApp extends StatelessWidget {
  const ContactApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: ContactsScreen.routeName,
      routes: {
        ContactsScreen.routeName : (context)=> ContactsScreen(),
      },
    );
  }
}
