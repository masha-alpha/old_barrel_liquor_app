import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:old_barrel/Assets/assets.dart';
import 'package:old_barrel/Components/custom_button.dart';
import 'package:old_barrel/Locale/locale.dart';
import 'package:old_barrel/Routes/page_routes.dart';

class PaymentDonePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      body: FadedSlideAnimation(
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(
              flex: 2,
            ),
            FadedScaleAnimation(
              Image.asset(
                Assets.quoteImage,
                scale: 3,
              ),
            ),
            Spacer(),
            FadedScaleAnimation(Image.asset(Assets.orderPlaced)),
            Spacer(),
            Text(
              locale.cheers!,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Theme.of(context).primaryColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              locale.yourOrderHasBeenPlaced!,
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.center,
            ),
            Spacer(
              flex: 3,
            ),
            CustomButton(
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.bottomNavigation);
              },
              text: locale.myOrders!.toUpperCase(),
            ),
            Spacer(),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
