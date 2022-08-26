import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:old_barrel/Components/custom_button.dart';
import 'package:old_barrel/Config/app_config.dart';
import 'package:old_barrel/Locale/locale.dart';

import '../../language_cubit.dart';

class ChooseLanguage extends StatefulWidget {
  @override
  _ChooseLanguageState createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  bool sliderValue = false;
  late LanguageCubit _languageCubit;
  String? selectedLocal;

  @override
  void initState() {
    super.initState();
    _languageCubit = BlocProvider.of<LanguageCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    var theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: theme.secondaryHeaderColor,
        body: BlocBuilder<LanguageCubit, Locale>(
          builder: (context, currentLocale) {
            selectedLocal ??= currentLocale.languageCode;
            return Stack(
              children: [
                FadedSlideAnimation(
                  SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15),
                                    child: Text(
                                      locale.language!,
                                      style: theme.textTheme.headline5!
                                          .copyWith(
                                              fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15),
                                    child: Text(
                                      locale.preferredLang!,
                                      textAlign: TextAlign.left,
                                      style: theme.textTheme.bodyText1!
                                          .copyWith(color: theme.hintColor),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 18, horizontal: 8),
                            decoration: BoxDecoration(
                                color: theme.scaffoldBackgroundColor,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20))),
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 12),
                                    child: Text(
                                      locale.selectPrefLang!,
                                      style:
                                          theme.textTheme.bodyText1!.copyWith(
                                        color: theme.hintColor,
                                        letterSpacing: 0.08,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Theme(
                                    data: ThemeData.dark(),
                                    child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount:
                                          AppConfig.languagesSupported.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return RadioListTile(
                                          value: AppConfig
                                              .languagesSupported.keys
                                              .elementAt(index),
                                          groupValue: selectedLocal,
                                          title: Text(
                                            AppConfig
                                                .languagesSupported[AppConfig
                                                    .languagesSupported.keys
                                                    .elementAt(index)]!
                                                .name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                          onChanged: (langCode) => setState(
                                              () => selectedLocal =
                                                  langCode as String),
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 100,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
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
                    text: locale.submit,
                    onTap: () {
                      _languageCubit.setCurrentLanguage(selectedLocal!, true);
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            );
          },
        ));
  }
}
