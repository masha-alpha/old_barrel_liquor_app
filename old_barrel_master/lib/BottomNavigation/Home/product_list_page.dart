import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:old_barrel/Assets/assets.dart';
import 'package:old_barrel/Components/cart_icon.dart';
import 'package:old_barrel/Components/custom_button.dart';
import 'package:old_barrel/Components/product_gridview.dart';
import 'package:old_barrel/Components/triangle_tab_indicator.dart';
import 'package:old_barrel/Locale/locale.dart';

class BeerPage extends StatefulWidget {
  @override
  _BeerPageState createState() => _BeerPageState();
}

class _BeerPageState extends State<BeerPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _value = 6;
  int? _currentSortValue = -1;
  int? _currentBrandValue = -1;

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<String?> sortList = [
      locale.newest,
      locale.priceHighToLow,
      locale.priceLowToHigh,
      locale.nameAZ,
      locale.nameZA
    ];
    List<String> brandList = [
      'Classic Wines',
      'Budasma',
      'Kilintone',
      'Sparrow',
      'Opros',
      'Linda'
    ];

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        key: _scaffoldKey,
        endDrawer: Blur(
          blurColor: Theme.of(context).secondaryHeaderColor,
          colorOpacity: 0.8,
          blur: 4,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
          ),
          overlay: SingleChildScrollView(
            child: FadedSlideAnimation(
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 56),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            locale.sortNFilter!,
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                        ),
                        Text(
                          locale.reset!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    locale.sortBy!.padLeft(16).padRight(16),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Theme.of(context).hintColor),
                    textDirection: Directionality.of(context),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(vertical: 12),
                    itemCount: sortList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Theme(
                        data: ThemeData.dark(),
                        child: RadioListTile(
                          activeColor: Theme.of(context).primaryColor,
                          dense: true,
                          value: index,
                          title: Text(
                            sortList[index]!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontSize: 15),
                          ),
                          groupValue: _currentSortValue,
                          onChanged: (dynamic value) {
                            setState(
                              () {
                                _currentSortValue = value;
                              },
                            );
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    locale.priceRange!.padLeft(16).padRight(16),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Theme.of(context).hintColor),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$40'.padLeft(10).padRight(10),
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Text(
                        '\$100'.padLeft(10).padRight(18),
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                  Slider(
                    value: _value.toDouble(),
                    min: 1.0,
                    max: 100,
                    //  divisions: 10,
                    activeColor: Theme.of(context).primaryColor,
                    inactiveColor: Colors.grey,
                    onChanged: (double newValue) {
                      setState(() {
                        _value = newValue.round();
                      });
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    locale.brand!.padLeft(13).padRight(20),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Theme.of(context).hintColor),
                  ),
                  ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: brandList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Theme(
                        data: ThemeData.dark(),
                        child: RadioListTile(
                          activeColor: Theme.of(context).primaryColor,
                          dense: true,
                          value: index,
                          title: Text(
                            brandList[index],
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontSize: 15),
                          ),
                          groupValue: _currentBrandValue,
                          onChanged: (dynamic value) {
                            setState(
                              () {
                                _currentBrandValue = value;
                              },
                            );
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    text: locale.apply,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
              beginOffset: Offset(0, 0.3),
              endOffset: Offset(0, 0),
              slideCurve: Curves.linearToEaseOut,
            ),
          ),
        ),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Theme.of(context).secondaryHeaderColor,
          title: Text(locale.beer!),
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: () {
                _scaffoldKey.currentState!.openEndDrawer();
              },
              child: ImageIcon(
                AssetImage(Assets.filterIcon),
                size: 18,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            CartIcon()
          ],
          bottom: TabBar(
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Theme.of(context).hintColor.withOpacity(0.4),
            indicator: TriangleTabIndicator(
                color: Theme.of(context).scaffoldBackgroundColor),
            isScrollable: true,
            tabs: [
              Tab(
                text: locale.all,
              ),
              Tab(
                text: locale.imported,
              ),
              Tab(
                text: locale.crafted,
              ),
              Tab(
                text: locale.local,
              ),
            ],
          ),
        ),
        body: Container(
          color: Theme.of(context).secondaryHeaderColor,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: TabBarView(
              children: [
                FadedSlideAnimation(
                  AllBeers(),
                  beginOffset: Offset(0, 0.3),
                  endOffset: Offset(0, 0),
                  slideCurve: Curves.linearToEaseOut,
                ),
                FadedSlideAnimation(
                  AllBeers(),
                  beginOffset: Offset(0, 0.3),
                  endOffset: Offset(0, 0),
                  slideCurve: Curves.linearToEaseOut,
                ),
                FadedSlideAnimation(
                  AllBeers(),
                  beginOffset: Offset(0, 0.3),
                  endOffset: Offset(0, 0),
                  slideCurve: Curves.linearToEaseOut,
                ),
                FadedSlideAnimation(
                  AllBeers(),
                  beginOffset: Offset(0, 0.3),
                  endOffset: Offset(0, 0),
                  slideCurve: Curves.linearToEaseOut,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AllBeers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProductGridView();
  }
}
