import 'package:test1/models/Product.dart';

class Cart {
  static List<Product> cartItems = [];

  static void addToCart(Product product) {
    // Kiểm tra nếu sản phẩm đã có trong giỏ hàng
    int index = cartItems.indexWhere((item) => item.id == product.id);
    if (index != -1) {
      cartItems[index].quantity++; // Tăng số lượng nếu sản phẩm đã có
    } else {
      cartItems.add(product);
    }
  }

  static void removeFromCart(Product product) {
    cartItems.remove(product);
  }

  static double getTotalPrice() {
    double total = 0;
    for (var product in cartItems) {
      total += product.price * product.quantity; // Tính tổng dựa trên số lượng
    }
    return total;
  }
}
