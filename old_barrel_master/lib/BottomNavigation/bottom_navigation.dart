import 'package:flutter/material.dart';
import 'package:old_barrel/Assets/assets.dart';
import 'package:old_barrel/BottomNavigation/Account/account_page.dart';
import 'package:old_barrel/BottomNavigation/MyOrders/my_orders.dart';
import 'package:old_barrel/Locale/locale.dart';

import 'Home/home_page.dart';

class AppNavigation extends StatefulWidget {
  @override
  _AppNavigationState createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomePage(),
    MyOrdersPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    final List<BottomNavigationBarItem> _items = [
      BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(
              Assets.footer12,
            ),
          ),
          label: locale.home),
      BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(
              Assets.footer22,
            ),
          ),
          label: locale.myOrders),
      BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(
              Assets.footer32,
            ),
          ),
          label: locale.account),
    ];
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        elevation: 10,
        showUnselectedLabels: true,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).hintColor,
        // selectedIconTheme: IconThemeData(color: blackColor),
        // unselectedIconTheme: IconThemeData(color: blackColor),
        items: _items,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
