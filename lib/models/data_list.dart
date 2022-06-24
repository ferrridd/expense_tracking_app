import '/models/product_data.dart';

class DataList {
  List<String> productList = [];
  DataList() {
    for (var i = 0; i < Products.allProducts.length; i++) {
      productList.add(Products.allProducts[i].title);
    }
    productList = productList.toSet().toList();
  }
}

DataList dataList = DataList();
List<String> storeList = [
  "Bravo",
  "Araz",
  "Rahat",
  "Kontinental",
  "Balli",
  "Neptun",
  "Khazar",
  "Bazar Store",
];
List<String> productList = dataList.productList;
