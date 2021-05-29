import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//Colors
const textColor = Color(0xff727c8e);
const textColor2 = Color(0xff515c6f);
const bgColor = Color(0xfff5f6f8);
const mRedAccent = Color(0xffff6969);

//Icons
var seeAllIcon = Image.asset("assets/icons/see all.png");
var apparelIcon = Image.asset("assets/icons/Apparel.png");
var beautyIcon = Image.asset("assets/icons/Beauty.png");
var shoesIcon = Image.asset("assets/icons/Shoes.png");

//Images
var backpackImage =
    "https://images-na.ssl-images-amazon.com/images/I/81UbNUfvstL._AC_UY550_.jpg";

//Others
double titleSize = 30;
var titleStyle = TextStyle(
    color: textColor, fontSize: titleSize, fontWeight: FontWeight.bold);

//Products
var productsJson =
    "https://60b2296262ab150017ae1c00.mockapi.io/products/product";
var product1 =
    "https://60b2296262ab150017ae1c00.mockapi.io/products/product?id=1";
var product2 =
    "https://60b2296262ab150017ae1c00.mockapi.io/products/product?id=2";
var product3 =
    "https://60b2296262ab150017ae1c00.mockapi.io/products/product?id=3";

Future<String> getData(String url) async {
  try {
    http.Response res = await http.get(Uri.parse(url));
    if (res.statusCode == 200)
      return res.body;
    else
      return "constFailed";
  } catch (e) {
    return "constFailed";
  }
}
