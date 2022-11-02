import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_flutter_demo/controllers/authentication_controller.dart';
import 'package:git_flutter_demo/views/conponents/custom_text_field.dart';

class SignIn extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final AuthenticationController authenticationController =
      Get.find<AuthenticationController>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Image.asset("assets/images/logoa.png",
                      height: 200, width: 200),
                  Image.network(
                      "https://cdn.kimkim.com/files/a/content_articles/featured_photos/0a99949f58bc92145369e8363c64c33bfd85f819/big-68acc559aad8def0f326f4d62e8faf78.jpg",
                      height: 200,
                      width: 200),
                  const Center(
                      child: Text(
                    'Sign In',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  )),
                  CustomTextField(
                    controller: emailController,
                    validator: (value) {
                      if (!value!.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  CustomTextField(
                    controller: passwordController,
                    label: 'Password',
                    isPassword: true,
                    validator: (value) {
                      if (value!.length < 6) {
                        return 'Please enter a valid password';
                      }
                      return null;
                    },
                  ),
                  Obx(() => Container(
                        child: authenticationController.isLoading.value
                            ? const CircularProgressIndicator()
                            : ElevatedButton(
                                onPressed: () {
                                  var isValid =
                                      formKey.currentState!.validate();
                                  if (isValid) {
                                    var data = {
                                      'email': emailController.text,
                                      'password': passwordController.text
                                    };
                                    authenticationController.signIn(data);
                                  }
                                },
                                child: const Text("SignIn")),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
