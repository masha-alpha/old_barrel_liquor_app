import 'dart:async';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:old_barrel/Assets/assets.dart';
import 'package:old_barrel/Components/custom_button2.dart';
import 'package:old_barrel/Components/entry_field2.dart';
import 'package:old_barrel/Locale/locale.dart';
import 'package:old_barrel/Routes/page_routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class CartItem {
  String image;
  String name;
  String volume;
  double price;
  int quantity;

  CartItem(this.image, this.name, this.volume, this.price, this.quantity);
}

List<CartItem> cartItems = [
  CartItem(Assets.beer1Shadow, 'Classic Beer Dark\nStrong', '350ml', 8.50, 3),
  CartItem(Assets.beer2, 'Whyte Premium\nWhiskey', '500ml', 10.50, 1),
];

class _CartPageState extends State<CartPage> {
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
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(180),
        child: Column(
          children: [
            AppBar(
              title: Text(locale.myBag!),
              centerTitle: true,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Theme.of(context).scaffoldBackgroundColor),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    Assets.locationIcon,
                    scale: 3,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        locale.deliveryTo!.toUpperCase(),
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '$Address',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(height: 1.4, fontSize: 13),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: FadedSlideAnimation(
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height + 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: Theme.of(context).scaffoldBackgroundColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      child: Text(
                        '2 ' + locale.itemsInBag!,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: cartItems.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsetsDirectional.only(
                                start: 20, end: 16, bottom: 16),
                            child: Row(
                              children: [
                                Image.asset(
                                  cartItems[index].image,
                                  scale: 5,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(cartItems[index].name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      cartItems[index].volume,
                                      style:
                                          Theme.of(context).textTheme.caption,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      '\Ksh ' + cartItems[index].price.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .primaryColor),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (cartItems[index].quantity > 0)
                                                cartItems[index].quantity--;
                                            });
                                          },
                                          onLongPress: () {
                                            setState(() {
                                              cartItems[index].quantity = 0;
                                            });
                                          },
                                          child: Icon(
                                            Icons.remove_circle,
                                            color: Theme.of(context)
                                                .backgroundColor,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          cartItems[index].quantity.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2!
                                              .copyWith(
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              cartItems[index].quantity++;
                                            });
                                          },
                                          child: Icon(
                                            Icons.add_circle,
                                            color: Theme.of(context)
                                                .backgroundColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 32,
                                    ),
                                    Text(
                                      '\Ksh ' +
                                          (cartItems[index].price *
                                                  cartItems[index].quantity)
                                              .toString(),
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
            PositionedDirectional(
              bottom: 0,
              start: 0,
              end: 0,
              child: Container(
                padding: EdgeInsetsDirectional.only(top: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: Theme.of(context).secondaryHeaderColor),
                child: Column(
                  children: [
                    EntryFieldDark(
                      hintText: locale.haveAPromoCode,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          locale.apply!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ),
                      prefixIcon: Image.asset(
                        Assets.promoIcon,
                        scale: 2.5,
                      ),
                      fillColor: Theme.of(context).secondaryHeaderColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            locale.subTotal!,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Text(
                            '\Ksh 4270.00',
                            style: Theme.of(context).textTheme.bodyText2,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            locale.deliveryCharges!,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Text(
                            '\Ksh 240.00',
                            style: Theme.of(context).textTheme.bodyText2,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            locale.toPay!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16),
                          ),
                          Text(
                            '\Ksh 4270.00',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    CustomButton2(
                      onTap: () {
                        Navigator.pushNamed(context, PageRoutes.paymentPage);
                      },
                      prefix: Text(
                        '3 ' + locale.bottles!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 12),
                      ),
                      centerWidget: Text(
                        locale.pay!.toUpperCase() + ' \Ksh4505.00',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                      suffix: Icon(
                        Icons.arrow_forward,
                        color: Theme.of(context).backgroundColor,
                      ),
                    )
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
