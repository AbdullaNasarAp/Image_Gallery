import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screen/auth/login/login_screen.dart';
import '../widgets/widgets.dart';

class SignupProvider with ChangeNotifier {
  bool passwordVisible = false;
  late String name;
  late String email;
  late String password;
  late String uid;
  late String uids;
  bool processing = false;
  bool processings = false;

  CollectionReference customer = FirebaseFirestore.instance.collection('user');

  signUp(BuildContext context, dynamic formKey, dynamic scaffoldKey) async {
    processing = true;
    notifyListeners();
    if (formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        uid = FirebaseAuth.instance.currentUser!.uid;
        await customer.doc(uid).set({
          'name': name,
          'email': email,
          'cid': uid,
        });
        formKey.currentState!.reset();
        await Future.delayed(const Duration(microseconds: 100)).whenComplete(
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                )));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          processing = false;
          notifyListeners();
          MyMessengerHelper.showSnackBar(
              scaffoldKey, "The password provided is too weak");
        } else if (e.code == 'email-already-in-use') {
          processing = false;
          notifyListeners();
          MyMessengerHelper.showSnackBar(
              scaffoldKey, "The account with this email already exist");
        }
      }
    } else {
      processing = false;
      notifyListeners();
      MyMessengerHelper.showSnackBar(scaffoldKey, "Pls fill all fields");
    }
    notifyListeners();
  }

  void passwordVisibily() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }
}
