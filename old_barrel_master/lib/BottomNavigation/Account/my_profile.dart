import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:old_barrel/Assets/assets.dart';
import 'package:old_barrel/Components/custom_button.dart';
import 'package:old_barrel/Components/entry_field.dart';
import 'package:old_barrel/Locale/locale.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
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
              children: [
                Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text(
                          locale.myProfile!,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        subtitle: Text(locale.everythingAboutYou!),
                      ),
                    ),
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 28.0),
                          child: FadedScaleAnimation(
                            ClipOval(
                                child: Image.asset(
                              Assets.myProfile,
                              scale: 1.3,
                            )),
                          ),
                        ),
                        PositionedDirectional(
                          end: 16,
                          top: 28,
                          child: CircleAvatar(
                            radius: 14,
                            backgroundColor: Theme.of(context).backgroundColor,
                            child: Icon(
                              Icons.camera_alt,
                              size: 16,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Spacer(),
                Expanded(
                  flex: 20,
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(16)),
                          color: Theme.of(context).scaffoldBackgroundColor),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            EntryField(
                              label: locale.fullName,
                              initialValue: 'Sam smith',
                              noBorder: true,
                            ),
                            EntryField(
                              label: locale.emailAddress,
                              initialValue: 'samsmith@mail,com',
                              noBorder: true,
                            ),
                            EntryField(
                              label: locale.phoneNumber,
                              initialValue: '+1 987 654 3210',
                              noBorder: true,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      )),
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
              onTap: () {
                // Navigator.pop(context);
                // Navigator.pushNamed(context, LoginRoutes.loginRoot);
                // Navigator.popAndPushNamed(context, PageRoutes.loginPage);
                Phoenix.rebirth(context);
              },
              bgColor: Theme.of(context).secondaryHeaderColor,
              textColor: Theme.of(context).primaryColor,
              text: locale.logout!.toUpperCase(),
            ),
          ),
        ],
      ),
    );
  }
}
