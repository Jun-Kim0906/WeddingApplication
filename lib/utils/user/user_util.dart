import 'package:my_wedding_test/models/user/user_model.dart';
import 'package:mysql1/mysql1.dart';

class UserUtil {
  static User _user;
  static void setUser(ResultRow resultRow) async {
    User user = User(
      id: resultRow.fields['id'],
      pwd: resultRow.fields['pwd'],
      name: resultRow.fields['name'],
      hp: resultRow.fields['hp'],
      email: resultRow.fields['email'],
    );
    _user = user;
  }

  static void setUserWithUser(User user){
    _user = user;
  }

  static User getUser() {
    return _user;
  }
}
