import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:old_barrel/Assets/assets.dart';
import 'package:old_barrel/Components/cart_icon.dart';
import 'package:old_barrel/Components/custom_button2.dart';
import 'package:old_barrel/Locale/locale.dart';

class ItemInfoPage extends StatefulWidget {
  @override
  _ItemInfoPageState createState() => _ItemInfoPageState();
}

class _ItemInfoPageState extends State<ItemInfoPage>
    with TickerProviderStateMixin {
  bool is350 = true;
  bool is500 = false;
  bool is1000 = false;
  int bottleCount = 1;
  AnimationController? _controller1;
  AnimationController? _controller2;

  @override
  void initState() {
    super.initState();
    _controller1 = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _controller2 = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller1!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        appBar: AppBar(
          actions: [CartIcon()],
        ),
        body: FadedSlideAnimation(
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                color: Theme.of(context).scaffoldBackgroundColor),
            child: Column(
              children: [
                ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  title: Text(
                    'Classic Beer Dark\nStrong',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.favorite_outline_rounded,
                        size: 18,
                        color: Theme.of(context).backgroundColor,
                      ),
                      Text(
                        '50cl',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).secondaryHeaderColor,
                            fontSize: 25),
                      )
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Classic Beer American-Style Lager- 4.6% ABV. Classic Dark Strong beer is a crisp, clean and well balanced cerveza with fruity-honey aromas and a touch of malt, making it a great lager beer.',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Theme.of(context).hintColor.withOpacity(0.5),
                        height: 1.4),
                  ),
                ),
                Spacer(),
                Text(
                  locale.selectVolume!,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Theme.of(context).hintColor.withOpacity(0.8),
                      fontSize: 15),
                ),
                Spacer(),
                TabBar(
                    labelColor: Theme.of(context).primaryColor,
                    unselectedLabelColor:
                        Theme.of(context).backgroundColor.withOpacity(0.6),
                    labelStyle: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 16),
                    unselectedLabelStyle: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 15),
                    indicatorColor: Theme.of(context).scaffoldBackgroundColor,
                    isScrollable: true,
                    tabs: [
                      Tab(
                        text: '350ml',
                      ),
                      Tab(
                        text: '500ml',
                      ),
                      Tab(
                        text: '1ltr',
                      ),
                    ]),
                Expanded(
                  flex: 10,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            locale.stay! + '\n' + locale.stable!,
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).secondaryHeaderColor),
                          ),
                          Text(
                            locale.gett! + '\n' + locale.drunk!,
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).secondaryHeaderColor),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                      TabBarView(children: [
                        QuarterVolume(
                          index: 0,
                          controller1: _controller1,
                          controller2: _controller2,
                          bottleCount: bottleCount,
                        ),
                        QuarterVolume(
                          index: 1,
                          controller1: _controller1,
                          controller2: _controller2,
                          bottleCount: bottleCount,
                        ),
                        QuarterVolume(
                          index: 2,
                          controller1: _controller1,
                          controller2: _controller2,
                          bottleCount: bottleCount,
                        ),
                      ]),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (bottleCount == 2) _controller1!.reverse();
                                setState(() {
                                  if (bottleCount > 1) bottleCount--;
                                });
                                _controller2!.reverse();
                              },
                              child: CircleAvatar(
                                  radius: 16,
                                  backgroundColor:
                                      Theme.of(context).backgroundColor,
                                  child: Icon(
                                    Icons.remove,
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                _controller1!.forward();
                                setState(() {
                                  if (bottleCount < 4) bottleCount++;
                                });
                                if (bottleCount == 3) _controller2!.forward();
                              },
                              child: CircleAvatar(
                                  radius: 16,
                                  backgroundColor:
                                      Theme.of(context).backgroundColor,
                                  child: Icon(
                                    Icons.add,
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                CustomButton2(
                  onTap: () {
                    _controller2!.reverse();
                    setState(() {
                      bottleCount = 1;
                    });
                    _controller1!.reverse();
                  },
                  prefix: Text(
                    '\$ 25.20',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  centerWidget: Text(
                    '3 ' + locale.bottles!.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 12),
                  ),
                  suffix: Text(
                    locale.addToBag!.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          beginOffset: Offset(0, 0.3),
          endOffset: Offset(0, 0),
          slideCurve: Curves.linearToEaseOut,
        ),
      ),
    );
  }
}

