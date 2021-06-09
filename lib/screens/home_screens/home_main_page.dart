import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_wedding_test/widgets/product_card.dart';

class HomeMainPage extends StatefulWidget {
  const HomeMainPage({Key key}) : super(key: key);

  @override
  _HomeMainPageState createState() => _HomeMainPageState();
}

class _HomeMainPageState extends State<HomeMainPage> {
  bool isSelected = false;
  List<String> imgList = [
    'assets/bufferCarouselImage.png',
    'assets/bufferCarouselImage.png'
  ];
  CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
      child: ListView(
        children: [
          MainCarousel(
              carouselController: _carouselController, imgList: imgList),
          SizedBox(
            height: 10.0,
          ),
          GridView.count(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 8.0 / 9.0,
            children: ProductCard().buildGridProduct(6, isSelected, (){
              setState(() {
                isSelected=!isSelected;
              });
            }),
          )
        ],
      ),
    );
  }




}

class MainCarousel extends StatelessWidget {
  const MainCarousel({
    Key key,
    @required CarouselController carouselController,
    @required this.imgList,
  })  : _carouselController = carouselController,
        super(key: key);

  final CarouselController _carouselController;
  final List<String> imgList;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
            height: 230.0,
            viewportFraction: 1.0,
          ),
          items: imgList.map((imgPath) {
            return Container(
              padding: EdgeInsets.only(bottom: 10.0),
              width: double.maxFinite,
              height: 230.0,
              child: Image.asset(
                imgPath,
                fit: BoxFit.fill,
              ),
            );
          }).toList(),
        ),
        Positioned(
            right: 22.0,
            bottom: 0.0,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    _carouselController.previousPage();
                  },
                  child: Container(
                    height: 51,
                    width: 51,
                    color: Colors.black,
                    child: Icon(
                      Icons.arrow_back,
                      size: 35.0,
                    ),
                  ),
                ),
                SizedBox(
                  width: 1.5,
                ),
                GestureDetector(
                  onTap: () {
                    _carouselController.nextPage();
                  },
                  child: Container(
                    height: 51,
                    width: 51,
                    color: Colors.black,
                    child: Icon(
                      Icons.arrow_forward,
                      size: 35.0,
                    ),
                  ),
                )
              ],
            )),
      ],
    );
  }
}
