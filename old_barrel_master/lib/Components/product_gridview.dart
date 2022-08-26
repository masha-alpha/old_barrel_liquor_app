import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:old_barrel/Assets/assets.dart';
import 'package:old_barrel/Routes/page_routes.dart';

class ProductGridView extends StatefulWidget {
  @override
  _ProductGridViewState createState() => _ProductGridViewState();
}

class ProductInfo {
  String image;
  int volume;
  String price;
  String name;

  ProductInfo(this.image, this.volume, this.price, this.name);
}

class _ProductGridViewState extends State<ProductGridView> {
  @override
  Widget build(BuildContext context) {
    List<ProductInfo> products = [
      ProductInfo(Assets.beer1, 50, '8.50', 'Classic Beer Dark Strong'),
      ProductInfo(Assets.beer2, 42, '7.00', 'Classic Beer Light Green'),
      ProductInfo(Assets.beer3, 65, '8.50', 'Premium Craft Beer Strong'),
      ProductInfo(Assets.beer4, 48, '7.50', 'Wheat Malt Beer Strong'),
      ProductInfo(Assets.beer5, 52, '8.00', 'Genuen Craft Beer Strong'),
      ProductInfo(Assets.beer6, 62, '8.50', 'Classic Beer Beer Strong'),
      ProductInfo(Assets.beer1, 50, '8.50', 'Classic Beer Dark Strong'),
      ProductInfo(Assets.beer2, 42, '7.00', 'Classic Beer Light Green'),
      ProductInfo(Assets.beer3, 65, '8.50', 'Premium Craft Beer Strong'),
      ProductInfo(Assets.beer4, 48, '7.50', 'Wheat Malt Beer Strong'),
      ProductInfo(Assets.beer5, 52, '8.00', 'Genuen Craft Beer Strong'),
      ProductInfo(Assets.beer6, 62, '8.50', 'Classic Beer Beer Strong'),
    ];
    return GridView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 28),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 18, crossAxisCount: 2, childAspectRatio: 0.6),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, PageRoutes.itemInfoPage);
            },
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        products[index].volume.toString() + 'cl',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).secondaryHeaderColor),
                      ),
                    ),
                    Container(
                      // margin: EdgeInsets.zero,
                      padding: EdgeInsets.fromLTRB(12, 30, 12, 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Theme.of(context).secondaryHeaderColor,
                                Theme.of(context).secondaryHeaderColor,
                                Theme.of(context).scaffoldBackgroundColor,
                              ])),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: '\$ ${products[index].price}' + '\n\n',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      color: Theme.of(context).primaryColor)),
                          TextSpan(
                              text: products[index].name + '\n',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(height: 1.2)),
                          TextSpan(
                              text: '350ml | 7.0%' + '\n',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                      height: 1.6,
                                      color: Theme.of(context)
                                          .hintColor
                                          .withOpacity(0.5))),
                        ]),
                      ),
                    ),
                  ],
                ),
                PositionedDirectional(
                  end: 16,
                  top: -4,
                  child: FadedScaleAnimation(
                    Image.asset(
                      products[index].image,
                      scale: 3.5,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
