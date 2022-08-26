import 'dart:async';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:old_barrel/Components/custom_button.dart';
import 'package:old_barrel/Components/entry_field.dart';
import 'package:old_barrel/Locale/locale.dart';

import 'verification_interator.dart';

class VerificationUI extends StatefulWidget {
  final VerificationInteractor verificationInteractor;

  @override
  _VerificationUIState createState() => _VerificationUIState();

  VerificationUI(this.verificationInteractor);
}

class _VerificationUIState extends State<VerificationUI> {
  final TextEditingController _controller = TextEditingController();
  int _counter = 20;
  late Timer _timer;

  _startTimer() {
    _counter = 20; //time counter
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _counter > 0 ? _counter-- : _timer.cancel();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
    widget.verificationInteractor.verifyNumber();
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(),
      body: FadedSlideAnimation(
        Column(
          children: [
            Expanded(
                child: Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
              child: RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: locale.verification! + '\n',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontWeight: FontWeight.w500)),
                  TextSpan(
                      text: locale.inLessThanAMinute,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Theme.of(context).hintColor, height: 1.6)),
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
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, left: 16, bottom: 30, right: 16),
                        child: Text(
                          locale.weveSentVerificationCode!,
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: Theme.of(context).hintColor,
                                    fontSize: 16,
                                  ),
                        ),
                      ),
                      EntryField(
                        label: locale.enterCode,
                        hint: locale.enter6DigitCode,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        text: locale.getStarted,
                        onTap: () {
                          widget.verificationInteractor.verificationDone();
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
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
    );
  }
}
