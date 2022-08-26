import 'package:flutter/material.dart';

class CustomButton2 extends StatelessWidget {
  final Function? onTap;
  final Widget? prefix;
  final Widget? centerWidget;

  CustomButton2({this.onTap, this.prefix, this.centerWidget, this.suffix});

  final Widget? suffix;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
        child: Row(
          children: [
            prefix!,
            Spacer(
              flex: 2,
            ),
            centerWidget!,
            Spacer(),
            suffix!,
          ],
        ),
      ),
    );
  }
}
