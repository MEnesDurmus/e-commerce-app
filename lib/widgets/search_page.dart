import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/styles/app_text_styles.dart';
import 'package:e_commerce_app/styles/colors.dart';
import 'package:e_commerce_app/util/util_library.dart';
import 'package:e_commerce_app/widgets/common_variables.dart';
import 'package:e_commerce_app/widgets/search/search_product_card.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  final List<String> recommended = const [
    "Denim Shorts",
    "Mini Skirt",
    "Jacket",
    "Accessories",
    "Sport Accessories",
    "Yoga Pants",
    "Eye Shadow"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            'Search',
            textAlign: TextAlign.start,
            style: TextStyle(
                color: textColor2, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
          child: Container(
            height: context.getHeight / 10,
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search Something",
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      borderSide: BorderSide.none),
                  fillColor: textColor.withOpacity(0.1)),
              style: TextStyle(fontSize: 15, color: textColor2),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Text(
                'RECENTLY VIEWED',
                style: TextStyle(
                  fontSize: 12.0,
                  letterSpacing: 0.7,
                  color: textColor2.withOpacity(0.5),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: TextButton(
                onPressed: () {},
                child: const Text('CLEAR'),
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 12),
                  primary: mRedAccent,
                ),
              ),
            ),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height / 8,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SearchProductCard(Product(
                  imageUrl:
                      "https://img.hatshopping.com/Soho-Herringbone-Business-Scarf-by-Barts-black.42221_rf4.jpg",
                  name: "NScarf",
                  price: "25")),
              SearchProductCard(Product(
                  imageUrl:
                      "https://img.hatshopping.com/Soho-Herringbone-Business-Scarf-by-Barts-black.42221_rf4.jpg",
                  name: "NScarf",
                  price: "25")),
              SearchProductCard(Product(
                  imageUrl:
                      "https://img.hatshopping.com/Soho-Herringbone-Business-Scarf-by-Barts-black.42221_rf4.jpg",
                  name: "NScarf",
                  price: "25")),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Text(
                'RECOMMENDED',
                style: TextStyle(
                  fontSize: 12.0,
                  letterSpacing: 0.7,
                  color: textColor2.withOpacity(0.5),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: TextButton(
                onPressed: () {},
                child: const Text('REFRESH'),
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 12),
                  primary: mRedAccent,
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 100,
          width: double.infinity,
          child: GridView.builder(
              semanticChildCount: recommended.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 5,
                  mainAxisExtent: context.getHeight / 20,
                  crossAxisSpacing: 5),
              itemCount: recommended.length,
              itemBuilder: (context, idx) {
                return Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Center(
                      child: Text(
                        recommended[idx],
                        style: textStyle12GreyRegular,
                      ),
                    ));
              }),
        ),
      ],
    );
  }
}
