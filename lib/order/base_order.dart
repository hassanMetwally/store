import 'package:store/cart/base_cart.dart';
import 'package:store/payment/payment.dart';
import 'package:store/user/customer.dart';

abstract class BaseOrder{
  Customer customer;
  BaseCart cart;
  BasePayment payment;
  BaseOrder(this.customer,this.cart,this.payment);

  BaseOrder.fromJson(Map<String,dynamic> jsonObject){
    this.customer = Customer.fromJson(jsonObject["costomer"]);
    this.cart = BaseCart.fromJson( jsonObject["cart"]);
    this.payment = BasePayment.fromJson(jsonObject["payment"]);
  }

  double total(){

  }


}