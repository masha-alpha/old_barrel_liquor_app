import 'dart:async';
import 'dart:io';

import 'package:animation_wrappers/animation_wrappers.dart';
// import 'package:buy_this_app/buy_this_app.dart';
import 'package:flutter/material.dart';
import 'package:old_barrel/Assets/assets.dart';
import 'package:old_barrel/Components/brands_list.dart';
import 'package:old_barrel/Components/cart_icon.dart';
import 'package:old_barrel/Components/entry_field2.dart';
import 'package:old_barrel/Config/app_config.dart';
import 'package:old_barrel/Locale/locale.dart';
import 'package:old_barrel/Routes/page_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class Category {
  String? title;
  String image;

  Category(this.title, this.image);
}

class _HomePageState extends State<HomePage> {
  var locationMessage = '';
  var Address = '';

  Future getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    print(lastPosition);
    // print(placemarks);
    print(place);
    setState(() {
      locationMessage = "Lat: ${position.latitude},Long: ${position.longitude}";
      Address =
          "${place.isoCountryCode}, ${place.administrativeArea}, ${place.locality}, ${place.thoroughfare}";
    });
  }

  Timer? timer;

  @override
  void initState() {
    _checkForBuyNow();
    super.initState();
    timer = Timer.periodic(
        Duration(seconds: 30), (Timer t) => getCurrentLocation());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<Category> categories = [
      Category(locale.beer, Assets.liquor1),
      Category(locale.wine, Assets.liquor2),
      Category(locale.vodka, Assets.liquor3),
      Category(locale.brandy, Assets.liquor4),
      Category(locale.rum, Assets.liquor5),
      Category(locale.tequila, Assets.liquor6),
      Category(locale.whiskey, Assets.liquor7),
      Category(locale.more, Assets.liquor8),
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Icon(
              Icons.location_on,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(
              width: 8,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: locale.deliveryTo!.toUpperCase() + '\n',
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Theme.of(context).primaryColor, fontSize: 12)),
              TextSpan(
                  text: '$Address',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 12, height: 1.4)),
            ])),
            SizedBox(
              width: 8,
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
        actions: [CartIcon()],
      ),
      body: FadedSlideAnimation(
        ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: EntryFieldDark(
                onTap: () {
                  Navigator.pushNamed(context, PageRoutes.searchPage);
                },
                readOnly: true,
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsetsDirectional.only(end: 8.0),
                      child: FadedScaleAnimation(
                        Image.asset(
                          Assets.banner1,
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(12))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 16.0),
                    child: Text(
                      locale.categories!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 16),
                    ),
                  ),
                  GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      shrinkWrap: true,
                      itemCount: categories.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          crossAxisCount: 4),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, PageRoutes.beerPage);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Theme.of(context).secondaryHeaderColor,
                                      Theme.of(context).scaffoldBackgroundColor,
                                    ])),
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  categories[index].title!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(fontSize: 12),
                                ),
                                Spacer(),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: FadedScaleAnimation(
                                    Image.asset(
                                      categories[index].image,
                                      scale: 3,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                  LiquorBrands(),
                  SizedBox(
                    height: 70,
                  ),
                ],
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

  void _checkForBuyNow() async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // if (!sharedPreferences.containsKey("key_buy_this_shown") &&
    //     AppConfig.isDemoMode) {
    //   Future.delayed(Duration(seconds: 10), () async {
    //     if (mounted) {
    //       BuyThisApp.showSubscribeDialog(context);
    //       sharedPreferences.setBool("key_buy_this_shown", true);
    //     }
    //   });
    // }
  }
}
