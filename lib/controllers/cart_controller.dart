import 'package:get/get.dart';
import '../models/product.dart';

class CartController extends GetxController {
  final RxMap<String, Product> cart = <String, Product>{}.obs;

  void add(Product product) {
    cart[product.id] = product;
    update();
    Get.snackbar("Success", "Product added to cart");
  }

  void remove(Product product) {
    cart.remove(product.id);
    update();
    Get.snackbar("Success", "Product removed from cart");
  }

  void clear() {
    cart.clear();
  }
}
