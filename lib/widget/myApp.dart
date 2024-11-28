import 'package:chat_application/features/home/ui/homePage.dart';
import 'package:chat_application/features/register/Ui/registerScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirebaseAuth.instance.currentUser != null
          ?const MyHomePage()
          :const Registerscreen(),
    );
  }
}
