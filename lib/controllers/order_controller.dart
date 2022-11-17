import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:git_flutter_demo/controllers/cart_controller.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:git_flutter_demo/service/auth_service.dart';
import 'package:git_flutter_demo/utils/api.dart';

class OrderController extends GetxController {
  var isLoading = false.obs;
  final CartController cartController = Get.find();
  AuthService authService = AuthService();

  order(paymentToken, amount) async {
    isLoading.value = true;
    var token = await authService.getToken();

    var data = {
      "order_items": jsonEncode(cartController.cart.values
          .map((e) => jsonEncode({
                "product_id": e.id,
                "quantity": e.quantity,
              }))
          .toList()),
      "payment_token": paymentToken,
      "amount": amount.toString(),
      "token": token
    };
    var response = await http.post(Uri.parse(ORDER_API), body: data);
    isLoading.value = false;
    var result = jsonDecode(response.body);
    var success = result['success'];
    var message = result['message'];
    if (success) {
      cartController.clear();
      Get.back();
      Get.snackbar("Success", message,
          colorText: Colors.white, backgroundColor: Colors.green);
    } else {
      Get.snackbar("Error", message,
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }

  get() async {}
}
