import 'package:flutter/material.dart';
import 'package:old_barrel/Locale/locale.dart';

class EntryFieldDark extends StatelessWidget {
  final Function? onTap;
  final bool? readOnly;
  final Color? fillColor;
  final Widget? prefixIcon;
  final String? hintText;
  final Widget? suffixIcon;

  const EntryFieldDark(
      {this.onTap,
      this.readOnly,
      this.fillColor,
      this.prefixIcon,
      this.hintText,
      this.suffixIcon});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap as void Function()?,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
          hintText: hintText ?? AppLocalizations.of(context)!.searchYourPoison,
          isDense: true,
          prefixIcon: prefixIcon ??
              Icon(
                Icons.search,
                size: 20,
                color: Theme.of(context).primaryColor,
              ),
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: fillColor ?? Theme.of(context).scaffoldBackgroundColor,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8))),
    );
  }
}
