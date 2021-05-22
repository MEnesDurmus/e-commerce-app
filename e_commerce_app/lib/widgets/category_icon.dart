import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  final Image image;
  final Text bottomText;

  const CategoryIcon(this.image, this.bottomText);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          image,
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                bottomText,
              ],
            ),
          )
        ],
      ),
    );
  }
}
