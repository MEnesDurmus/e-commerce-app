import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/styles/app_text_styles.dart';
import 'package:e_commerce_app/util/device.dart';
import 'package:flutter/material.dart';

class SearchProductCard extends StatefulWidget {
  final Product product;

  const SearchProductCard(this.product, {Key? key}) : super(key: key);

  @override
  _SearchProductCardState createState() => _SearchProductCardState();
}

class _SearchProductCardState extends State<SearchProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.getHeight / 6,
      width: context.getWidth / 2,
      child: Card(
        color: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: context.getHeight / 12,
              width: context.getHeight / 12,
              margin: const EdgeInsets.only(left: 10.0, right: 10.0),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.product.imageUrl))),
            ),
            Container(
              height: context.getHeight / 12,
              width: context.getHeight / 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.product.name,
                    style: textStyle15GreyMedium,
                  ),
                  Text(
                    "\$" + widget.product.price.toString(),
                    style: textStyle15GreyRegular,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
