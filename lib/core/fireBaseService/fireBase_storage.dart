// ignore: file_names
import 'dart:io';

import 'package:chat_application/core/fireBaseService/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FireStorage {
  final storage = FirebaseStorage.instance;

  Future<String> profileImage(File imageProfile) async {
    final exImage = imageProfile.path.split(".").last;
    final userId = FireAuth().myId;
    final pathstorage = "users/$userId/proFileImage/proFileImage/./$exImage";
    try {
      final storageRef = await storage.ref().child(pathstorage);
      storageRef.putFile(imageProfile);
      return await storageRef.getDownloadURL();
    } catch (e) {
      throw Exception("error when uploud Profile Image $e");
    }
  }
}
