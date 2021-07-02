import 'package:e_commerce_app/main.dart';
import 'package:e_commerce_app/styles/app_text_styles.dart';
import 'package:e_commerce_app/styles/colors.dart';
import 'package:e_commerce_app/widgets/components/category_icon.dart';
import 'package:e_commerce_app/widgets/components/icons.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgMaterialColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 58, left: 21, right: 21),
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: mRedAccent,
                    ),
                  ),
                ],
              ),
              Text(
                "All Categories",
                style: titleStyle,
              ),
              ListView(
                children: [
                  Row(children: [
                    Column(
                      children: [CategoryIcon(apparelIcon, Text('Apperal'))],
                    ),
                    Column(),
                  ])
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
