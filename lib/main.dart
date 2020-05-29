import 'package:flutter/material.dart';
import 'package:store/admin/add_product.dart';
import 'package:store/admin/products.dart';
import 'package:store/admin/register.dart';
import 'admin/sign_in.dart';


void main() {
  runApp(Store());
}

class Store extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AllProduct(),
    );
  }
}


