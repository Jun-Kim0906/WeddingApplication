import 'package:flutter/material.dart';
import 'package:my_wedding_test/models/store/store_model.dart';
import 'package:my_wedding_test/repository/store_repository.dart';
import 'package:my_wedding_test/screens/home_screens/create_review.dart';

class StoreDetailPage extends StatefulWidget {
  const StoreDetailPage({Key key, this.store, this.isLike, this.category})
      : super(key: key);
  final Store store;
  final bool isLike;
  final int category;

  @override
  _StoreDetailPageState createState() => _StoreDetailPageState();
}

class _StoreDetailPageState extends State<StoreDetailPage> {
  Store store;
  bool isLike;
  int likes;

  ///studio 1, dress 2, makeup 3
  int category;

  @override
  void initState() {
    super.initState();
    store = widget.store;
    likes = widget.store.likes;
    isLike = widget.isLike;
    category = widget.category;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.55,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: store.imgUrl == ''
                          ? AssetImage('assets/wedding/wedding1.webp')
                          : NetworkImage(store.imgUrl),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          store.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () async {
                              if (isLike) {
                                switch (category) {
                                  case 1:
                                    await StoreRepository()
                                        .sStoreUnlikePressed(storeID: store.id);
                                    break;
                                  case 2:
                                    await StoreRepository()
                                        .dStoreUnlikePressed(storeID: store.id);
                                    break;
                                  case 3:
                                    await StoreRepository()
                                        .mStoreUnlikePressed(storeID: store.id);
                                    break;
                                }
                                setState(() {
                                  isLike = false;
                                  likes -= 1;
                                });
                              } else {
                                switch (category) {
                                  case 1:
                                    await StoreRepository()
                                        .sStoreLikePressed(storeID: store.id);
                                    break;
                                  case 2:
                                    await StoreRepository()
                                        .dStoreLikePressed(storeID: store.id);
                                    break;
                                  case 3:
                                    await StoreRepository()
                                        .mStoreLikePressed(storeID: store.id);
                                    break;
                                }
                                setState(() {
                                  isLike = true;
                                  likes += 1;
                                });
                              }
                            },
                            icon: Icon(
                              isLike ? Icons.favorite : Icons.favorite_border,
                              color: isLike ? Colors.red : Colors.black45,
                              size: 30,
                            ),
                          ),
                          Text(
                            likes.toString(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "DESCRIPTION",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 5),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    store.category != '' ? store.category : '아직 등록된 정보가 없습니다.',
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    store.address != '' ? store.address : '아직 등록된 주소가 없습니다.',
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    store.hp != '' ? store.hp : '아직 등록된 전화번호가 없습니다.',
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 13.0)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreateReview(store: store, category: category,)));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.speaker_notes_rounded,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                '리뷰작성',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Expanded(
                        flex: 1,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.black,
                              padding: EdgeInsets.symmetric(vertical: 13.0)),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.playlist_add_rounded,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                '예약하기',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                  // ListView.builder(
                  //   itemCount: productList.length,
                  //   itemBuilder: (BuildContext context,int index)=>ProductCard(context, index),
                  //   shrinkWrap: true,
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
