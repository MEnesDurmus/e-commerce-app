import 'package:e_commerce_app/redux/actions.dart';
import 'package:e_commerce_app/redux/reducers.dart';
import 'package:e_commerce_app/styles/colors.dart';
import 'package:e_commerce_app/viewmodels/main_viewmodel.dart';
import 'package:e_commerce_app/widgets/cart_page.dart';
import 'package:e_commerce_app/widgets/home_page.dart';
import 'package:e_commerce_app/widgets/auth_page/auth_page.dart';
import 'package:e_commerce_app/widgets/more_page.dart';
import 'package:e_commerce_app/widgets/profile_page.dart';
import 'package:e_commerce_app/widgets/search_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'redux/redux.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final store =
      Store<AppState>(appReducer, initialState: AppState.initialState());
  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  MyApp(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: bgMaterialColor,
        ),
        initialRoute: '/auth',
        routes: {
          '/': (context) => MainPage(),
          '/auth': (context) => AuthPage(),
        },
      ),
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
    return StoreConnector<AppState, MainViewModel>(
      distinct: true,
      converter: (store) => MainViewModel(
          state: store.state,
          onBtmNavTap: (val) => store.dispatch(IndexChangeAction(val))),
      builder: (context, vm) => Container(
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
            child: _widgetOptions.elementAt(vm.state.currentIndex),
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
          currentIndex: vm.state.currentIndex,
          selectedItemColor: mRedAccent,
          unselectedItemColor: ravenGrey,
          onTap: vm.onBtmNavTap,
        ),
      )),
    );
  }
}
