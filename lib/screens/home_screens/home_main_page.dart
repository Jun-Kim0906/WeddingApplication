import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_wedding_test/models/store/store_model.dart';
import 'package:my_wedding_test/repository/store_repository.dart';
import 'package:my_wedding_test/widgets/product_card.dart';

class HomeMainPage extends StatefulWidget {
  const HomeMainPage({Key key}) : super(key: key);

  @override
  _HomeMainPageState createState() => _HomeMainPageState();
}

class _HomeMainPageState extends State<HomeMainPage> {
  List<Store> stores = [];

  List<String> imgList = [
    'assets/bufferCarouselImage.png',
    'assets/bufferCarouselImage2.jpg',
    'assets/bufferCarouselImage3.jpg',
  ];
  CarouselController _carouselController = CarouselController();
  int index = 0;

  @override
  void initState() {
    super.initState();
    storeInitState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
      child: ListView(
        children: [
          SizedBox(
            height: 10.0,
          ),
          MainCarousel(
              carouselController: _carouselController, imgList: imgList),
          SizedBox(
            height: 10.0,
          ),
          Text(
            '이번주 Best 매장은?',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () async {
                  var studios = await StoreRepository().getBestStudio();
                  setState(() {
                    if (index != 0) {
                      index = 0;
                      stores = studios;
                    }
                  });
                },
                child: Text(
                  '#스튜디오',
                  style: TextStyle(
                    color: index == 0 ? null : Colors.grey,
                  ),
                ),
              ),
              TextButton(
                  onPressed: () async {
                    var dresses = await StoreRepository().getBestDress();
                    setState(() {
                      if (index != 1) {
                        index = 1;
                        stores = dresses;
                      }
                    });
                  },
                  child: Text(
                    '#드레스',
                    style: TextStyle(
                      color: index == 1 ? null : Colors.grey,
                    ),
                  )),
              TextButton(
                  onPressed: () async {
                    var makeups = await StoreRepository().getBestMakeup();
                    setState(()  {
                      if (index != 2) {
                        index = 2;
                        stores = makeups;
                      }
                    });
                  },
                  child: Text(
                    '#메이크업',
                    style: TextStyle(
                      color: index == 2 ? null : Colors.grey,
                    ),
                  )),
            ],
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
              stores: stores,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );
  }

  void storeInitState() async {
    var initStores = await StoreRepository().getBestStudio();
    setState(() {
      stores = initStores;
    });
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
