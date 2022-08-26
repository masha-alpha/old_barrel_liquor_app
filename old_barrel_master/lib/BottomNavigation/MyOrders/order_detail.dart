import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:old_barrel/Checkout/cart_page.dart';
import 'package:old_barrel/Components/custom_button2.dart';
import 'package:old_barrel/Locale/locale.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class OrderDetail extends StatefulWidget {
  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class BookingStatus {
  String? title;
  String? subtitle;

  BookingStatus(this.title, this.subtitle);
}

class _OrderDetailState extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;
    List<BookingStatus> _bookingStatus = [
      BookingStatus(
        locale.orderPlaced,
        'on 20 Jun, 06:00 am',
      ),
      BookingStatus(
        locale.orderConfirmed,
        locale.usuallyConfirmedIn,
      ),
      BookingStatus(
        locale.outForDelivery,
        locale.willNotifyWhen,
      ),
      BookingStatus(
        locale.delivered,
        locale.expectedDeliveryIn,
      ),
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(
        title: Text(
          locale.orderDetail!,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(fontSize: 20, color: Theme.of(context).hintColor),
        ),
        centerTitle: true,
      ),
      body: FadedSlideAnimation(
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 8, left: 16, right: 16),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          locale.order! + ' BR14414',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 15),
                        ),
                        subtitle: Text('20 Jun, 09:30 pm',
                            style: Theme.of(context).textTheme.caption
                            // .copyWith(fontSize: 12),
                            ),
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      flex: 2,
                      child: ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        subtitle: Text(
                          locale.cashOnDelivery!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 15),
                        ),
                        title: Text(locale.paymentMode!,
                            style: Theme.of(context).textTheme.caption
                            // .copyWith(fontSize: 12),
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                dense: true,
                subtitle: Text(
                  'Home - 1251 Jackson Tower, NY',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 15),
                ),
                title: Text(locale.deliveryAt!,
                    style: Theme.of(context).textTheme.caption
                    // .copyWith(fontSize: 12),
                    ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16)),
                    color: Theme.of(context).scaffoldBackgroundColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        locale.orderStatus!,
                        style: TextStyle(
                          color: Theme.of(context).hintColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _bookingStatus.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 10, right: 16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        theme.scaffoldBackgroundColor,
                                        index == 1
                                            ? theme.secondaryHeaderColor
                                            : theme.scaffoldBackgroundColor,
                                      ],
                                      stops: [
                                        0.17,
                                        0.7
                                      ])),
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                leading: Icon(
                                  Icons.check_circle,
                                  color: index == 0 || index == 1
                                      ? Theme.of(context).primaryColor
                                      : theme.hintColor,
                                ),
                                title: Text(
                                  _bookingStatus[index].title!,
                                  style: theme.textTheme.bodyText1!.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                                subtitle: Text(
                                  _bookingStatus[index].subtitle!,
                                  style: theme.textTheme.caption!
                                      .copyWith(fontSize: 12),
                                ),
                              ),
                            );
                          },
                        ),
                        PositionedDirectional(
                            top: 54,
                            start: 6,
                            child: RotatedBox(
                              quarterTurns: 3,
                              child: Text(
                                '. . . . . .' +
                                    '. . . . . .'.padLeft(19) +
                                    '. . . . . .'.padLeft(19),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        color: Theme.of(context).hintColor),
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 200,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: SolidBottomSheet(
          // toggleVisibilityOnTap: true,
          draggableBody: true,
          maxHeight: 500,
          headerBar: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: theme.primaryColor),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  width: 70,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xfff5f6fa),
                  ),
                ),
                CustomButton2(
                  prefix: Text(
                    '3 ' + locale.bottles!.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  centerWidget: Text(
                    locale.viewOrder!.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 12),
                  ),
                  suffix: Text(
                    '\$ 38.00',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: cartItems.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 20, end: 16, bottom: 16, top: 20),
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
                                    style:
                                        Theme.of(context).textTheme.bodyText2),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  cartItems[index].volume,
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  '\$ ' +
                                      cartItems[index]
                                          .price
                                          .toString()
                                          .padRight(20) +
                                      'x1',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                          color:
                                              Theme.of(context).primaryColor),
                                ),
                              ],
                            ),
                            Spacer(),
                            Text(
                              '\$ ' +
                                  (cartItems[index].price *
                                          cartItems[index].quantity)
                                      .toString(),
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      );
                    }),
                SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        locale.subTotal!,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      Text(
                        '\$ 36.00',
                        style: Theme.of(context).textTheme.bodyText2,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        locale.deliveryCharges!,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      Text(
                        '\$ 2.00',
                        style: Theme.of(context).textTheme.bodyText2,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        locale.toPay!,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16),
                      ),
                      Text(
                        '\$ 36.00',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
