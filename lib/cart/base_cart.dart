import 'package:store/cart/base_cart_item.dart';
import 'package:store/cart/base_cart_item_controller.dart';

class BaseCart {
  List<BaseCartItem> cartItems;
  BaseCart(this.cartItems);
  BaseCart.fromJson(Map<String, dynamic> jsonObject) {
    this.cartItems =
        BaseCartItemController.toCartItems(jsonObject["cart_items"]);
  }
}
