import 'package:flutter/material.dart';

import 'package:store/navigation_menu_item/nav_menu_item.dart';

import '../add_category.dart';
import '../add_product.dart';
import '../categories.dart';
import '../products.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  List<NavMenuItem> navMenuItems = [
    NavMenuItem("Categories", () => Categories()),
    NavMenuItem("Add Category", () => AddCategory()),
    NavMenuItem("Products", () => Products()),
    NavMenuItem("Add Product", () => AddProduct()),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _drawNavBody(),
          ],
        ),
      ),
    );
  }

  Widget _drawNavBody() {
    // ignore: missing_return
    return ListView.builder(
      itemCount: navMenuItems.length,
      itemBuilder: (context, position) {
       return ListTile(
          title: Text(navMenuItems[position].title),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return navMenuItems[position].destination();
            }));
          },
        );
      },
      shrinkWrap: true,
    );
  }
}
