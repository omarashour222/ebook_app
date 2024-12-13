import 'package:ebook_app/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Column appTheme(ThemeProvider themeProvider) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'App Theme',
        style: TextStyle(
            fontSize: 17,
            color: const Color.fromARGB(255, 129, 129, 129),
            fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 5,
      ),
      Row(
        children: [
          Icon(CupertinoIcons.moon),
          Spacer(
            flex: 1,
          ),
          Text(
            'Dark Mode',
            style: TextStyle(fontSize: 17),
          ),
          Spacer(
            flex: 7,
          ),
          Switch(
            value: themeProvider.themeMode == ThemeMode.dark,
            onChanged: (value) {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
    ],
  );
}
