import 'package:animation_wrappers/animation_wrappers.dart';
// import 'package:buy_this_app/buy_this_app.dart';
import 'package:flutter/material.dart';
import 'package:old_barrel/Assets/assets.dart';
import 'package:old_barrel/Config/app_config.dart';
import 'package:old_barrel/Locale/locale.dart';
import 'package:old_barrel/Routes/page_routes.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class AccountTile {
  IconData icon;
  String? title;
  String? subtitle;
  Function onTap;
  AccountTile(this.icon, this.title, this.subtitle, this.onTap);
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<AccountTile> accountTiles = [
      AccountTile(
          Icons.favorite_outlined, locale.favorites, locale.yourSavedLiquors,
          () {
        Navigator.pushNamed(context, PageRoutes.favouritesPage);
      }),
      AccountTile(
          Icons.location_on, locale.manageAddress, locale.preSavedAddresses,
          () {
        Navigator.pushNamed(context, PageRoutes.manageAddressPage);
      }),
      AccountTile(
          Icons.credit_card_outlined, locale.savedCards, locale.preSavedCardFor,
          () {
        Navigator.pushNamed(context, PageRoutes.savedCardsPage);
      }),
      AccountTile(Icons.mail, locale.support, locale.connectUsForIssueFeedback,
          () {
        Navigator.pushNamed(context, PageRoutes.supportPage);
      }),
      AccountTile(
          Icons.assignment, locale.privacyPolicy, locale.knowOurPrivacyPolicies,
          () {
        Navigator.pushNamed(context, PageRoutes.privacyPolicy);
      }),
      AccountTile(Icons.language, locale.changeLanguage, locale.chooseYourLang,
          () {
        Navigator.pushNamed(context, PageRoutes.chooseLanguagePage);
      }),
      AccountTile(Icons.question_answer, locale.faqs, locale.freqAskedQues, () {
        Navigator.pushNamed(context, PageRoutes.faqPage);
      }),
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      body: FadedSlideAnimation(
        Column(
          children: [
            Spacer(
              flex: 2,
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.myProfilePage);
              },
              title: Text(
                'Sam Smith',
                style: Theme.of(context).textTheme.headline6,
              ),
              subtitle: Text('+1 987 654 3210'),
              trailing: FadedScaleAnimation(
                  ClipOval(child: Image.asset(Assets.myProfile))),
            ),
            Spacer(),
            Container(
              height: MediaQuery.of(context).size.height / 1.4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  color: Theme.of(context).scaffoldBackgroundColor),
              child: ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [
                  ListView.builder(
                      padding: EdgeInsets.only(top: 12, bottom: 28),
                      itemCount: accountTiles.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: accountTiles[index].onTap as void Function()?,
                          leading: Icon(
                            accountTiles[index].icon,
                            size: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                          title: Text(
                            accountTiles[index].title!,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          subtitle: Text(
                            accountTiles[index].subtitle!,
                            style: Theme.of(context).textTheme.caption,
                          ),
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
      // floatingActionButton: AppConfig.isDemoMode
      //     ? BuyThisApp.button(
      //         AppConfig.appName,
      //         'https://dashboard.vtlabs.dev/projects/envato-referral-buy-link?project_slug=oldbarrel_flutter',
      //       )
      //     : null,
      // bottomNavigationBar: AppConfig.isDemoMode
      //     ? Container(
      //         padding: const EdgeInsets.all(1.0),
      //         child: 
      //             BuyThisApp.developerRowOpusDark(
      //                 Colors.transparent, Theme.of(context).primaryColorLight)
      //       )
      //     : const SizedBox.shrink(),
    );
  }
}
