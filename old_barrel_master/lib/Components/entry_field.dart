import 'package:flutter/material.dart';

class EntryField extends StatefulWidget {
  EntryField({
    Key? key,
    this.label,
    this.hint,
    this.noBorder = false,
    this.initialValue,
  }) : super(key: key);

  @override
  State<EntryField> createState() => _EntryFieldState();

  final String? label;
  final String? hint;
  final bool noBorder;
  final String? initialValue;

  String? userInput;
}

class _EntryFieldState extends State<EntryField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label!,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: Theme.of(context).hintColor),
            textAlign: TextAlign.left,
          ),
          TextField(
              style: Theme.of(context).textTheme.bodyText1,
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: widget.noBorder
                          ? BorderSide.none
                          : BorderSide(color: Theme.of(context).hintColor)),
                  hintText: widget.hint,
                  hintStyle: Theme.of(context).textTheme.bodyText2),
              onChanged: (value) {
                widget.userInput = getUserInput(value);
              }),
        ],
      ),
    );
  }
}

String getUserInput(String input) {
  String userInput;
  userInput = input;
  return userInput;
}
