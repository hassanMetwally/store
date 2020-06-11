import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/navigation_menu_item/nav_menu_item.dart';
import 'package:store/view/costumer_view/screens/three_d_model.dart';


class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  List<NavMenuItem> navMenuItems = [
    NavMenuItem("3d model", () => ThreeDModel()),
    NavMenuItem("Favorites", () => ThreeDModel()),
    NavMenuItem("Personal information", () => ThreeDModel()),
    NavMenuItem("Clipboard", () => ThreeDModel()),
    NavMenuItem("Calendar", () => ThreeDModel()),
    NavMenuItem("Payment method", () => ThreeDModel()),
    NavMenuItem("Settings", () => ThreeDModel()),
    NavMenuItem("About Us", () => ThreeDModel()),
    NavMenuItem("Account", () => ThreeDModel()),
    NavMenuItem("Orders", () => ThreeDModel()),
  ];

  TextStyle drawerTextStyle =TextStyle(color: Color(0xffeef1f8));

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _drawNavHeader(),
            _drawNaveBody(),
            _drawNaveFooter()
          ],
        ),
      ),
    );
  }

  Widget _drawNavHeader() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 70, bottom: 15),
          child: Container(
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: ExactAssetImage("assets/images/placeholder_bg.png"),
                fit: BoxFit.cover,
              ),
              //borderRadius: BorderRadiusGeometry()
            ),
            width: 105,
            height: 105,
          ),
        ),
        FlatButton(
          color: Colors.black26,
          onPressed: () {},
          child: Text("hassan metwally",style: drawerTextStyle,),
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
              side: BorderSide(color: Color(0xffeef1f8))),
        )
      ],
    );
  }

  Widget _drawNaveBody() {
    return ListView.builder(
      itemBuilder: (context, position) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 6),
          color: Colors.black26,
          child: ListTile(
            title: Text(navMenuItems[position].title,style: drawerTextStyle,),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 13,
              color: Color(0xffeef1f8),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return navMenuItems[position].destination();
              }));
            },
          ),
        );
      },
      itemCount: navMenuItems.length,
      shrinkWrap: true, //because this widget is  nested in a scrollable widget
      physics: new NeverScrollableScrollPhysics(),
    );
  }

  Widget _drawNaveFooter() {
    return FlatButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text("Log Out",style: drawerTextStyle,),
          SizedBox(
            width: 12,
          ),
          Icon(Icons.lock_outline,color:  Color(0xffeef1f8),),
        ],
      ),
      onPressed: () {},
    );
  }
}
