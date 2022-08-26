import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:old_barrel/Locale/locale.dart';

class FAQs {
  final String? title;
  final String subtitle;

  FAQs(this.title, this.subtitle);
}

class FaqPage extends StatefulWidget {
  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;
    final List<FAQs> faqs = [
      FAQs(locale.faq1,
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
      FAQs(locale.faq2,
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
      FAQs(locale.faq3,
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
      FAQs(locale.faq4,
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
      FAQs(locale.faq5,
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
      FAQs(locale.faq6,
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
      FAQs(locale.faq1,
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
      FAQs(locale.faq2,
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
      FAQs(locale.faq3,
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
      FAQs(locale.faq4,
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
      FAQs(locale.faq5,
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
      FAQs(locale.faq6,
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
    ];
    return Scaffold(
      backgroundColor: theme.secondaryHeaderColor,
      appBar: AppBar(),
      body: FadedSlideAnimation(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                locale.fAQs!,
                style: theme.textTheme.headline5!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: Text(
                locale.getYourAnswers!,
                style:
                    theme.textTheme.bodyText2!.copyWith(color: theme.hintColor),
              ),
            ),
            SizedBox(height: 36),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  color: theme.scaffoldBackgroundColor,
                ),
                padding: EdgeInsets.only(top: 16),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: faqs.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                        title: Text(
                          faqs[index].title!,
                          style:
                              theme.textTheme.bodyText1!.copyWith(fontSize: 16),
                        ),
                        subtitle: index == 0
                            ? Text(
                                faqs[index].subtitle,
                                style: theme.textTheme.bodyText2!.copyWith(
                                    fontWeight: FontWeight.w300, height: 1.4),
                              )
                            : null,
                        trailing: Icon(
                          Icons.keyboard_arrow_down,
                          color: theme.primaryColor,
                          size: 20,
                        ),
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
