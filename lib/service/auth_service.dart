import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  savetoken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    return token;
  }

  removeToken() {
    SharedPreferences.getInstance().then((prefs) {
      prefs.remove('token');
    });
  }
}
