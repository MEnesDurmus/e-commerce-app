<<<<<<< HEAD:lib/widgets/home_page.dart
import 'package:e_commerce_app/styles/colors.dart';
=======
import 'dart:convert';

import 'package:e_commerce_app/models/product.dart';
>>>>>>> 019ab431ad3cfa73afdddce21d22675f5c5852c9:e_commerce_app/lib/widgets/home_page.dart
import 'package:e_commerce_app/widgets/category_icon.dart';
import 'package:e_commerce_app/widgets/common_variables.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController scrollController = ScrollController();
  List<Product> products = <Product>[];

  void arrangePosition(ScrollController scrollController) async {
    await Future.delayed(Duration(seconds: 1));
    if (scrollController.offset > 160)
      scrollController.animateTo(320,
          duration: Duration(milliseconds: 5000), curve: Curves.fastOutSlowIn);
    else
      scrollController.animateTo(0,
          duration: Duration(milliseconds: 5000), curve: Curves.fastOutSlowIn);
  }

  _HomePageState() {
    getJsonData().then((value) => setState(() {
          products = value;
        }));
  }

  Future<List<Product>> getJsonData() async {
    try {
      var res = await http.get(Uri.parse(productsJson));
      if (res.statusCode == 200) {
        var iJson = jsonDecode(res.body);
        return List<Product>.from(
            iJson.map((model) => Product.fromJson(model)));
      } else
        return [];
    } catch (e) {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    var tSize = MediaQuery.of(context).size;
    scrollController.addListener(() {
      print('offset ${scrollController.offset}');
    });
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          alignment: Alignment.centerLeft,
          child: Text(
            'Categories',
            style: TextStyle(
                fontSize: titleSize,
                fontWeight: FontWeight.bold,
                color: textColor2),
          ),
        ),
        Container(
          height: 100,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: CategoryIcon(apparelIcon, Text('Apperal')),
              ),
              Positioned(
                  top: 0,
                  left: 80,
                  child: CategoryIcon(
                    beautyIcon,
                    Text('Beauty'),
                  )),
              Positioned(
                top: 0,
                left: 160,
                child: CategoryIcon(shoesIcon, Text('Shoes')),
              ),
              Positioned(
                top: 0,
                left: 240,
                child: CategoryIcon(seeAllIcon, Text('See All')),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text(
            'Latest',
            style: TextStyle(
                fontSize: titleSize,
                fontWeight: FontWeight.bold,
                color: textColor2),
          ),
        ),
        Container(
          height: 200,
          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
          child: ListViewWithSpace(
            scrollController: scrollController,
            children: [
              ColorfulBox(
                size: tSize,
                colors: [Colors.blue.shade300, Colors.blue.shade700],
              ),
              GestureDetector(
                onTap: () {},
                child: ColorfulBox(
                  size: tSize,
                  colors: [Colors.orangeAccent, Colors.deepOrangeAccent],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 170,
          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
<<<<<<< HEAD:lib/widgets/home_page.dart
          child: ListViewWithSpace(
            children: [
              ProductWidget(
                image: backpackImage,
                productName: 'Backpack',
                price: '\$20.00',
              ),
              ProductWidget(
                image: backpackImage,
                productName: 'Backpack',
                price: '\$20.00',
              ),
              ProductWidget(
                image: backpackImage,
                productName: 'Backpack',
                price: '\$20.00',
              ),
              ProductWidget(
                image: backpackImage,
                productName: 'Backpack',
                price: '\$20.00',
              ),
            ],
          ),
=======
          child: products.isEmpty
              ? Container(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                )
              : ListViewWithSpace(
                  scrollController: ScrollController(),
                  children: products.isEmpty
                      ? []
                      : [
                          ProductWidget(product: products[0]),
                          ProductWidget(product: products[1]),
                          ProductWidget(product: products[2]),
                        ],
                ),
>>>>>>> 019ab431ad3cfa73afdddce21d22675f5c5852c9:e_commerce_app/lib/widgets/home_page.dart
        ),
      ],
    );
  }
}

class ColorfulBox extends StatelessWidget {
  final Size size;
  final List<Color> colors;
  ColorfulBox({required this.size, required this.colors});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 184,
      width: size.width - 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
            colors: colors,
            begin: Alignment.bottomLeft,
            end: Alignment.topRight),
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => Row(
          children: [
            Column(
              children: [
                Container(
                  width: constraints.maxWidth * (5 / 9),
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'For all your summer clothing needs',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  height: 40,
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'SEE MORE',
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 30,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: mRedAccent, shape: BoxShape.circle),
                        child: Container(
                          margin: EdgeInsets.all(5),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ListViewWithSpace extends StatelessWidget {
  final List<Widget> children;
  final ScrollController scrollController;
  ListViewWithSpace({required this.children, required this.scrollController});

  List<Widget> getChildren() {
    List<Widget> result = <Widget>[];

    result.add(SizedBox(width: 10));
    for (var child in children) {
      result.add(child);
      result.add(SizedBox(width: 10));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: getChildren(),
      controller: scrollController,
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return ScrollablePositionedList.builder(
  //     scrollDirection: Axis.horizontal,
  //     itemCount: children.length,
  //     itemBuilder: (context, index) => children[index],
  //     itemScrollController: itemScrollController,
  //   );
  // }
}

class ProductWidget extends StatelessWidget {
<<<<<<< HEAD:lib/widgets/home_page.dart
  final String image;
  final String productName;
  final String price;

  const ProductWidget(
      {Key? key,
      required this.image,
      required this.productName,
      required this.price})
      : super(key: key);
=======
  final Product product;

  const ProductWidget({
    Key? key,
    required this.product,
  }) : super(key: key);
>>>>>>> 019ab431ad3cfa73afdddce21d22675f5c5852c9:e_commerce_app/lib/widgets/home_page.dart
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            product.urlLink,
            height: 100,
          ),
          Text(
            product.name,
            style: TextStyle(color: textColor),
          ),
          Text(
            product.price,
            style: TextStyle(fontWeight: FontWeight.bold, color: textColor2),
          )
        ],
      ),
    );
  }
}
