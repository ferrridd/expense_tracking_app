import 'package:expense_tracking_app/models/date_data.dart';
import 'package:expense_tracking_app/models/product_price_info.dart';
import 'package:expense_tracking_app/ui/widgets/discounted_product.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class Product {
  final DateData? dateData;
  final int id;
  final String title;
  final String imageLink;
  final String? description;
  final List<ProductPriceInfo> productPriceInfo;

  Product(
      {required this.id,
      required this.title,
      required this.productPriceInfo,
      required this.imageLink,
      this.description,
      this.dateData});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        productPriceInfo: List<ProductPriceInfo>.from(
            json["productPriceInfo"].map((x) => ProductPriceInfo.fromJson(x))),
        title: json['title'],
        imageLink: json['imageLink'],
        dateData: DateData.fromJson(json["dateData"]),
        description: json["description"] == null ? null : json['description'],
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imageLink': imageLink,
      'description': description,
      'dateData': dateData?.toJson(),
      'productPriceInfo':
          List<dynamic>.from(productPriceInfo.map((x) => x.toJson())),
    };
  }
}

class Products {
  List<Product> findDiscProd() {
    final List<Product> _discountedProducts = [];
    for (int i = 0; i < allProducts.length; i++) {
      int count = 0;
      for (int j = 0; j < allProducts[i].productPriceInfo.length; j++) {
        if (allProducts[i].productPriceInfo[j].discountedPrice == null) {
          count++;
        }
      }
      if (count == 0) {
        _discountedProducts.add(allProducts[i]);
      }
    }
    return _discountedProducts;
  }

  List<Product> discountedProducts = [];
  Products() {
    this.discountedProducts = findDiscProd();
  }

