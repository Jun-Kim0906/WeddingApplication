import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_wedding_test/models/store/store_model.dart';
import 'package:my_wedding_test/models/user/user_model.dart';
import 'package:my_wedding_test/repository/review_repository.dart';
import 'package:my_wedding_test/utils/user/user_util.dart';

class CreateReview extends StatefulWidget {
  const CreateReview({Key key, this.store, this.category}) : super(key: key);
  final Store store;
  final int category;

  @override
  _CreateReviewState createState() => _CreateReviewState();
}

class _CreateReviewState extends State<CreateReview> {
  User user = UserUtil.getUser();
  TextEditingController _controller = TextEditingController();
  double rating = 3.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Review',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
        actions: [
          TextButton(onPressed: () async {
            switch(widget.category){
              case 1:
                await ReviewRepository().saveSReview(sID: widget.store.id, content: _controller.text, rating: rating);
                break;
              case 2:
                await ReviewRepository().saveDReview(sID: widget.store.id, content: _controller.text, rating: rating);
                break;
              case 3:
                await ReviewRepository().saveMReview(sID: widget.store.id, content: _controller.text, rating: rating);
                break;
            }
            Navigator.pop(context);
          }, child: Text('완료')),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 65,
              backgroundColor: Colors.white,
              backgroundImage: user.image == null
                  ? NetworkImage(
                      "https://cloudfront-ap-northeast-1.images.arcpublishing.com/chosun/2TKUKXYMQF7ASZEUJLG7L4GM4I.jpg")
                  : MemoryImage(user.image.toBytes()),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              user.name,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
            ),
            SizedBox(
              height: 35.0,
            ),
            RatingBar.builder(
              initialRating: 3,
              unratedColor: Color(0xffFFEEBC),
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (updateRating) {
                rating = updateRating;
              },
            ),
            SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: TextFormField(
                autocorrect: false,
                controller: _controller,
                minLines: 8,
                maxLines: 8,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      )),
                  hintText: '내용을 입력해주세요',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 18.0, color: Color(0x2C000000)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
