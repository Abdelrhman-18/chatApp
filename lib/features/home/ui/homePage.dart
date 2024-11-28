import 'package:chat_application/core/fireBaseService/firebase_auth.dart';
import 'package:chat_application/features/register/Ui/registerScreen.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: ()async {
                await FireAuth().logout;
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Registerscreen()));
              },
              icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}
