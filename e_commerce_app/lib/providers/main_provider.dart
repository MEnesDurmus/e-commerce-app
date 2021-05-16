import 'package:flutter/cupertino.dart';

class MainProvider with ChangeNotifier {
  int _selectedIndex = 0;

  get selectedIndex {
    return _selectedIndex;
  }

  void setIndex(int i) {
    _selectedIndex = i;
    notifyListeners();
  }
}
