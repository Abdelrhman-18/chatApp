// ignore: file_names
import 'dart:io';
import 'package:chat_application/features/home/ui/homePage.dart';
import 'package:chat_application/features/register/logic/cubit/register_cubit.dart';
import 'package:chat_application/widget/textFiledWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class Registerscreen extends StatelessWidget {
  const Registerscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<RegisterCubit>();
    return Scaffold(
      body: Form(
        key: cubit.keyform,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image Picker
              BlocBuilder<RegisterCubit, RegisterState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () async {
                      final ImagePicker picker = ImagePicker();
                      final filePicker = await picker.pickImage(source: ImageSource.gallery);
                      if (filePicker != null) {
                        cubit.setImage(File(filePicker.path));
                      }
                    },
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: cubit.proFileImage != null ? FileImage(cubit.proFileImage!) : null,
                      child: cubit.proFileImage == null ? const Icon(Icons.camera, size: 30) : null,
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              // Custom Text Fields
              TextFieldWidget(
                controller: cubit.usernameController,
                hintText: "Enter your user name",
                returncont: '',
              ),
              const SizedBox(height: 10),
              TextFieldWidget(
                controller: cubit.emailController,
                hintText: "Enter your email",
                returncont: '',
              ),
              const SizedBox(height: 10),
              TextFieldWidget(
                controller: cubit.phoneController,
                hintText: "Enter your phone",
                returncont: "enter",
              ),
              const SizedBox(height: 10),
              TextFieldWidget(
                controller: cubit.passwordController,
                hintText: "Enter your password",
               
                 returncont: '',
              ),
              const SizedBox(height: 20),
              // Register Button
              BlocConsumer<RegisterCubit, RegisterState>(
                listener: (context, state) {
                  if (state is RegistersSuccess) {
                    
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
                  } else if (state is RegisterFeliuer) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.errormessage)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is RegisterLoading) {
                    return const CircularProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed: () => cubit.register(),
                    child: const Text("Register"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
