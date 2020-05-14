import 'package:store/address/address.dart';
import 'package:store/order/base_order.dart';
import 'package:store/product/base_product.dart';
import 'package:store/user/user.dart';

class Customer extends User {
  Address shippingAddress;
  Address billingAddress;
  List<BaseOrder> orders;
  List<BaseProduct> wishList;

  Customer(
      String id,
      String firstName,
      String lastName,
      String email,
      String phone,
      String gender,
      Address shippingAddress,
      Address billingAddress,
      List<BaseOrder> orders,
      List<BaseProduct> wishList)
      : super(id, firstName, lastName, email, phone, gender) {
    this.shippingAddress = shippingAddress;
    this.billingAddress = billingAddress;
    this.orders = orders;
    this.wishList = wishList;
  }
}
