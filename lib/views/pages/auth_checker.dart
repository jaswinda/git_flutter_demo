import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_flutter_demo/service/auth_service.dart';
import 'package:git_flutter_demo/views/pages/tabs/home.dart';
import 'package:git_flutter_demo/views/pages/my_home_page.dart';
import 'package:git_flutter_demo/views/pages/signin.dart';

class AuthChecker extends StatefulWidget {
  const AuthChecker({Key? key}) : super(key: key);

  @override
  State<AuthChecker> createState() => _AuthCheckerState();
}

class _AuthCheckerState extends State<AuthChecker> {
  @override
  void initState() {
    super.initState();
    checkIfLoggedIn();
  }

  checkIfLoggedIn() async {
    AuthService authService = AuthService();
    var token = await authService.getToken();
    print(token);
    if (token != null) {
      Get.to(() => const MyHomePage());
    } else {
      Get.to(() => SignIn());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}