import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AuthFunctions {
  Future<void> signIn(BuildContext context, email, String password) async {
    // String errorMessage;
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (err) {
      showBottomToast(context, err.code);
    }
  }

  Future<void> signUp(
      BuildContext context, email, String userName, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'userEmail': email,
        'userName': userName,
      });
    } on FirebaseAuthException catch (err) {
      showBottomToast(context, err.code);
    }
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  void showBottomToast(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          errorMessage,
          style: const TextStyle(color: Colors.white),
        )));
  }
}
