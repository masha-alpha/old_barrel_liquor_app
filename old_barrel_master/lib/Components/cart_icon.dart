import 'package:flutter/material.dart';
import 'package:old_barrel/Routes/page_routes.dart';

class CartIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          IconButton(
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Theme.of(context).backgroundColor,
              ),
              onPressed: () {
                Navigator.pushNamed(context, PageRoutes.cartPage);
              }),
          PositionedDirectional(
            end: 10,
            top: 10,
            child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              radius: 5,
            ),
          ),
        ],
      ),
    );
  }
}
