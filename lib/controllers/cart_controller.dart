import 'package:get/get.dart';
import '../models/product.dart';

class CartController extends GetxController {
  final RxMap<String, Product> cart = <String, Product>{}.obs;
  var quantity = 0.obs;
  var total = 0.obs;

  void add(Product product) {
    product.quantity = quantity.value.toString();
    cart[product.id] = product;
    getTotal();
    update();
    Get.back();
    Get.snackbar("Success", "Product added to cart");
  }

  void remove(Product product) {
    cart.remove(product.id);
    getTotal();
    update();
    Get.snackbar("Success", "Product removed from cart");
  }

  void clear() {
    cart.clear();
  }

  void increment() {
    quantity++;
  }

  void decrement() {
    if (quantity.value > 1) {
      quantity--;
    }
  }

  String getTotal() {
    total.value = 0;
    cart.forEach((key, value) {
      total.value +=
          int.parse(value.price) * int.parse(value.quantity.toString());
    });
    return total.value.toString();
  }
}
