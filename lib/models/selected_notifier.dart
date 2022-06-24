import 'package:flutter/cupertino.dart';

class SelectedNotifier extends ChangeNotifier {
  bool isSelected = false;

  void onTappedAction() {
    isSelected = true;
    notifyListeners();
  }

  void productRemoved() {
    isSelected = false;
    notifyListeners();
  }
}
