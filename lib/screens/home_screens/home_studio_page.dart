import 'package:flutter/material.dart';
import 'package:my_wedding_test/widgets/product_card.dart';

class HomeStudioPage extends StatefulWidget {
  const HomeStudioPage({Key key}) : super(key: key);

  @override
  _HomeStudioPageState createState() => _HomeStudioPageState();
}

class _HomeStudioPageState extends State<HomeStudioPage> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: ListView(
        children: [
          SizedBox(height: 15.0,),
          GridView.count(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 8.0 / 9.0,
            children: ProductCard().buildGridProduct(8, isSelected, (){
              setState(() {
                isSelected=!isSelected;
              });
            }),
          ),
          SizedBox(height: 15.0,),
        ],
      ),
    );
  }
}