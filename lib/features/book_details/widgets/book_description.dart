import 'package:flutter/material.dart';

class BookDescription extends StatelessWidget {
  const BookDescription({
    super.key,
    required this.description,
  });
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Description',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          description,
          softWrap: true,
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(
          height: 20,
        ),
        // Row(
        //   children: [
        //     Text(
        //       'Overview',
        //       style: TextStyle(
        //         fontSize: 18,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     )
        //   ],
        // ),
        // SizedBox(
        //   height: 6,
        // ),
        // Text(
        //   'The Catcher in the Rye is a novel by J. D. Salinger, partially published in serial form in 1945-',
        //   softWrap: true,
        //   style: TextStyle(
        //     color: Colors.grey,
        //   ),
        // )
      ],
    );
  }
}
