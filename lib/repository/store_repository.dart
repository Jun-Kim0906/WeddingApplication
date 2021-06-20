import 'package:my_wedding_test/models/store/store_model.dart';
import 'package:my_wedding_test/utils/user/user_util.dart';
import 'package:mysql1/mysql1.dart';

class StoreRepository {
  var settings = new ConnectionSettings(
      host: 'dbproject.cft5govn0dbt.ap-northeast-2.rds.amazonaws.com',
      port: 3306,
      user: 'admin',
      password: '12341234',
      db: 'weddingApp');

  Future<List<Store>> getBestStudio() async {
    List<Store> stores =[];
    var conn = await MySqlConnection.connect(settings);
    Results results = await conn
        .query('select * from S_Store ORDER BY likes desc LIMIT 4');
    conn.close();
    var resultRows = results.toList();
    resultRows.forEach((resultRow) {
      stores.add(
        Store(
          id: resultRow.fields['S_ID'],
          name: resultRow.fields['S_Name'],
          imgUrl: resultRow.fields['Image'],
          category: resultRow.fields['Category'],
          hp: resultRow.fields['HP'],
          address: resultRow.fields['Address'],
          likes: resultRow.fields['likes'],
        )
      );
    });
    return stores;
  }

  Future<List<Store>> getBestDress() async {
    List<Store> stores =[];
    var conn = await MySqlConnection.connect(settings);
    Results results = await conn
        .query('select * from D_Store ORDER BY likes desc LIMIT 4');
    conn.close();
    var resultRows = results.toList();
    resultRows.forEach((resultRow) {
      stores.add(
          Store(
            id: resultRow.fields['S_ID'],
            name: resultRow.fields['S_Name'],
            imgUrl: resultRow.fields['Image'],
            category: resultRow.fields['Category'],
            hp: resultRow.fields['HP'],
            address: resultRow.fields['Address'],
            likes: resultRow.fields['likes'],
          )
      );
    });
    return stores;
  }
  Future<List<Store>> getBestMakeup() async {
    List<Store> stores =[];
    var conn = await MySqlConnection.connect(settings);
    Results results = await conn
        .query('select * from M_Store ORDER BY likes desc LIMIT 4');
    conn.close();
    var resultRows = results.toList();
    resultRows.forEach((resultRow) {
      stores.add(
          Store(
            id: resultRow.fields['S_ID'],
            name: resultRow.fields['S_Name'],
            imgUrl: resultRow.fields['Image'],
            category: resultRow.fields['Category'],
            hp: resultRow.fields['HP'],
            address: resultRow.fields['Address'],
            likes: resultRow.fields['likes'],
          )
      );
    });
    return stores;
  }

  Future<List<Store>> getStudios() async {
    List<Store> stores =[];
    var conn = await MySqlConnection.connect(settings);
    Results results = await conn
        .query('select * from S_Store ORDER BY S_Name asc');
    conn.close();
    var resultRows = results.toList();
    resultRows.forEach((resultRow) {
      stores.add(
          Store(
            id: resultRow.fields['S_ID'],
            name: resultRow.fields['S_Name'],
            imgUrl: resultRow.fields['Image'],
            category: resultRow.fields['Category'],
            hp: resultRow.fields['HP'],
            address: resultRow.fields['Address'],
            likes: resultRow.fields['likes'],
          )
      );
    });
    return stores;
  }

  Future<List<Store>> getDresses() async {
    List<Store> stores =[];
    var conn = await MySqlConnection.connect(settings);
    Results results = await conn
        .query('select * from D_Store ORDER BY S_Name asc');
    conn.close();
    var resultRows = results.toList();
    resultRows.forEach((resultRow) {
      stores.add(
          Store(
            id: resultRow.fields['S_ID'],
            name: resultRow.fields['S_Name'],
            imgUrl: resultRow.fields['Image'],
            category: resultRow.fields['Category'],
            hp: resultRow.fields['HP'],
            address: resultRow.fields['Address'],
            likes: resultRow.fields['likes'],
          )
      );
    });
    return stores;
  }

  Future<List<Store>> getMakeups() async {
    List<Store> stores =[];
    var conn = await MySqlConnection.connect(settings);
    Results results = await conn
        .query('select * from M_Store ORDER BY S_Name asc');
    conn.close();
    var resultRows = results.toList();
    resultRows.forEach((resultRow) {
      stores.add(
          Store(
            id: resultRow.fields['S_ID'],
            name: resultRow.fields['S_Name'],
            imgUrl: resultRow.fields['Image'],
            category: resultRow.fields['Category'],
            hp: resultRow.fields['HP'],
            address: resultRow.fields['Address'],
            likes: resultRow.fields['likes'],
          )
      );
    });
    return stores;
  }


  Future<bool> isSStoreLiked(String id) async {
    var conn = await MySqlConnection.connect(settings);
    Results results = await conn
        .query('select * from S_Store_like WHERE S_ID = ?, U_ID =?',[id, UserUtil.getUser().id]);
    conn.close();

    return results.isNotEmpty;
  }
}
