// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:chat_application/core/fireBaseService/firebase_auth.dart';
import 'package:chat_application/features/loginPage/model/loginbody.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  // Instance for Firebase Authentication
  final FireAuth loginFirebase = FireAuth();

  // TextEditingControllers for form fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // FormKey for validation
  final GlobalKey<FormState> keyform = GlobalKey<FormState>();
  LoginCubit() : super(LoginInitial());
  Future<void> login() async {
    // Validate form inputs
    if (!keyform.currentState!.validate()) {
      emit(LoginFeliuer("Please fill in all fields correctly."));
      return;
    }
    emit(LoginLoading());
    try {
      final loginBody = LoginBody(
          email: emailController.text, password: passwordController.text);
      // Call Firebase sign in
      final user = await loginFirebase.login(loginBody);
      if (user != null) {
        emit(LoginSuccess());
        _resetFields();
      } else {
        emit(LoginFeliuer("User registration failed. Try again."));
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        emit(LoginFeliuer(e.message ?? "Unexpected error occurred."));
      } else {
        emit(LoginFeliuer("An unknown error occurred: $e"));
      }
    }
  }

  // Clean up resources
  @override
  Future<void> close() async {
    emailController.dispose();
    passwordController.dispose();

    return super.close();
  }

  // Private method to reset form fields
  void _resetFields() {
    emailController.clear();
    passwordController.clear();
  }
}
