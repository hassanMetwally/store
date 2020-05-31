import 'package:flutter/material.dart';
import 'package:store/shop_owner_view/shared_ui/navigation_drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
