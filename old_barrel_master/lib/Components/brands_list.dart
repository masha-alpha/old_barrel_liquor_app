import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:old_barrel/Assets/assets.dart';
import 'package:old_barrel/Locale/locale.dart';

class LiquorBrands extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<String> brands = [
      Assets.brand1,
      Assets.brand2,
      Assets.brand3,
      Assets.brand4,
      Assets.brand1,
      Assets.brand2,
      Assets.brand3,
      Assets.brand4,
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Text(
            locale.brands!,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 16),
          ),
        ),
        SizedBox(
          height: 60,
          child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsetsDirectional.only(end: 6.0),
                  child: FadedScaleAnimation(
                    Image.asset(
                      brands[index],
                      width: 80,
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
