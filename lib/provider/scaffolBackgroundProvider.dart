import 'package:flutter/material.dart';

class ScaffoldBackgroundProvider extends ChangeNotifier {
  var backgroundColorofScaffold = Color(0XFFEBEAF3);

  changeColor() {
    backgroundColorofScaffold == Color(0xFF171725)
        ? backgroundColorofScaffold = Color(0XFFEBEAF3)
        : backgroundColorofScaffold = Color(0xFF171725);
    notifyListeners();
  }
}
