import 'package:flutter/material.dart';

class EntryField extends StatefulWidget {
  const EntryField({
    Key? key,
    this.label,
    this.hint,
    this.noBorder = false,
    this.initialValue,
  }) : super(key: key);

  final String? label;
  final String? hint;
  final bool noBorder;
  final String? initialValue;

  @override
  State<EntryField> createState() => _EntryFieldState();
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
          TextFormField(
            initialValue: widget.initialValue,
            style: Theme.of(context).textTheme.bodyText1,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: widget.noBorder
                        ? BorderSide.none
                        : BorderSide(color: Theme.of(context).hintColor)),
                hintText: widget.hint,
                hintStyle: Theme.of(context).textTheme.bodyText2),
            onChanged: (value) {
              setState(() {
                TextEditingController userInput = TextEditingController();
                String text = "";

                userInput.text = value.toString();
              });
            },
          ),
        ],
      ),
    );
  }
}
