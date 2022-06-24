import 'package:expense_tracking_app/models/apptheme_notifier.dart';
import 'package:expense_tracking_app/models/product_data.dart';
import 'package:expense_tracking_app/models/product_price_info.dart';
import 'package:expense_tracking_app/models/product_selected_notifier.dart';
import 'package:expense_tracking_app/models/store_selected_notifier.dart';
import 'package:expense_tracking_app/ui/widgets/secondary_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/search_widget.dart';

class SearchForStoreScreen extends StatefulWidget {
  final Product product;
  SearchForStoreScreen({Key? key, required this.product});
  @override
  SearchForStoreScreenState createState() => SearchForStoreScreenState();
}

class SearchForStoreScreenState extends State<SearchForStoreScreen> {
  late List<ProductPriceInfo> stores;
  String query = '';

  @override
  void initState() {
    super.initState();

    stores = this.widget.product.productPriceInfo;
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
                  title: "Store Search",
                )),
            body: Column(
              children: <Widget>[
                buildSearch(),
                Expanded(
                  child: ListView.builder(
                    itemCount: stores.length,
                    itemBuilder: (context, index) {
                      final store = stores[index];

                      return storeSelectedNotififer.isSelectedList[index] ==
                              false
                          ? buildStore(store, index)
                          : Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green)),
                                child: buildStore(store, index),
                              ),
                            );
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

  Widget buildStore(ProductPriceInfo productPriceInfo, int index) => ListTile(
        trailing: Consumer<AppThemeNotifier>(
          builder: (BuildContext context, AppThemeNotifier appThemeNotifier,
                  Widget? child) =>
              Consumer<StoreSelectedNotififer>(
            builder: (BuildContext context,
                    StoreSelectedNotififer storeSelectedNotififer,
                    Widget? child) =>
                GestureDetector(
                    onTap: () {
                      storeSelectedNotififer.storeSelected(
                          productPriceInfo, index);
                    },
                    child: Icon(
                      Icons.add,
                      color: appThemeNotifier.themeColors[4],
                    )),
          ),
        ),
        title: Consumer<AppThemeNotifier>(
            builder: (BuildContext context, AppThemeNotifier appThemeNotifier,
                    Widget? child) =>
                Text(
                  productPriceInfo.store,
                  style: TextStyle(color: appThemeNotifier.themeColors[4]),
                )),
        subtitle: Consumer<AppThemeNotifier>(
            builder: (BuildContext context, AppThemeNotifier appThemeNotifier,
                    Widget? child) =>
                Text(
                  productPriceInfo.storeLocation,
                  style: TextStyle(color: appThemeNotifier.themeColors[4]),
                )),
      );

  void searchProduct(String query) {
    final stores = widget.product.productPriceInfo.where((product) {
      final titleLower = product.store.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.stores = stores;
    });
  }
}