  static final List<Product> allProducts = [
    Product(
        productPriceInfo: [
          ProductPriceInfo(
              price: 0.99,
              store: "Bravo",
              storeLocation: "Nariman Narimanov 18",
              discountedPrice: 0.89),
          ProductPriceInfo(
              price: 0.69, store: "Araz", storeLocation: "Yasamal"),
          ProductPriceInfo(price: 0.75, store: "Rahat", storeLocation: "28 May")
        ],
        dateData: DateData(day: 8, month: 12, year: 2021, amount: 2),
        id: 1,
        title: "Coca Cola - 0.5L",
        // prices: [0.99, 0.69, 0.75],
        // discountedPrices: [0.89],
        // storeNames: ["Bravo", "Araz", "Rahat"],
        // storeLocations: ["Nariman Narimanov 18", "Yasamal", "28 May"],
        imageLink:
            "https://bazarstore.az/220-large_default/coca-cola-500-ml-pet.jpg?1654964787305",
        description:
            "The Coca-Cola Co. is the nonalcoholic beverage company, which engages in the manufacture, market, and sale of non-alcoholic beverages which include sparkling soft drinks, water, enhanced water and sports drinks, juice, dairy and plant-based beverages, tea and coffee and energy drinks."),
    Product(
        id: 2,
        productPriceInfo: [
          ProductPriceInfo(
            price: 1.59,
            store: "Bravo",
            storeLocation: "Gara Garayev 64",
          ),
          ProductPriceInfo(
              price: 1.69, store: "Araz", storeLocation: "Yasamal"),
          ProductPriceInfo(
              price: 0.75, store: "Kontinental", storeLocation: "28 May")
        ],
        title: "Coca Cola - 1L",
        // prices: [1.59, 1.69, 1.75],
        // storeNames: ["Bravo", "Araz", "Kontinental"],
        // storeLocations: ["Gara Garayev 64", "Yasamal", "28 May"],
        description:
            "Coca-Cola, or Coke, is a carbonated soft drink manufactured by the Coca-Cola Company. Originally marketed as a temperance drink and intended as a patent medicine",
        imageLink:
            "https://www.myzaqatala.com/wp-content/uploads/2020/04/5156FefjlqL._SL1000_-600x600.jpg"),
    Product(
        productPriceInfo: [
          ProductPriceInfo(
            price: 3.46,
            store: "Balli",
            storeLocation: "Neftchiler avenue 109",
          ),
          ProductPriceInfo(
              price: 3.69, store: "Bravo", storeLocation: "Yasamal"),
          ProductPriceInfo(price: 2.75, store: "Rahat", storeLocation: "28 May")
        ],
        id: 3,
        title: "Domestos - 1L",
        // prices: [3.46, 3.69, 2.75],
        // discountedPrices: [2.59],
        // storeNames: ["Balli", "Bravo", "Rahat"],
        // storeLocations: ["Neftchiler avenue 109", "Yasamal", "28 May"],
        description:
            "Domestos is a British brand of household cleaning range which contains bleach. It is manufactured by Unilever. Domestos contains 100,000 ppm of the active component",
        imageLink:
            "https://unimall.az/images/detailed/313/1565338956_976a4c22b672553967f1e366b684ef7d.jpg"),
    Product(
        productPriceInfo: [
          ProductPriceInfo(
              price: 2.6,
              store: "Araz",
              storeLocation: "near 28 MAY m/s",
              discountedPrice: 1.99),
        ],
        id: 4,
        title: "Lay's \"Cheese\"",
        // prices: [2.6],
        // discountedPrices: [1.99],
        // storeNames: ["Araz"],
        // storeLocations: ["near 28 MAY m/s"],
        description:
            "Lay's is a brand of potato chips, as well as the name of the company that founded the chip brand in the United States. The brand has also sometimes been referred to as Frito-Lay",
        imageLink:
            "https://bravomarket.online/upload/iblock/8f7/8f7ed58bd9514e716215cb1ecb146aa9.jpg"),
    Product(
        id: 5,
        productPriceInfo: [
          ProductPriceInfo(
              price: 10.99,
              store: "Neptun",
              storeLocation: "Sumgayit",
              discountedPrice: 8.97),
        ],
        title: "Westgold - 0.227Kg",
        // prices: [10.99],
        // discountedPrices: [8.97],
        // storeNames: ["Neptun"],
        description:
            "Westgold Butter. Crafted on New Zealand's West Coast, loved around the world. Westgold butter is traditionally churned from fresh cream using the time-honoured Fritz Churn method resulting in a rich flavour and creamier texture.",
        // storeLocations: ["Sumgayit"],
        imageLink:
            "https://westgold.com/assets/article-images/J003174-USA-Butter-Render-227g-Salted-Cream-Background-v2__FillWzk4MCw3MDBd.jpg"),
    Product(
        id: 6,
        productPriceInfo: [
          ProductPriceInfo(
              price: 1.75,
              store: "Khazar",
              storeLocation: "near Gandjlick m/s",
              discountedPrice: 1.19),
        ],
        title: "Eggs - 10P",
        description:
            "And while eggs are, indeed, an animal product, the USDA's MyPlate groups them as a source of protein, similar to meat, poultry, fish, nuts, and beans.",
        // prices: [1.75],
        // discountedPrices: [1.19],
        // storeNames: ["Khazar"],
        // storeLocations: ["near Gandjlick m/s"],
        imageLink: "https://images.megapixl.com/5703/57031776.jpg"),
    Product(
        productPriceInfo: [
          ProductPriceInfo(
            price: 1.39,
            store: "Bazar Store",
            storeLocation: "Ziya Bunyadov 3",
          ),
        ],
        id: 7,
        title: "Sirab - 2L",
        description:
            "“Sirab” water, which is enriched with minerals, is recognized not only in Azerbaijan but also in Russia, Belarus, Kazakhstan, Turkey, Turkmenistan, China, Iraq",
        // prices: [1.39],
        // storeNames: ["Bazar Store"],
        // storeLocations: ["Ziya Bunyadov 3"],
        imageLink:
            "https://bazarstore.az/234-large_default/sirab-qazli-su-1lt-pet.jpg"),
    Product(
        productPriceInfo: [
          ProductPriceInfo(
              price: 1.24,
              store: "Bazar Store",
              storeLocation: "Memar Adjemy 99",
              discountedPrice: 0.99),
        ],
        id: 8,
        title: "Alpen Gold",
        // prices: [1.24],
        // discountedPrices: [0.99],
        // storeNames: ["Bazar Store"],
        // storeLocations: ["Memar Adjemy 99"],
        description:
            "Alpen Gold is one of the leading chocolate brands in Eastern Europe, including Poland and Ukraine. Combining premium chocolate with irresistible ingredients like nuts, raisins and liqueur",
        imageLink: "https://unimall.az/images/detailed/182/a47.jpg"),
    Product(
        productPriceInfo: [
          ProductPriceInfo(
              price: 11.49,
              store: "Bravo",
              storeLocation: "Zabrat",
              discountedPrice: 8.97),
        ],
        id: 9,
        title: "Westgold - 0.227Kg",
        // prices: [11.49],
        // discountedPrices: [8.97],
        description:
            "Westgold Butter. Crafted on New Zealand's West Coast, loved around the world. Westgold butter is traditionally churned from fresh cream using the time-honoured Fritz Churn method resulting in a rich flavour and creamier texture.",
        // storeNames: ["Bravo"],
        // storeLocations: ["Zabrat"],
        imageLink:
            "https://westgold.com/assets/article-images/J003174-USA-Butter-Render-227g-Salted-Cream-Background-v2__FillWzk4MCw3MDBd.jpg"),
    Product(
        productPriceInfo: [
          ProductPriceInfo(
            price: 10.13,
            store: "Balli",
            storeLocation: "Gunewli dist",
          ),
        ],
        id: 10,
        title: "Westgold - 0.2Kg",
        // prices: [10.13],
        // storeNames: ["Balli"],
        description:
            "Westgold Butter. Crafted on New Zealand's West Coast, loved around the world. Westgold butter is traditionally churned from fresh cream using the time-honoured Fritz Churn method resulting in a rich flavour and creamier texture.",
        // storeLocations: ["Gunewli dist."],
        imageLink:
            "https://westgold.com/assets/article-images/J003174-USA-Butter-Render-227g-Salted-Cream-Background-v2__FillWzk4MCw3MDBd.jpg"),
    Product(
        productPriceInfo: [
          ProductPriceInfo(
              price: 9.98,
              store: "Khazar",
              storeLocation: "Gunewli dist",
              discountedPrice: 8.19),
        ],
        id: 11,
        title: "Westgold - 0.15Kg",
        description:
            "Westgold Butter. Crafted on New Zealand's West Coast, loved around the world. Westgold butter is traditionally churned from fresh cream using the time-honoured Fritz Churn method resulting in a rich flavour and creamier texture.",
        // prices: [9.98],
        // discountedPrices: [8.19],
        // storeNames: ["Khazar"],
        // storeLocations: ["Gunewli dist."],
        imageLink:
            "https://westgold.com/assets/article-images/J003174-USA-Butter-Render-227g-Salted-Cream-Background-v2__FillWzk4MCw3MDBd.jpg"),
  ];
}

