import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:old_barrel/Components/custom_button.dart';
import 'package:old_barrel/Components/entry_field.dart';
import 'package:old_barrel/Locale/locale.dart';

class SupportPage extends StatefulWidget {
  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          FadedSlideAnimation(
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              locale.support!,
                              textAlign: TextAlign.left,
                              style: theme.textTheme.headline6!
                                  .copyWith(fontSize: 22),
                            ),
                            Text(
                              locale.connectUs!,
                              textAlign: TextAlign.left,
                              style: theme.textTheme.caption!
                                  .copyWith(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton.icon(
                                icon: Icon(
                                  Icons.call,
                                  size: 20,
                                  color: theme.backgroundColor,
                                ),
                                onPressed: () {},
                                label: Text(
                                  ' ' + locale.callUs!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(fontSize: 15),
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 25,
                                color: Theme.of(context).backgroundColor,
                              ),
                              TextButton.icon(
                                icon: Icon(
                                  Icons.mail,
                                  size: 20,
                                  color: theme.backgroundColor,
                                ),
                                onPressed: () {},
                                label: Text(
                                  ' ' + locale.mailUs!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(fontSize: 15),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(top: 4),
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 20),
                                    child: Text(
                                      locale.writeUs!,
                                      style: theme.textTheme.bodyText1!
                                          .copyWith(fontSize: 24),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Text(
                                      locale.letUsKnowYourQuery!,
                                      style: theme.textTheme.caption!
                                          .copyWith(fontSize: 15),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 24,
                                  ),
                                  EntryField(
                                    label: locale.phoneNumEmail,
                                    hint: locale.addContactInfo,
                                  ),
                                  EntryField(
                                    label: locale.addYourIssueFeedback,
                                    hint: locale.writeYourMsg,
                                  ),
                                  SizedBox(
                                    height: 60,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
              text: locale.submit!.toUpperCase(),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
