import 'package:expense_tracking_app/models/product_price_info.dart';
import 'package:flutter/cupertino.dart';

class StoreSelectedNotififer extends ChangeNotifier {
  List<ProductPriceInfo> pricesInStores = [];
  List<bool> isSelectedList = List<bool>.filled(50, false);
  void storeSelected(ProductPriceInfo productPriceInfo, int index) {
    isSelectedList[index] = true;
    if (!pricesInStores.contains(productPriceInfo)) {
      this.pricesInStores.add(productPriceInfo);
    }
    notifyListeners();
  }

  void allRemoved() {
    isSelectedList = List<bool>.filled(50, false);

    pricesInStores = [];
    notifyListeners();
  }
}
