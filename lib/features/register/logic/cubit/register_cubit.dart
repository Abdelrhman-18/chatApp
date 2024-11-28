// ignore: depend_on_referenced_packages
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chat_application/core/fireBaseService/firebase_auth.dart';
import 'package:chat_application/features/register/model/registerbody.dart';
import 'package:flutter/material.dart';

part 'register_state.dart';
class RegisterCubit extends Cubit<RegisterState> {
  // Instance for Firebase Authentication
  final FireAuth firebase = FireAuth();

  // TextEditingControllers for form fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  // FormKey for validation
  final GlobalKey<FormState> keyform = GlobalKey<FormState>();

  RegisterCubit() : super(RegisterInitial());
  ///Sto get image from ui when you choose image
  File ?proFileImage ;
  setImage(File image){
    proFileImage = image ;
    emit(RegisterImage(image));
  }
  Future<void> register() async {
    // Validate form inputs
    if (!keyform.currentState!.validate()) {
      emit(RegisterFeliuer("Please fill in all fields correctly."));
      return;
    }

    emit(RegisterLoading());
    try {
      // Create registration body
      final registerBody = Registerbody(
        email: emailController.text,
        password: passwordController.text,
        username: usernameController.text,
        phone: phoneController.text,
      );

      // Call Firebase registration
      final user = await firebase.register(registerBody,image: proFileImage);

      if (user != null) {
        emit(RegistersSuccess());
        _resetFields(); // Reset fields after success
      } else {
        emit(RegisterFeliuer("User registration failed. Try again."));
      }
    } catch (e) {
      emit(RegisterFeliuer("An error occurred while registering: $e"));
    }
  }

  // Clean up resources
  @override
  Future<void> close() async {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    phoneController.dispose();
    return super.close();
  }

  // Private method to reset form fields
  void _resetFields() {
    emailController.clear();
    passwordController.clear();
    usernameController.clear();
    phoneController.clear();
  }
}
