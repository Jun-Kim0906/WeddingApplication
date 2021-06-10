import 'dart:async';

import 'package:mysql1/mysql1.dart';

class UserRepository {
  var settings = new ConnectionSettings(
      host: 'dbproject.cft5govn0dbt.ap-northeast-2.rds.amazonaws.com',
      port: 3306,
      user: 'admin',
      password: '12341234',
      db: 'weddingApp');

  Future<ResultRow> signIn(String id, String password) async {
    var conn = await MySqlConnection.connect(settings);
    Results results = await conn
        .query('select * from user where id = ? and pwd = ? ', [id, password]);
    if (results.isEmpty) {
      throw ('Incorrect ID or Password');
    }
    return results.first;
  }

  Future<bool> checkUser(String id) async {
    var conn = await MySqlConnection.connect(settings);
    Results results = await conn.query('select * from user where id = ?', [id]);
    return results.isEmpty;
  }

  Future<void> signUp({String id, String password, String name, String hp, String email}) async {
    var conn = await MySqlConnection.connect(settings);
    await conn.query('insert into user(id, pwd, name, hp, email) values (?,?,?,?,?)',[id,password,name,hp, email]);
  }

  Future<void> signInWithCredentials(String id, String password) {
    // return _firebaseAuth.signInWithEmailAndPassword(
    //   email: id,
    //   password: password,
    // );
  }

  Future<void> signOut() async {
    return Future.wait([
      // _firebaseAuth.signOut(),
    ]);
  }

// Future<User> getUser() async {
//   return (_firebaseAuth.currentUser);
// }
//
// Future<void> resetPassword({String changed, String prev}) async {
//   final currentUser = await _firebaseAuth.currentUser;
//   UserCredential authResult = await currentUser.reauthenticateWithCredential(
//     EmailAuthProvider.credential(
//       email: await UserUtil.getUser().id,
//       password: prev,
//     ),
//   );
//   await authResult.user.updatePassword(changed).then((_) {
//     print('Successfully changed password');
//   }).catchError((error) {
//     print("Password can't be changed: " + error.toString());
//   });
// }
}
