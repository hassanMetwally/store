import 'package:flutter/material.dart';
import 'package:store/view/costumer_view/screens/home_tabs/cart.dart';
import 'package:store/view/costumer_view/screens/home_tabs/explore.dart';
import 'package:store/view/costumer_view/screens/home_tabs/recommended.dart';
import 'package:store/view/costumer_view/shared_ui/customer_navigation_drawer.dart';

class CustomerHome extends StatefulWidget {
  @override
  _CustomerHomeState createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.notifications), onPressed: () {})
        ],
        bottom: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.account_balance),
            ),
            Tab(
              icon: Icon(Icons.shopping_cart),
            ),
          ],
          controller: _tabController,
          indicator: UnderlineTabIndicator (
            borderSide: BorderSide(width: 5.0),
            insets: EdgeInsets.symmetric(horizontal: 40.0),
          ),
        ),
        elevation: 15,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60),
            bottomRight: Radius.circular(60),

          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Recommended(),
          Explore(),
          Cart(),
        ],
      ),
      drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Color.fromRGBO(238, 241, 248, 0.7),
          ),
          child: NavigationDrawer()),
    );
  }
}
