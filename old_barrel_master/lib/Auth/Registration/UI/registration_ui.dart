// ignore_for_file: prefer_const_constructors

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:old_barrel/Components/custom_button.dart';
import 'package:old_barrel/Components/entry_field.dart';
import 'package:old_barrel/Locale/locale.dart';
import 'package:old_barrel/Components/entry_field.dart';
import 'registration_interactor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:old_barrel/BottomNavigation/Home/home_page.dart';

class RegistrationUI extends StatefulWidget {
  RegistrationInteractor registrationInteractor = RegistrationInteractor();

  @override
  _RegistrationUIState createState() => _RegistrationUIState();
}

class _RegistrationUIState extends State<RegistrationUI> {
  RegistrationInteractor registrationInteractor = RegistrationInteractor();

  bool noBorder = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  User? loggedInUser;

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(),
      body: Stack(
        children: [
          FadedSlideAnimation(
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 16.0),
                  child: RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: locale.register! + '\n',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(fontWeight: FontWeight.w500)),
                      TextSpan(
                          text: locale.inLessThanAMinute,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  color: Theme.of(context).hintColor,
                                  height: 1.6)),
                    ]),
                  ),
                )),
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        // ignore: duplicate_ignore
                        children: [
//--------------------------------Enter Email Address Text Field--------------------------------------*
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    locale.emailAddress!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                            color: Theme.of(context).hintColor),
                                    textAlign: TextAlign.left,
                                  ),
                                  TextFormField(
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                    decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: noBorder
                                                ? BorderSide.none
                                                : BorderSide(
                                                    color: Theme.of(context)
                                                        .hintColor)),
                                        labelText: locale.enterEmailAddress,
                                        labelStyle: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .hintColor),
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .bodyText2),
                                    onChanged: (value) {
                                      setState(() {
                                        _emailController.text =
                                            value.toString();
                                      });
                                    },
                                  ),
                                ]),
                          ),
//----------------------------------Enter Password Text Field-------------------------------------------*
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Password',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                          color: Theme.of(context).hintColor),
                                  textAlign: TextAlign.left,
                                ),
                                TextFormField(
                                  style: Theme.of(context).textTheme.bodyText1,
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: noBorder
                                              ? BorderSide.none
                                              : BorderSide(
                                                  color: Theme.of(context)
                                                      .hintColor)),
                                      labelText: 'Enter Password',
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                              color:
                                                  Theme.of(context).hintColor),
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .bodyText2),
                                  onChanged: (value) {
                                    setState(() {
                                      _passwordController.text =
                                          value.toString();
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          // ignore: prefer_const_constructors
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text(
                              locale.wellSendVerificationCode!,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      color: Theme.of(context).hintColor,
                                      fontSize: 16),
                            ),
                          ),
                          // ignore: prefer_const_constructors
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            beginOffset: Offset(0, 0.3),
            endOffset: Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          ),
          PositionedDirectional(
            bottom: 20,
            start: 0,
            end: 0,
            child: CustomButton(
              onTap: () async {
                print(_emailController.text);
                print(_nameController.text);
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text);
                  if (newUser != null) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  }
                } catch (e) {
                  print(e);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
