import 'package:e_commerce_app/widgets/category_icon.dart';
import 'package:e_commerce_app/widgets/common_variables.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tSize = MediaQuery.of(context).size;
    double iconSize = 100;
    return Column(
      children: [
        Stack(
          children: [
            Row(
              children: [
                CategoryIcon(apparelIcon, Text('Apperal')),
                CategoryIcon(beautyIcon, Text('Beauty')),
                CategoryIcon(shoesIcon, Text('Shoes')),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.all(20),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) =>
                Container(
                    height: 184,
                    width: constraints.maxWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                          colors: [Colors.blue.shade300, Colors.blue.shade700],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight),
                    ),
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) =>
                              Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                width: constraints.maxWidth * (5 / 9),
                                padding: EdgeInsets.all(16),
                                child: Text(
                                  'For all your summer clothing needs',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
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
                                          color: mRedAccent,
                                          shape: BoxShape.circle),
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
                    )),
          ),
        ),
      ],
    );
  }
}