Products products = Products();



















// // class ProductData {
// //   final String image;
// //   final String tag;
// //   final Map<String, double> prices;
// //   ProductData({required this.image, required this.tag, required this.prices});

// //   factory ProductData.fromJson(Map<String, dynamic> json) => ProductData( 
// //      image: json['image'], 
// //      tag: json['tag'], 
// //      prices: json['prices'], 
// //      currency: EnumConverter.enumFromString(json['currency'])!, //  
// //      imageLink: json['imageLink'], 
// //      storeNames: json['storeNames'], 
// //      storeLocations: json['storeLocations'], 
// //      discountedPrices: json['discountedPrices'], 
// //      description: json['description'], 
// //    ); 
  
// //    Map<String, dynamic> toJson() { 
// //      return { 
// //        'image': image, 
// //        'tag': tag, 
// //        'prices': prices, 
// //        'currency': currency.enumToString(),  
// //        'imageLink': imageLink, 
// //        'storeNames': storeNames, 
// //        'storeLocations': storeLocations, 
// //        'discountedPrices': discountedPrices, 
// //        'description': description, 
// //      }; 
// //    } 
// // }

// // List<ProductData> Products = [
// //   ProductData(image: "assets/images/alpengold.jpg", tag: "Alpen Gold", prices: {
// //     "Bravo": 5.0,
// //     "Araz": 20.0,
// //     "Rahat": 30.0,
// //   }),
// //   ProductData(image: "assets/images/lays.jpg", tag: "Lays", prices: {
// //     "Bravo": 8.0,
// //     "Araz": 9.0,
// //     "Rahat": 8.2,
// //   }),
// //   ProductData(image: "assets/images/oreo.jpg", tag: "Oreo", prices: {
// //     "Bravo": 5.0,
// //     "Araz": 4.0,
// //     "Rahat": 4.5,
// //   }),
// //   ProductData(image: "assets/images/alpengold.jpg", tag: "Alpen Gold", prices: {
// //     "Bravo": 5.0,
// //     "Araz": 20.0,
// //     "Rahat": 30.0,
// //   }),
// //   ProductData(image: "assets/images/lays.jpg", tag: "Lays", prices: {
// //     "Bravo": 8.0,
// //     "Araz": 9.0,
// //     "Rahat": 8.2,
// //   }),
// // ];
// // To parse this JSON data, do
// //
// //     final productData = productDataFromJson(jsonString);

// import 'package:meta/meta.dart';
// import 'dart:convert';

// List<ProductData> productDataFromJson(String str) => List<ProductData>.from(json.decode(str).map((x) => ProductData.fromJson(x)));

// String productDataToJson(List<ProductData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class ProductData {
//     ProductData({
//         required this.image,
//         required this.tag,
//         required this.prices,
//     });

//     final String image;
//     final String tag;
//     final Prices prices;

//     factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
//         image: json["image"],
//         tag: json["tag"],
//         prices: Prices.fromJson(json["prices"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "image": image,
//         "tag": tag,
//         "prices": prices.toJson(),
//     };
// }

// class Prices {
//     Prices({
//         required this.bravo,
//         required this.araz,
//         required this.rahat,
//     });

//     final int bravo;
//     final int araz;
//     final int rahat;

//     factory Prices.fromJson(Map<String, dynamic> json) => Prices(
//         bravo: json["Bravo"],
//         araz: json["Araz"],
//         rahat: json["Rahat"],
//     );

//     Map<String, dynamic> toJson() => {
//         "Bravo": bravo,
//         "Araz": araz,
//         "Rahat": rahat,
//     };
// }
