import 'package:chat_application/features/home/ui/homePage.dart';
import 'package:chat_application/features/loginPage/logic/cubit/login_cubit.dart';
import 'package:chat_application/widget/textFiledWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LoginCubit>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: cubit.keyform,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 150,
              ),
              Center(
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: '      Log in To Chatbox \n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                            color: Colors.black),
                      ),
                      TextSpan(
                        text: '\nWelcome back! Sign in using your social \n ',
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                      TextSpan(
                        text: '\n     account or email to continue us.',
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
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
              const Text("Your Email"),
              TextFieldWidget(
                controller: cubit.emailController,
                returncont: "Please enter your email",
                hintText: "Email",
              ),
              const Text("Your Password"),
              TextFieldWidget(
                controller: cubit.passwordController,
                returncont: "Please enter your Password",
                hintText: "Password",
              ),
              SizedBox(
                width: 300,
                height: 50,
                child: BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                   if (state is LoginSuccess) {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
                    }
                    if (state is LoginFeliuer) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.errorMessage)));
                    }
                  },
                  builder: (context, state) {
                     if (state is LoginLoading) {
                      return const CircularProgressIndicator();
                    }
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xfffC6DCD9)),
                      onPressed: () {
                        cubit.login();
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Text(
                "Forgot Password?",
                style: TextStyle(color: Color(0xfff208D7F), fontSize: 18),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
