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
    List<Store> stores = [];
    var conn = await MySqlConnection.connect(settings);
    Results results =
        await conn.query('select * from S_Store ORDER BY likes desc LIMIT 4');
    conn.close();
    var resultRows = results.toList();
    resultRows.forEach((resultRow) {
      stores.add(Store(
        id: resultRow.fields['S_ID'],
        name: resultRow.fields['S_Name'],
        imgUrl: resultRow.fields['Image'],
        category: resultRow.fields['Category'],
        hp: resultRow.fields['HP'],
        address: resultRow.fields['Address'],
        likes: resultRow.fields['likes'],
      ));
    });
    return stores;
  }

  Future<List<Store>> getBestDress() async {
    List<Store> stores = [];
    var conn = await MySqlConnection.connect(settings);
    Results results =
        await conn.query('select * from D_Store ORDER BY likes desc LIMIT 4');
    conn.close();
    var resultRows = results.toList();
    resultRows.forEach((resultRow) {
      stores.add(Store(
        id: resultRow.fields['S_ID'],
        name: resultRow.fields['S_Name'],
        imgUrl: resultRow.fields['Image'],
        category: resultRow.fields['Category'],
        hp: resultRow.fields['HP'],
        address: resultRow.fields['Address'],
        likes: resultRow.fields['likes'],
      ));
    });
    return stores;
  }

  Future<List<Store>> getBestMakeup() async {
    List<Store> stores = [];
    var conn = await MySqlConnection.connect(settings);
    Results results =
        await conn.query('select * from M_Store ORDER BY likes desc LIMIT 4');
    conn.close();
    var resultRows = results.toList();
    resultRows.forEach((resultRow) {
      stores.add(Store(
        id: resultRow.fields['S_ID'],
        name: resultRow.fields['S_Name'],
        imgUrl: resultRow.fields['Image'],
        category: resultRow.fields['Category'],
        hp: resultRow.fields['HP'],
        address: resultRow.fields['Address'],
        likes: resultRow.fields['likes'],
      ));
    });
    return stores;
  }

  Future<List<Store>> getStudios() async {
    List<Store> stores = [];
    var conn = await MySqlConnection.connect(settings);
    Results results =
        await conn.query('select * from S_Store ORDER BY S_Name asc');
    conn.close();
    var resultRows = results.toList();
    resultRows.forEach((resultRow) {
      stores.add(Store(
        id: resultRow.fields['S_ID'],
        name: resultRow.fields['S_Name'],
        imgUrl: resultRow.fields['Image'],
        category: resultRow.fields['Category'],
        hp: resultRow.fields['HP'],
        address: resultRow.fields['Address'],
        likes: resultRow.fields['likes'],
      ));
    });
    return stores;
  }

  Future<List<Store>> getDresses() async {
    List<Store> stores = [];
    var conn = await MySqlConnection.connect(settings);
    Results results =
        await conn.query('select * from D_Store ORDER BY S_Name asc');
    conn.close();
    var resultRows = results.toList();
    resultRows.forEach((resultRow) {
      stores.add(Store(
        id: resultRow.fields['S_ID'],
        name: resultRow.fields['S_Name'],
        imgUrl: resultRow.fields['Image'],
        category: resultRow.fields['Category'],
        hp: resultRow.fields['HP'],
        address: resultRow.fields['Address'],
        likes: resultRow.fields['likes'],
      ));
    });
    return stores;
  }

  Future<List<Store>> getMakeups() async {
    List<Store> stores = [];
    var conn = await MySqlConnection.connect(settings);
    Results results =
        await conn.query('select * from M_Store ORDER BY S_Name asc');
    conn.close();
    var resultRows = results.toList();
    resultRows.forEach((resultRow) {
      stores.add(Store(
        id: resultRow.fields['S_ID'],
        name: resultRow.fields['S_Name'],
        imgUrl: resultRow.fields['Image'],
        category: resultRow.fields['Category'],
        hp: resultRow.fields['HP'],
        address: resultRow.fields['Address'],
        likes: resultRow.fields['likes'],
      ));
    });
    return stores;
  }

  Future<bool> isSStoreLiked({String storeID}) async {
    var conn = await MySqlConnection.connect(settings);
    Results results = await conn.query(
        'select * from S_Store_like WHERE S_ID = ? and U_ID =?',
        [storeID, UserUtil.getUser().id]);
    conn.close();

    return results.isNotEmpty;
  }

  Future<bool> isDStoreLiked({String storeID}) async {
    var conn = await MySqlConnection.connect(settings);
    Results results = await conn.query(
        'select * from D_Store_like WHERE S_ID = ? AND U_ID =?',
        [storeID, UserUtil.getUser().id]);
    conn.close();

    return results.isNotEmpty;
  }

  Future<bool> isMStoreLiked({String storeID}) async {
    var conn = await MySqlConnection.connect(settings);
    Results results = await conn.query(
        'select * from M_Store_like WHERE S_ID = ? AND U_ID =?',
        [storeID, UserUtil.getUser().id]);
    conn.close();

    return results.isNotEmpty;
  }

  Future<void> sStoreLikePressed({String storeID}) async {
    var conn = await MySqlConnection.connect(settings);
    await conn.query('INSERT INTO S_Store_like (S_ID, U_ID) VALUES (?,?)',
        [storeID, UserUtil.getUser().id]);
    conn.close();
  }

  Future<void> dStoreLikePressed({String storeID}) async {
    var conn = await MySqlConnection.connect(settings);
    await conn.query('INSERT INTO D_Store_like (S_ID, U_ID) VALUES (?,?)',
        [storeID, UserUtil.getUser().id]);
    conn.close();
  }

  Future<void> mStoreLikePressed({String storeID}) async {
    var conn = await MySqlConnection.connect(settings);
    await conn.query('INSERT INTO M_Store_like (S_ID, U_ID) VALUES (?,?)',
        [storeID, UserUtil.getUser().id]);
    conn.close();
  }

  Future<void> sStoreUnlikePressed({String storeID}) async {
    var conn = await MySqlConnection.connect(settings);
    await conn.query('DELETE FROM S_Store_like WHERE S_ID = ? AND U_ID =?',
        [storeID, UserUtil.getUser().id]);
    conn.close();
  }

  Future<void> dStoreUnlikePressed({String storeID}) async {
    var conn = await MySqlConnection.connect(settings);
    await conn.query('DELETE FROM D_Store_like WHERE S_ID = ? AND U_ID =?',
        [storeID, UserUtil.getUser().id]);
    conn.close();
  }

  Future<void> mStoreUnlikePressed({String storeID}) async {
    var conn = await MySqlConnection.connect(settings);
    await conn.query('DELETE FROM M_Store_like WHERE S_ID = ? AND U_ID =?',
        [storeID, UserUtil.getUser().id]);
    conn.close();
  }
}
