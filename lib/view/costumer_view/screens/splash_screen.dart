import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/view/costumer_view/screens/customer_sign_in.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 1, milliseconds: 30),
      () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => SignIn()),
          (Route route) => false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Transform.translate(
        offset: Offset(0, -150),
        child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            child: Image(
              image: ExactAssetImage("assets/images/splashLogo.jpeg"),
              fit: BoxFit.cover,
            ),
            width: MediaQuery.of(context).size.width * .70,
            height: MediaQuery.of(context).size.height * .30,
          ),
        ),
      ),
    );
  }
}
