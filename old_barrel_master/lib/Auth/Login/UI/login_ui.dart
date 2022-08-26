import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:old_barrel/Assets/assets.dart';
import 'package:old_barrel/Auth/Login/UI/google_sign_in.dart';
import 'package:old_barrel/Components/custom_button.dart';
import 'package:old_barrel/Components/entry_field.dart';
import 'package:old_barrel/Locale/locale.dart';
import 'login_interactor.dart';
import 'package:provider/provider.dart';

class LoginUI extends StatefulWidget {
  final LoginInteractor loginInteractor;

  LoginUI(this.loginInteractor);

  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  final TextEditingController _numberController = TextEditingController();
  final GoogleSignInProvider googleSignInProvider = GoogleSignInProvider();

  bool noBorder = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoggedIn = false;

  isSignedIn() async {
    User? user = _auth.currentUser;
    if (user != null) {
      isLoggedIn = true;
    }
  }

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      body: FadedSlideAnimation(
        SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(height: 40),
                    Image.asset(
                      Assets.logo,
                      height: 130,
                    ),
                    Image.asset(
                      Assets.signIn,
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 400,
                    // margin: EdgeInsets.only(top: 390),
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Spacer(),
                        Text(
                          locale.signInNow!,
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: Theme.of(context).hintColor,
                                    fontSize: 18,
                                  ),
                        ),
                        Spacer(),
//--------------------------------Enter Email Address Text Field--------------------------------------*
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
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
                                  style: Theme.of(context).textTheme.bodyText1,
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
                                              color:
                                                  Theme.of(context).hintColor),
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .bodyText2),
                                  onChanged: (value) {
                                    setState(() {
                                      _emailController.text = value.toString();
                                    });
                                  },
                                ),
                              ]),
                        ),
//----------------------------------Enter Password Text Field-------------------------------------------*
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
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
                                            color: Theme.of(context).hintColor),
                                    hintStyle:
                                        Theme.of(context).textTheme.bodyText2),
                                onChanged: (value) {
                                  setState(() {
                                    _passwordController.text = value.toString();
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        CustomButton(
                          text: 'LOGIN',
                          onTap: () {
                            widget.loginInteractor
                                .loginWithPhone('isoCode', 'mobileNumber');
                          },
                        ),

                        Text(
                          locale.orContinueWith!,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Theme.of(context).hintColor),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16),
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                primary: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            icon: ImageIcon(AssetImage(Assets.googleIcon),
                                color: Theme.of(context).backgroundColor,
                                size: 20),
                            label: Text(
                              locale.google!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    color: Theme.of(context).backgroundColor,
                                    fontSize: 15,
                                  ),
                            ),
                            onPressed: () async {
                              googleSignInProvider.googleLogin();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }

  TextButton socialButton(String icon, String text) {
    return TextButton.icon(
      icon: ImageIcon(
        AssetImage(icon),
        color: Theme.of(context).backgroundColor,
        size: 20,
      ),
      onPressed: () {},
      label: Text(text, style: Theme.of(context).textTheme.bodyText1),
    );
  }
}
