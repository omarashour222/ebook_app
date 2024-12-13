import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Column options(
    {required String text,
    required String opt1,
    required String opt2,
    required IconData icn1,
    required IconData icn2}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        text,
        style: TextStyle(
            fontSize: 17,
            color: const Color.fromARGB(255, 129, 129, 129),
            fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 15,
      ),
      Row(
        children: [
          Icon(icn1),
          Spacer(
            flex: 1,
          ),
          Text(
            opt1,
            style: TextStyle(fontSize: 17),
          ),
          Spacer(
            flex: 7,
          ),
          Icon(Icons.arrow_forward_ios_rounded)
        ],
      ),
      SizedBox(
        height: 15,
      ),
      Row(
        children: [
          Icon(icn2),
          Spacer(
            flex: 1,
          ),
          Text(
            opt2,
            style: TextStyle(fontSize: 17),
          ),
          Spacer(
            flex: 7,
          ),
          Icon(Icons.arrow_forward_ios_rounded)
        ],
      ),
    ],
  );
}
