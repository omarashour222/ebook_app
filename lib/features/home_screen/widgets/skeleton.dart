import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget skeletonItems() {
  return GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 5,
      childAspectRatio: 0.8,
      mainAxisExtent: 350,
    ),
    itemCount: 10,
    itemBuilder: (context, index) {
      return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23),
                color: Colors.grey[300],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Container(
                height: 20,
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  color: Colors.grey[300],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
