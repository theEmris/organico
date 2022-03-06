import 'package:flutter/cupertino.dart';

class bottomNavProvider extends ChangeNotifier {
  int selectedPagenumber = 0;

  onItemTapped(int index) {
    selectedPagenumber = index;
    notifyListeners();
  }
}
