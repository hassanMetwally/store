import 'package:flutter/material.dart';
import 'package:store/view/shop_owner_view/shared_ui/shop_owner_navigation_drawer.dart';

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
      drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Color.fromRGBO(238, 241, 248, 0.7),
          ),
          child: NavigationDrawer()),
    );
  }
}
