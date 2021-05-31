import 'package:e_commerce_app/providers/main_provider.dart';
import 'package:e_commerce_app/styles/colors.dart';
import 'package:e_commerce_app/widgets/cart_page.dart';
import 'package:e_commerce_app/widgets/common_variables.dart';
import 'package:e_commerce_app/widgets/home_page.dart';
import 'package:e_commerce_app/widgets/more_page.dart';
import 'package:e_commerce_app/widgets/profile_page.dart';
import 'package:e_commerce_app/widgets/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyProvider());
}

class MyProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MainProvider(),
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: bgMaterialColor,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SearchPage(),
    CartPage(),
    ProfilePage(),
    MorePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, provider, _) => Container(
          child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: [
            GestureDetector(child: Icon(Icons.message)),
            SizedBox(width: 10),
            GestureDetector(child: Icon(Icons.notifications)),
            SizedBox(width: 10)
          ],
          elevation: 0,
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: bgMaterialColor,
            child: _widgetOptions.elementAt(provider.selectedIndex),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_rounded),
              label: 'More',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: provider.selectedIndex,
          selectedItemColor: mRedAccent,
          unselectedItemColor: ravenGrey,
          onTap: provider.setIndex,
        ),
      )),
    );
  }
}

const MaterialColor bgMaterialColor = const MaterialColor(
  0xfff5f6f8,
  const <int, Color>{
    50: const Color(0xfff5f6f8),
    100: const Color(0xfff5f6f8),
    200: const Color(0xfff5f6f8),
    300: const Color(0xfff5f6f8),
    400: const Color(0xfff5f6f8),
    500: const Color(0xfff5f6f8),
    600: const Color(0xfff5f6f8),
    700: const Color(0xfff5f6f8),
    800: const Color(0xfff5f6f8),
    900: const Color(0xfff5f6f8),
  },
);
