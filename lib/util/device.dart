import 'package:flutter/cupertino.dart';

extension DeviceSize on BuildContext {
  get getHeight => MediaQuery.of(this).size.height;
  get getWidth => MediaQuery.of(this).size.width;
}
