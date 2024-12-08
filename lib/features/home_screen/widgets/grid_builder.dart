import 'package:ebook_app/features/home_screen/widgets/actual_items.dart';
import 'package:flutter/material.dart';

Widget gridBuilder() {
  return GridView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 5,
        childAspectRatio: 0.8,
        mainAxisExtent: 350),
    itemCount: 10,
    itemBuilder: (context, index) {
      return actualItems();
    },
  );
}
