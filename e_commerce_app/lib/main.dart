import 'package:e_commerce_app/providers/main_provider.dart';
import 'package:e_commerce_app/widgets/cart_page.dart';
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
        primarySwatch: white,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  static const List<Widget> _widgetOptions = <Widget>[
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
        body: Center(
          child: _widgetOptions.elementAt(provider.selectedIndex),
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
          selectedItemColor: Color(0xffff6969),
          unselectedItemColor: Color(0xff727c8e),
          onTap: provider.setIndex,
        ),
      )),
    );
  }
}

const MaterialColor white = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFFFFFFFF),
    100: const Color(0xFFFFFFFF),
    200: const Color(0xFFFFFFFF),
    300: const Color(0xFFFFFFFF),
    400: const Color(0xFFFFFFFF),
    500: const Color(0xFFFFFFFF),
    600: const Color(0xFFFFFFFF),
    700: const Color(0xFFFFFFFF),
    800: const Color(0xFFFFFFFF),
    900: const Color(0xFFFFFFFF),
  },
);
