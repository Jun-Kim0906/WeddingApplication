import 'package:flutter/material.dart';
import 'package:my_wedding_test/models/store/store_model.dart';
import 'package:my_wedding_test/widgets/product_card.dart';

class HomePackagePage extends StatefulWidget {
  const HomePackagePage({Key key}) : super(key: key);

  @override
  _HomePackagePageState createState() => _HomePackagePageState();
}

class _HomePackagePageState extends State<HomePackagePage> {
  List<Store> stores = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: ListView(
        children: [
          SizedBox(
            height: 15.0,
          ),
          GridView.count(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 8.0 / 9.0,
            children: ProductCard().buildGridProduct(
              stores: stores
                ),
          ),
          SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );
  }
}
