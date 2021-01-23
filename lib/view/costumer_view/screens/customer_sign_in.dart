import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/view/costumer_view/screens/customer_home.dart';
import 'package:store/view/costumer_view/screens/customer_registering.dart';
import 'package:store/view/shop_owner_view/shop_owner_home.dart';

class SignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<SignIn> {
  TextEditingController _userController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _clearUser() {
    setState(() {
      _userController.clear();
    });
  }

  void _clearPass() {
    setState(() {
      _passwordController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 25),
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 50.0)),
            Image.asset(
              "assets/images/splashLogo.jpeg",
              width: 250,
              height: 250,
            ),
            Padding(padding: EdgeInsets.all(30.0)),
            TextField(
              controller: _userController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                // border: OutlineInputBorder(),
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.blue,
                ),
                labelText: 'user name',
                hintText: 'phone or email',
                //     suffixIcon: IconButton(
                //  icon: Icon(Icons.clear), onPressed: _clearUser)
              ),
              //  maxLength: 30,
            ),
            Padding(padding: EdgeInsets.all(5.0)),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                //  border: OutlineInputBorder(),
                icon: Icon(
                  Icons.lock,
                  color: Colors.blue,
                ),
                labelText: 'Password',
                hintText: 'password',
//                  suffixIcon: IconButton(
//                      icon: Icon(Icons.clear), onPressed: _clearPass)
              ),
              // maxLength: 30,
            ),
            Padding(
              padding: EdgeInsets.all(17.0),
            ),
            RaisedButton(
              child: Text('Log in'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CustomerHome();
                }));
              },
              color: Colors.blue,
              textColor: Colors.white,
            ),
            Row(
              //I put this row so 'FlatButton' don't take all the width of 'ListView'
              //widgets in 'ListView' takes all its width
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text('Forgot password?'),
                  onPressed: () {},
                  textColor: Colors.blue,
                )
              ],
            ),
            Divider(
              height: 80,
              color: Colors.black38,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('Create New Account'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SignUp();
                    }));
                  },
                  color: Colors.green.shade700,
                  textColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 55),
                )
              ],
            ),
            Row(
              //I put this row so 'FlatButton' don't take all the width of 'ListView'
              //widgets in 'ListView' takes all its width
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text('shop owner?'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (contex) {
                      return ShopOwnerHome();
                    }));
                  },
                  textColor: Colors.blue,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
