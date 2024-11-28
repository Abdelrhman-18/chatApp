import 'dart:io';

import 'package:chat_application/core/fireBaseService/fireBaseStore.dart';
import 'package:chat_application/core/fireBaseService/fireBase_storage.dart';
import 'package:chat_application/features/contaxts/model/userModel.dart';
import 'package:chat_application/features/loginPage/model/loginbody.dart';
import 'package:chat_application/features/register/model/registerbody.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireAuth {
  FirebaseAuth auth = FirebaseAuth.instance;
  String get myId => auth.currentUser!.uid;
  Future<User?> login(LoginBody loginbody) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
          email: loginbody.email, password: loginbody.password);
      return credential.user;
    } catch (e) {
      throw Exception("Error to login user $e");
    }
  }

  Future<User?> register(Registerbody registerbody, {File? image}) async {
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: registerbody.email,
        password: registerbody.password,
      );
      final user = credential.user;
      if (image != null) {
        FireStorage().profileImage(image);
      }
      if (user != null) {
        await user.updateDisplayName(registerbody.username);
        await user.reload();
        var usermodel = UserModel(
            name: registerbody.username,
            id: user.uid,
            email: registerbody.email,
            password: registerbody.password,
            phoneNumber: registerbody.phone,
            about: "new user",
            createdAt: DateTime.now().toString(),
            aboutLastActivated:  DateTime.now().toString(),
            pushToken: "",
            online: true);
        await FireStore().createUser(usermodel);
      }
      return user;
    } catch (e) {
      throw Exception("Register Error $e");
    }
  }

  Future logout() async {
    try {
      await auth.signOut();
    } catch (e) {
      throw Exception("logout error$e");
    }
  }
}
