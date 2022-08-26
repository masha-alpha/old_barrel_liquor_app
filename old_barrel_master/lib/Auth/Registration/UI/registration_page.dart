import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:old_barrel/BottomNavigation/Home/home_page.dart';
import '../../login_navigator.dart';
import 'registration_interactor.dart';
import 'registration_ui.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:old_barrel/BottomNavigation/Home/home_page.dart';

class RegistrationPage extends StatefulWidget {
  final String? phoneNumber;
  RegistrationPage(this.phoneNumber);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage>
    implements RegistrationInteractor {
  @override
  Widget build(BuildContext context) {
    return RegistrationUI();
  }

  final _auth = FirebaseAuth.instance;
  @override
  void register(String password, String email) async {
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (newUser != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void goBack() {
    Navigator.pop(context);
  }
}
