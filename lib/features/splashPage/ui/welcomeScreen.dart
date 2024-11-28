import 'package:chat_application/features/loginPage/Ui/loginScreen.dart';
import 'package:chat_application/features/register/Ui/registerScreen.dart';
import 'package:flutter/material.dart';

class Welcomescreen extends StatelessWidget {
  const Welcomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 25,
            ),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
                children: [
                  TextSpan(
                    text: 'Connect friends\n',
                    style: TextStyle(
                      fontSize: 75,
                    ),
                  ),
                  TextSpan(
                    text: 'easily & \n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 75.0,
                    ),
                  ),
                  TextSpan(
                    text: 'quickly \n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 75.0,
                    ),
                  ),
                  TextSpan(
                    text: 'Our chat app is the perfect way to stay\n ',
                    style: TextStyle(fontSize: 17, color: Colors.grey),
                  ),
                  TextSpan(
                    text: '   connected with friends and family.',
                    style: TextStyle(fontSize: 17, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                Text(
                  '  OR  ',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: Divider(color: Colors.grey, thickness: 1),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>const Registerscreen()));
                },
                child: const Text(
                  "Sign Up With Mail",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                 TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Loginscreen()));
                },
                child: const Text("Log In",
                    style: TextStyle(fontSize: 15, color: Colors.white)))
              ],
            ),
           
          ],
        ),
      ),
    );
  }
}
