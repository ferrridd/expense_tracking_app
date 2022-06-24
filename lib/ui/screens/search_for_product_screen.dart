import 'package:expense_tracking_app/models/apptheme_notifier.dart';
import 'package:expense_tracking_app/models/product_data.dart';
import 'package:expense_tracking_app/models/product_selected_notifier.dart';
import 'package:expense_tracking_app/models/store_selected_notifier.dart';
import 'package:expense_tracking_app/ui/widgets/secondary_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/search_widget.dart';

class SearchForProductScreen extends StatefulWidget {
  @override
  SearchForProductScreenState createState() => SearchForProductScreenState();
}

class SearchForProductScreenState extends State<SearchForProductScreen> {
  late List<Product> products;
  String query = '';

  @override
  void initState() {
    super.initState();

    products = Products.allProducts;
  }

  @override
  Widget build(BuildContext context) => Consumer<StoreSelectedNotififer>(
        builder: (BuildContext context,
                StoreSelectedNotififer storeSelectedNotififer, Widget? child) =>
            Consumer<AppThemeNotifier>(
          builder: (BuildContext context, AppThemeNotifier appThemeNotifier,
                  Widget? child) =>
              Scaffold(
            backgroundColor: appThemeNotifier.themeColors[3],
            appBar: PreferredSize(
                preferredSize:
                    Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
                child: SecondaryAppBar(
                  title: "Product Search",
                )),
            body: Column(
              children: <Widget>[
                buildSearch(),
                Expanded(
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];

                      return buildProduct(product);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Title',
        onChanged: searchProduct,
      );

  Widget buildProduct(Product product) => ListTile(
        trailing: Consumer<AppThemeNotifier>(
          builder: (BuildContext context, AppThemeNotifier appThemeNotifier,
                  Widget? child) =>
              Consumer<StoreSelectedNotififer>(
            builder: (BuildContext context,
                    StoreSelectedNotififer storeSelectedNotififer,
                    Widget? child) =>
                Consumer<ProductSelectedNotifier>(
              builder: (BuildContext context,
                      ProductSelectedNotifier productSelectedNotifier,
                      Widget? child) =>
                  GestureDetector(
                      onTap: () {
                        storeSelectedNotififer.allRemoved();
                        productSelectedNotifier.productIsSelected(product);
                      },
                      child: Icon(
                        Icons.add,
                        color: appThemeNotifier.themeColors[4],
                      )),
            ),
          ),
        ),
        leading: Image.network(
          product.imageLink,
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
        title: Consumer<AppThemeNotifier>(
            builder: (BuildContext context, AppThemeNotifier appThemeNotifier,
                    Widget? child) =>
                Text(
                  product.title,
                  style: TextStyle(color: appThemeNotifier.themeColors[4]),
                )),
      );

  void searchProduct(String query) {
    final products = Products.allProducts.where((product) {
      final titleLower = product.title.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.products = products;
    });
  }
}
