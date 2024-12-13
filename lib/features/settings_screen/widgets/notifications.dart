import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool _isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Notifications',
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
            Icon(CupertinoIcons.bell),
            Spacer(
              flex: 1,
            ),
            Text(
              'Notifications',
              style: TextStyle(fontSize: 17),
            ),
            Spacer(
              flex: 7,
            ),
            Switch(
              value: _isSwitchOn,
              onChanged: (value) {
                setState(() {
                  _isSwitchOn = value;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