class QuarterVolume extends StatefulWidget {
  final int? index;
  final AnimationController? controller1;
  final AnimationController? controller2;
  final int? bottleCount;
  const QuarterVolume(
      {this.index, this.controller1, this.bottleCount, this.controller2});
  @override
  _QuarterVolumeState createState() => _QuarterVolumeState();
}

class _QuarterVolumeState extends State<QuarterVolume> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              PositionedTransition(
                rect: RelativeRectTween(
                  begin: RelativeRect.fromLTRB(
                      100,
                      widget.index == 0
                          ? 30
                          : widget.index == 1
                              ? 20
                              : 10,
                      100,
                      widget.index == 0
                          ? 30
                          : widget.index == 1
                              ? 20
                              : 10),
                  end: RelativeRect.fromLTRB(
                      140,
                      widget.index == 0
                          ? 30
                          : widget.index == 1
                              ? 20
                              : 10,
                      60,
                      widget.index == 0
                          ? 30
                          : widget.index == 1
                              ? 20
                              : 10),
                ).animate(CurvedAnimation(
                  parent: widget.controller1!,
                  curve: Curves.fastOutSlowIn,
                )),
                child: Image.asset(
                  Assets.beer1Shadow,
                  height: widget.index == 0
                      ? 150
                      : widget.index == 1
                          ? 180
                          : 220,
                  // fit: BoxFit.fill,
                ),
              ),
              PositionedTransition(
                rect: RelativeRectTween(
                  begin: RelativeRect.fromLTRB(
                      100,
                      widget.index == 0
                          ? 30
                          : widget.index == 1
                              ? 20
                              : 10,
                      100,
                      widget.index == 0
                          ? 30
                          : widget.index == 1
                              ? 20
                              : 10),
                  end: RelativeRect.fromLTRB(
                      60,
                      widget.index == 0
                          ? 30
                          : widget.index == 1
                              ? 20
                              : 10,
                      140,
                      widget.index == 0
                          ? 30
                          : widget.index == 1
                              ? 20
                              : 10),
                ).animate(CurvedAnimation(
                  parent: widget.controller1!,
                  curve: Curves.fastOutSlowIn,
                )),
                child: Image.asset(
                  Assets.beer1Shadow,
                  height: widget.index == 0
                      ? 150
                      : widget.index == 1
                          ? 180
                          : 220,
                  // fit: BoxFit.fill,
                ),
              ),
              widget.bottleCount! >= 2
                  ? PositionedTransition(
                      rect: RelativeRectTween(
                        begin: RelativeRect.fromLTRB(
                            60,
                            widget.index == 0
                                ? 20
                                : widget.index == 1
                                    ? 12
                                    : 4,
                            140,
                            widget.index == 0
                                ? 20
                                : widget.index == 1
                                    ? 12
                                    : 4),
                        end: RelativeRect.fromLTRB(
                            100,
                            widget.index == 0
                                ? 20
                                : widget.index == 1
                                    ? 12
                                    : 4,
                            100,
                            widget.index == 0
                                ? 20
                                : widget.index == 1
                                    ? 12
                                    : 4),
                      ).animate(CurvedAnimation(
                        parent: widget.controller2!,
                        curve: Curves.fastOutSlowIn,
                      )),
                      child: AnimatedOpacity(
                        opacity: widget.bottleCount! > 2 ? 1.0 : 0.0,
                        duration: Duration(seconds: 1),
                        child: Image.asset(
                          Assets.beer1Shadow,
                          height: widget.index == 0
                              ? 150
                              : widget.index == 1
                                  ? 180
                                  : 220,
                          // fit: BoxFit.fill,
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          );
        },
      ),
    );
  }
}
