import 'package:flutter/cupertino.dart';

class BottomBarItemNotifier extends ChangeNotifier {
  int selectedIndex = 0;
  void onItemTapped(int index) {
    this.selectedIndex = index;
    notifyListeners();
  }
}
