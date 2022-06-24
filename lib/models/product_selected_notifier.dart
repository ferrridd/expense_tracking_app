import 'package:expense_tracking_app/models/product_data.dart';
import 'package:flutter/cupertino.dart';

class ProductSelectedNotifier extends ChangeNotifier {
  List<Product> products = [];
  void productIsSelected(Product product) {
    this.products = [];
    this.products.add(product);
    notifyListeners();
  }

  void productIsRemoved() {
    this.products = [];
    notifyListeners();
  }
}
