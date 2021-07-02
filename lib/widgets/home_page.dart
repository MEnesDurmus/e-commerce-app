import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/styles/app_text_styles.dart';
import 'package:e_commerce_app/styles/colors.dart';
import 'package:e_commerce_app/util/firebase.dart';
import 'package:e_commerce_app/widgets/categories_page.dart';
import 'package:e_commerce_app/widgets/components/category_icon.dart';
import 'package:e_commerce_app/widgets/components/icons.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final ScrollController scrollController = ScrollController();
  final _productStream = productsCollection.snapshots();

  void arrangePosition(ScrollController scrollController) async {
    await Future.delayed(Duration(seconds: 1));
    if (scrollController.offset > 160)
      scrollController.animateTo(320,
          duration: Duration(milliseconds: 5000), curve: Curves.fastOutSlowIn);
    else
      scrollController.animateTo(0,
          duration: Duration(milliseconds: 5000), curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    var tSize = MediaQuery.of(context).size;
    scrollController.addListener(() {
      print('offset ${scrollController.offset}');
    });
    double leftP = 82;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          alignment: Alignment.centerLeft,
          child: Text(
            'Categories',
            style: titleStyle,
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
                  left: leftP,
                  child: CategoryIcon(beautyIcon, Text('Beauty'))),
              Positioned(
                top: 0,
                left: leftP * 2,
                child: CategoryIcon(shoesIcon, Text('Shoes')),
              ),
              Positioned(
                top: 0,
                left: leftP * 3,
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoriesPage()),
                      );
                    },
                    child: CategoryIcon(seeAllIcon, Text('See All'))),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text('Latest', style: titleStyle),
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
        StreamBuilder<QuerySnapshot>(
            stream: _productStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong!');
              }

              return Container(
                height: 170,
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: snapshot.connectionState == ConnectionState.waiting
                    ? Container(
                        child: CircularProgressIndicator(
                          color: Colors.red,
                        ),
                      )
                    : ListViewWithSpace(
                        scrollController: ScrollController(),
                        children: [
                          ProductWidget(
                              product:
                                  Product.fromDocs(snapshot.data!.docs[0])),
                          ProductWidget(
                              product:
                                  Product.fromDocs(snapshot.data!.docs[1])),
                          ProductWidget(
                              product:
                                  Product.fromDocs(snapshot.data!.docs[2])),
                        ],
                      ),
              );
            }),
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
                      Text('SEE MORE', style: TextStyle(fontSize: 12)),
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
  final Product product;

  const ProductWidget({
    Key? key,
    required this.product,
  }) : super(key: key);
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
            product.imageUrl,
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
