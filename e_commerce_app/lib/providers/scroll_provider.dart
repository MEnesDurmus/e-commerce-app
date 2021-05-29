import 'package:flutter/cupertino.dart';

class ScrollProvider with ChangeNotifier {
  int _selectedIndex = 0;

  get selectedIndex {
    return _selectedIndex;
  }

  void setIndex(int i) {
    _selectedIndex = i;
    notifyListeners();
  }
}
