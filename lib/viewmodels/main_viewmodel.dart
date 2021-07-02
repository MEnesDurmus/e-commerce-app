import 'package:e_commerce_app/redux/store.dart';

class MainViewModel {
  final AppState state;
  final BtmNavTapFunction onBtmNavTap;

  MainViewModel({required this.state, required this.onBtmNavTap});

  @override
  bool operator ==(Object other) =>
      identical(this, other) &&
      other is MainViewModel &&
      (runtimeType == other.runtimeType);

  @override
  int get hashCode => 0;
}

typedef void BtmNavTapFunction(int val);
