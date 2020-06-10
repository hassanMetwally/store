import 'package:flutter/material.dart';
import 'package:store/view/shop_owner_view/shared_ui/navigation_drawer.dart';

class ShopOwnerHome extends StatefulWidget {
  @override
  _ShopOwnerHomeState createState() => _ShopOwnerHomeState();
}

class _ShopOwnerHomeState extends State<ShopOwnerHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Store"),
        centerTitle: true,
      ),
      body: Container(),
      drawer: NavigationDrawer()
    );
  }
}
