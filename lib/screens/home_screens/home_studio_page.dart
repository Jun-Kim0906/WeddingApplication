import 'package:flutter/material.dart';
import 'package:my_wedding_test/models/store/store_model.dart';
import 'package:my_wedding_test/repository/store_repository.dart';
import 'package:my_wedding_test/screens/home_screens/store_detail_page.dart';
import 'package:my_wedding_test/wedding_theme_data.dart';
import 'package:my_wedding_test/widgets/product_card.dart';

class HomeStudioPage extends StatefulWidget {
  const HomeStudioPage({Key key}) : super(key: key);

  @override
  _HomeStudioPageState createState() => _HomeStudioPageState();
}

class _HomeStudioPageState extends State<HomeStudioPage> {
  List<Store> stores = [];

  ///order 1 : 이름순
  ///order 2 : 좋아요 순
  int order = 1;
  String orderOption = '이름순';

  @override
  void initState() {
    super.initState();
    storeInitState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {
                    _settingModalBottomSheet(context: context);
                  },
                  child: Row(
                    children: [
                      Text(orderOption),
                      SizedBox(
                        width: 2.0,
                      ),
                      Icon(Icons.keyboard_arrow_down_outlined),
                    ],
                  ))
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
                onPressed: (store) async {
                  bool isLike = await StoreRepository().isSStoreLiked(storeID: store.id);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StoreDetailPage(store: store, isLike: isLike, category: 1,))).then((value){
                    storeInitState();
                  });
                }
                ),
          ),
          SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );
  }

  void _settingModalBottomSheet({BuildContext context}) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        backgroundColor: Colors.white,
        context: context,
        builder: (BuildContext context) {
          return new Wrap(
            children: <Widget>[
              ListTile(
                  leading: Text(
                    '이름순',
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                          fontSize: 14,
                          fontWeight: (order == 1)
                              ? FontWeight.w600
                              : FontWeight.normal,
                          color: (order == 1)
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                        ),
                  ),
                  title: Text(''),
                  trailing: (order == 1)
                      ? Icon(
                          Icons.check,
                          color: (order == 1)
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                        )
                      : Container(
                          height: 1,
                          width: 1,
                        ),
                  onTap: () => {
                        Navigator.pop(context),
                        setState(() {
                          order = 1;
                          orderOption = '이름순';
                          stores.sort((a, b) => a.name.compareTo(b.name));
                        }),
                      }),
              Divider(
                height: 2,
                thickness: 2,
                color: Color(0xFFE0E0E0),
                indent: defaultPadding,
                endIndent: defaultPadding,
              ),
              ListTile(
                leading: Text(
                  '인기순',
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                        fontSize: 14,
                        fontWeight:
                            (order == 2) ? FontWeight.w600 : FontWeight.normal,
                        color: (order == 2)
                            ? Theme.of(context).primaryColor
                            : Colors.black,
                      ),
                ),
                title: Text(''),
                trailing: (order == 2)
                    ? Icon(
                        Icons.check,
                        color: (order == 2) ? Color(0xFF219653) : Colors.black,
                      )
                    : Container(
                        height: 1,
                        width: 1,
                      ),
                onTap: () => {
                  Navigator.pop(context),
                  setState(() {
                    order = 2;
                    orderOption = '인기순';
                    stores.sort((a, b) => b.likes.compareTo(a.likes));
                  }),
                },
              ),
              Divider(
                height: 2,
                thickness: 2,
                color: Color(0xFFE0E0E0),
                indent: defaultPadding,
                endIndent: defaultPadding,
              ),
              SizedBox(
                height: 40,
              ),
              Divider(
                height: 2,
                thickness: 2,
                color: Color(0xFFE0E0E0),
                indent: defaultPadding,
                endIndent: defaultPadding,
              ),
            ],
          );
        });
  }

  void storeInitState() async {
    var initStores = await StoreRepository().getStudios();
    if(order == 2){
      initStores.sort((a, b) => b.likes.compareTo(a.likes));
    }
    setState(() {
      stores = initStores;
    });
  }
}

/*
DELIMITER $$
CREATE TRIGGER M_Store_like AFTER INSERT ON M_Store
FOR EACH ROW
BEGIN
UPDATE M_STORE SET likes= likes +1 WHERE S_ID = NEW.S_ID;
END$$
DELIMITER ;
 */
