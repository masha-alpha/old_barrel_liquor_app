import 'package:flutter/material.dart';
import 'package:old_barrel/Locale/locale.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.text,
    this.onTap,
    this.bgColor,
    this.textColor,
  }) : super(key: key);
  final String? text;
  final Function? onTap;
  final Color? bgColor;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 20),
          backgroundColor: bgColor ?? Theme.of(context).primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        onPressed: onTap as void Function()?,
        child: Text(
          text == null
              ? AppLocalizations.of(context)!.continuee!.toUpperCase()
              : text!.toUpperCase(),
          style: Theme.of(context).textTheme.button!.copyWith(
              color: textColor ?? Theme.of(context).backgroundColor,
              fontSize: 16.5,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
