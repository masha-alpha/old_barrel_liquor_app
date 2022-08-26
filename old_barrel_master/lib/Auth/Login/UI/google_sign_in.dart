import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider {
  final googleSignIn = GoogleSignIn();
  final auth = FirebaseAuth.instance;
  User? loggedInUser;

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future<UserCredential> googleLogin() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      _user = googleUser;
    }
    final googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    final loggedInUser =
        await FirebaseAuth.instance.signInWithCredential(credential);

    return loggedInUser;
  }
}
