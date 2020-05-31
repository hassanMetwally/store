import 'package:flutter/material.dart';
import 'package:store/shop_owner_view/home.dart';


void main() {
  runApp(Store());
}

class Store extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}


