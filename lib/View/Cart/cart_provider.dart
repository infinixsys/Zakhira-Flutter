import 'package:flutter/cupertino.dart';
import 'package:flutter_cart/flutter_cart.dart';

class CartProvider extends ChangeNotifier {
  FlutterCart _cart = FlutterCart();

  int get itemCount => _cart.getCartItemCount();

  void addToCart(String productId, String productName, double price,
      int quantity, String image) {
    _cart.addToCart(
        productId: productId,
        unitPrice: price,
        quantity: quantity,
        productName: productName,
        productDetailsObject: image);
    notifyListeners();
  }

  void removeFromCart(int index) {
    _cart.deleteItemFromCart(index);
    notifyListeners();
  }
}
