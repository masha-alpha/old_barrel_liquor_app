import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:old_barrel/Components/custom_button.dart';
import 'package:old_barrel/Components/entry_field.dart';
import 'package:old_barrel/Locale/locale.dart';

class AddCardPage extends StatefulWidget {
  @override
  _AddCardPageState createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          title: Text(locale.addCard!),
          centerTitle: true,
        ),
      ),
      body: Stack(
        children: [
          FadedSlideAnimation(
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(12))),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  EntryField(
                    label: locale.cardNumber,
                    initialValue: 'xxxx xxxx xxxx 5414',
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  EntryField(
                    label: locale.nameOnCard,
                    hint: locale.enterCardHolderName,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: EntryField(
                          label: locale.expiryMonth,
                          hint: 'MM',
                        ),
                      ),
                      Expanded(
                        child: EntryField(
                          label: locale.expiryYear,
                          hint: 'YY',
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
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
                Navigator.pop(context);
              },
              text: locale.saveCard,
            ),
          ),
        ],
      ),
    );
  }
}
