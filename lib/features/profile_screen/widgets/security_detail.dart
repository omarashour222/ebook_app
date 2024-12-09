import 'package:ebook_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecurityDetail extends StatelessWidget {
  const SecurityDetail(
      {super.key, required this.text, required this.value, this.onChanged});
  final String text;
  final bool value;
  final Function(bool)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        Spacer(),
        CupertinoSwitch(
          activeColor: kPrimaryColor,
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
