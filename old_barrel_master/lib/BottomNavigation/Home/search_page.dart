import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:old_barrel/Assets/assets.dart';
import 'package:old_barrel/Components/brands_list.dart';
import 'package:old_barrel/Components/entry_field2.dart';
import 'package:old_barrel/Locale/locale.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(
        actions: [
          Stack(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: Theme.of(context).backgroundColor,
                  ),
                  onPressed: () {}),
              PositionedDirectional(
                end: 10,
                top: 10,
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  radius: 5,
                ),
              ),
            ],
          )
        ],
      ),
      body: FadedSlideAnimation(
        Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: EntryFieldDark(),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(12))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 16.0, left: 16.0, right: 16.0),
                          child: Text(
                            locale.recentSearches!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: Theme.of(context).hintColor),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            shrinkWrap: true,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return ListTile(
                                dense: true,
                                contentPadding: EdgeInsets.zero,
                                leading: Icon(
                                  Icons.search,
                                  color: Theme.of(context).primaryColor,
                                ),
                                title: Text(
                                  locale.lightBeer!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(fontSize: 13),
                                ),
                              );
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        LiquorBrands(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            FadedScaleAnimation(
              Image.asset(
                Assets.searchPageImage,
                fit: BoxFit.fill,
                width: double.infinity,
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
