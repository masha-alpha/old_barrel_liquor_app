import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:old_barrel/Locale/locale.dart';
import 'package:old_barrel/Routes/page_routes.dart';

class ManageAddressPage extends StatefulWidget {
  @override
  _ManageAddressPageState createState() => _ManageAddressPageState();
}

class _ManageAddressPageState extends State<ManageAddressPage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(),
      body: FadedSlideAnimation(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15, top: 20, bottom: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    locale.manageAddress!,
                    style: theme.textTheme.headline5!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  Text(locale.preSavedAddresses!,
                      style: theme.textTheme.caption!.copyWith(fontSize: 15)),
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
                      padding: const EdgeInsets.all(18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextButton.icon(
                            icon: Icon(
                              Icons.add,
                              color: theme.backgroundColor,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, PageRoutes.addNewAddress);
                            },
                            label: Text(
                              locale.addNewAddress!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              SizedBox(height: 12),
                              ListTile(
                                leading: Icon(
                                  Icons.home,
                                  color: Theme.of(context).primaryColor,
                                ),
                                title: Text(
                                  locale.home!,
                                  style: theme.textTheme.bodyText1!
                                      .copyWith(fontSize: 15),
                                ),
                                subtitle: Text(
                                  'B121 - Galaxy Residency, Hemiltone Tower, New York, USA. ' +
                                      '\n',
                                  style: theme.textTheme.caption!
                                      .copyWith(height: 1.4, fontSize: 13),
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.business,
                                  color: Theme.of(context).primaryColor,
                                ),
                                title: Text(
                                  locale.office!,
                                  style: theme.textTheme.bodyText1!
                                      .copyWith(fontSize: 15),
                                ),
                                subtitle: Text(
                                  '104 Business House, Near City Bank, New York, USA. ' +
                                      '\n',
                                  style: theme.textTheme.caption!
                                      .copyWith(height: 1.4, fontSize: 13),
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.location_on,
                                  color: Theme.of(context).primaryColor,
                                ),
                                title: Text(
                                  locale.other!,
                                  style: theme.textTheme.bodyText1!
                                      .copyWith(fontSize: 15),
                                ),
                                subtitle: Text(
                                  'B121 - Galaxy Residency, Hemiltone Tower, New York, USA. ' +
                                      '\n',
                                  style: theme.textTheme.caption!
                                      .copyWith(height: 1.4, fontSize: 13),
                                ),
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
    );
  }
}
