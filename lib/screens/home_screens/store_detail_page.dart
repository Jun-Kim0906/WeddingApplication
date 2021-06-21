import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:my_wedding_test/models/review/review_model.dart';
import 'package:my_wedding_test/models/store/store_model.dart';
import 'package:my_wedding_test/models/user/user_model.dart';
import 'package:my_wedding_test/repository/review_repository.dart';
import 'package:my_wedding_test/repository/store_repository.dart';
import 'package:my_wedding_test/repository/user_repository.dart';
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

  List<Review> reviews = [];
  List<User> writeUsers = [];

  @override
  void initState() {
    super.initState();
    store = widget.store;
    likes = widget.store.likes;
    isLike = widget.isLike;
    category = widget.category;
    initReviews();
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
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.55,
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
                                    builder: (context) =>
                                        CreateReview(
                                          store: store, category: category,))).then((value){initReviews();});
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
                  ),
                  SizedBox(height: 20.0),
                  Divider(thickness: 3.0,),
                  SizedBox(height: 20.0,),
                  Text('Review (${reviews.length})', style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w500
                  ),),
                  SizedBox(height: 20.0,),
                  Column(
                    children: reviewTile(),
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


  List<Widget> reviewTile() {
    int count = -1;
    return reviews.map((review) {
      count ++;
      return writeUsers.isNotEmpty?Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            backgroundImage: writeUsers[count]
                .image == null? NetworkImage(
                "https://cloudfront-ap-northeast-1.images.arcpublishing.com/chosun/2TKUKXYMQF7ASZEUJLG7L4GM4I.jpg")
                : MemoryImage(writeUsers[count].image.toBytes()),
          ),
          SizedBox(width: 15.0,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(writeUsers[count].name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),),
                      SizedBox(height: 5.0,),
                      RatingBarIndicator(
                        rating: review.rating,
                        unratedColor: Color(0xffFFEEBC),
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 20.0,
                        direction: Axis.horizontal,
                      ),
                    ],
                  ),
                  SizedBox(width: 70.0,),
                  Text(DateFormat('yyyy-MM-dd hh:mm').format(review.time), style: TextStyle(fontSize: 12.0, color: Colors.grey),),
                ],
              ),
              SizedBox(height: 20.0,),
              Text(review.content, maxLines: 10,),
              SizedBox(height: 25.0,),
            ],
          )
        ],
      ):Container();
    }).toList();
  }



  void initReviews() async {
    List<Review> review = [];
    List<User> users = [];
    switch (category) {
      case 1:
        review = await ReviewRepository().getSReviews(sID: store.id);
        break;
      case 2:
        review = await ReviewRepository().getDReviews(sID: store.id);
        break;
      case 3:
        review = await ReviewRepository().getMReviews(sID: store.id);
        break;
    }
    await Future.forEach(review, (element) async {
      users.add(await UserRepository().getUser(id: element.uID));
    });
    // review.forEach((element) async {
    //   users.add(await UserRepository().getUser(id: element.uID));
    // });
    setState(() {
      reviews = review;
      writeUsers = users;
    });
  }
}
