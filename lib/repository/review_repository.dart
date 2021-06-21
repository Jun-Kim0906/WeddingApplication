import 'package:my_wedding_test/models/review/review_model.dart';
import 'package:my_wedding_test/utils/user/user_util.dart';
import 'package:mysql1/mysql1.dart';

class ReviewRepository {
  var settings = new ConnectionSettings(
      host: 'dbproject.cft5govn0dbt.ap-northeast-2.rds.amazonaws.com',
      port: 3306,
      user: 'admin',
      password: '12341234',
      db: 'weddingApp');

  Future<void> saveSReview({String sID, String content, double rating}) async {
    var conn = await MySqlConnection.connect(settings);
    await conn.query(
        'insert into S_review(S_ID, U_ID, content, rating) values (?,?,?,?)',
        [sID, UserUtil
            .getUser()
            .id, content, rating]);
    conn.close();
  }

  Future<void> saveDReview({String sID, String content, double rating}) async {
    var conn = await MySqlConnection.connect(settings);
    await conn.query(
        'insert into D_review(S_ID, U_ID, content, rating) values (?,?,?,?)',
        [sID, UserUtil
            .getUser()
            .id, content, rating]);
    conn.close();
  }

  Future<void> saveMReview({String sID, String content, double rating}) async {
    var conn = await MySqlConnection.connect(settings);
    await conn.query(
        'insert into M_review(S_ID, U_ID, content, rating) values (?,?,?,?)',
        [sID, UserUtil
            .getUser()
            .id, content, rating]);
    conn.close();
  }

  Future<List<Review>> getSReviews({String sID}) async{
    List<Review> reviews = [];
    var conn = await MySqlConnection.connect(settings);
    Results results =
    await conn.query('select * from S_review where S_ID = ? ORDER BY time',[sID]);
    conn.close();
    var resultRows = results.toList();
    resultRows.forEach((resultRow) {
      reviews.add(Review(
        sID: resultRow.fields['S_ID'],
        uID: resultRow.fields['U_ID'],
        time: resultRow.fields['time'],
        content: resultRow.fields['content'],
        rating: resultRow.fields['rating'],
      ));
    });
    return reviews;
  }

  Future<List<Review>> getDReviews({String sID}) async{
    List<Review> reviews = [];
    var conn = await MySqlConnection.connect(settings);
    Results results =
    await conn.query('select * from D_review where S_ID = ? ORDER BY time',[sID]);
    conn.close();
    var resultRows = results.toList();
    resultRows.forEach((resultRow) {
      reviews.add(Review(
        sID: resultRow.fields['S_ID'],
        uID: resultRow.fields['U_ID'],
        time: resultRow.fields['time'],
        content: resultRow.fields['content'],
        rating: resultRow.fields['rating'],
      ));
    });
    return reviews;
  }

  Future<List<Review>> getMReviews({String sID}) async{
    List<Review> reviews = [];
    var conn = await MySqlConnection.connect(settings);
    Results results =
    await conn.query('select * from M_review where S_ID = ? ORDER BY time',[sID]);
    conn.close();
    var resultRows = results.toList();
    resultRows.forEach((resultRow) {
      reviews.add(Review(
        sID: resultRow.fields['S_ID'],
        uID: resultRow.fields['U_ID'],
        time: resultRow.fields['time'],
        content: resultRow.fields['content'],
        rating: resultRow.fields['rating'],
      ));
    });
    return reviews;
  }
}