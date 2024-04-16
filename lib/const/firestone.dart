
import 'package:cloud_firestore/cloud_firestore.dart';
class FirestoreService{

  final CollectionReference login =
  FirebaseFirestore.instance.collection('login');


  Future<void> saveLoginToDatabase (String email , String password) async {
    await login.add({

      'email': email,
      'password': password,

    });


  }

  saveUserToDatabase(String text, String text2, String text3, String text4, String text5) {}

 }