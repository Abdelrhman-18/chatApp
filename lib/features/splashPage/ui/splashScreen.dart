import 'package:chat_application/features/splashPage/ui/welcomeScreen.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});
  
  @override
  Widget build(BuildContext context) {
     Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Welcomescreen()),
      );
    });
    return Scaffold(
      body: Image.asset(
        "assets/images/splashphoto.png",
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}