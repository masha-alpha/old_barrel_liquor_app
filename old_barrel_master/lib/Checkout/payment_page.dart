import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:old_barrel/Assets/assets.dart';
import 'package:old_barrel/Locale/locale.dart';
import 'package:old_barrel/Routes/page_routes.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
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
              title: Text(locale.payment!),
              centerTitle: true,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Theme.of(context).scaffoldBackgroundColor),
              child: ListTile(
                dense: true,
                title: Text(
                  locale.amountToPay!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
                subtitle: Text(
                  '\$38.00',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(height: 1.4),
                ),
              ),
            ),
          ],
        ),
      ),
      body: FadedSlideAnimation(
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              color: Theme.of(context).scaffoldBackgroundColor),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  locale.selectPaymentMethod!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: Theme.of(context).hintColor),
                ),
                SizedBox(
                  height: 8,
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, PageRoutes.paymentDonePage);
                  },
                  contentPadding: EdgeInsets.zero,
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      Assets.paymentGateway,
                      scale: 2.8,
                    ),
                  ),
                  title: Text(
                    locale.paymentGateway!,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, PageRoutes.paymentDonePage);
                  },
                  contentPadding: EdgeInsets.zero,
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      Assets.cashOnDelivery,
                      scale: 2.8,
                    ),
                  ),
                  title: Text(
                    locale.cashOnDelivery!,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      locale.savedCards!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: Theme.of(context).hintColor),
                    ),
                    Text(
                      locale.addNewCard!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                ListView.builder(
                    itemCount: 2,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Image.asset(
                                index == 0 ? Assets.card1 : Assets.card2),
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(start: 20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('9876 5432 1236 1162'),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ListTile(
                                          contentPadding: EdgeInsets.zero,
                                          title: Text(
                                            locale.cardHolderName!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption,
                                          ),
                                          subtitle: Text(
                                            'Sam Smith',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      Expanded(
                                        child: ListTile(
                                          contentPadding: EdgeInsets.zero,
                                          title: Text(
                                            locale.validThru!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption,
                                          ),
                                          subtitle: Text(
                                            '03/28',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
