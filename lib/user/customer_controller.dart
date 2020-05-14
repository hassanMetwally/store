import 'package:store/user/customer.dart';
import 'package:store/order/base_order.dart';
import 'package:store/product/base_product.dart';


class CustomerController {
  Customer customer;

  CustomerController(this.customer);

  void addToOrders(BaseOrder order) {
    this.customer.orders.add(order);
  }

  void addToWishList(BaseProduct product) {
    this.customer.wishList.add(product);
  }

  bool isOrderInOrders(BaseOrder order){
    return this.customer.orders.contains(order);
  }

  bool isProductInWishList(BaseProduct product){
    return this.customer.wishList.contains(product);
  }

  bool removeFromWishList(BaseProduct product){
    return this.customer.wishList.remove(product);
  }


}