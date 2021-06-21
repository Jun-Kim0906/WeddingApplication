
import 'package:my_wedding_test/utils/user/user_util.dart';
import 'package:mysql1/mysql1.dart';

class ReviewRepository{
  var settings = new ConnectionSettings(
      host: 'dbproject.cft5govn0dbt.ap-northeast-2.rds.amazonaws.com',
      port: 3306,
      user: 'admin',
      password: '12341234',
      db: 'weddingApp');

  Future<void> saveSReview({String sID, String content, double rating}) async {
    var conn = await MySqlConnection.connect(settings);
    await conn.query('insert into S_review(S_ID, U_ID, content, rating) values (?,?,?,?)',[sID,UserUtil.getUser().id,content,rating]);
    conn.close();
  }

  Future<void> saveDReview({String sID, String content, double rating}) async {
    var conn = await MySqlConnection.connect(settings);
    await conn.query('insert into D_review(S_ID, U_ID, content, rating) values (?,?,?,?)',[sID,UserUtil.getUser().id,content,rating]);
    conn.close();
  }

  Future<void> saveMReview({String sID, String content, double rating}) async {
    var conn = await MySqlConnection.connect(settings);
    await conn.query('insert into <_review(S_ID, U_ID, content, rating) values (?,?,?,?)',[sID,UserUtil.getUser().id,content,rating]);
    conn.close();
  }
}