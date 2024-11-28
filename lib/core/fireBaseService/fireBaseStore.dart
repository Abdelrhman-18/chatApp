import 'package:chat_application/features/contaxts/model/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStore {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future createUser(UserModel userModel) async {
    try {
      await firestore.collection("users").doc(userModel.id).set(userModel.toJson());
    } catch (e) {
      throw Exception("create error $e");
    }
  }
}
