import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  savetoken(String token, {isAdmin = false}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    prefs.setBool('isAdmin', isAdmin);
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    return token;
  }

  getIsAdmin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var isAdmin = prefs.getBool('isAdmin');
    return isAdmin ?? false;
  }

  removeToken() {
    SharedPreferences.getInstance().then((prefs) {
      prefs.remove('token');
      prefs.remove('isAdmin');
    });
  }
}
