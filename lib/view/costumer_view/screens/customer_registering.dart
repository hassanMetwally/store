import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store/view/costumer_view/screens/customer_home.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignUpState();
  }
}

class SignUpState extends State<SignUp> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _signUpAlertMessage = '';


  int _radioGroup = 0;
  void _radio(int value) {
    setState(() {
      _radioGroup = value;
    });
  }

  void _routToHome() {
    if (_firstNameController.text.isEmpty ||
        _lastNameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty) {
      setState(() {
        _signUpAlertMessage = 'Please fill the Requirements';
      });
    } else {
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return CustomerHome();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          padding: EdgeInsets.only(left: 30,right: 30, top: 70),
          children: <Widget>[
            Center(
              child: Text(
                'Create your account',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  // fontFamily: 'Rosemary'
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(40)),
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(
                hintText: 'First Name',
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(
                hintText: 'Last Name',
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'password',
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Radio(
                    value: 0,
                    groupValue: _radioGroup,
                    onChanged: _radio,
                  ),
                  Text('Male'),
                  Container(
                    padding: EdgeInsets.all(20),
                  ),
                  Radio(
                    value: 1,
                    groupValue: _radioGroup,
                    onChanged: _radio,
                  ),
                  Text('Female'),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(50)),
            RaisedButton(
              child: Text('sign up'),
              onPressed: _routToHome,
              color: Colors.blue,
              textColor: Colors.white,
            ),
            Padding(padding: EdgeInsets.all(10)),
            Container(
              alignment: Alignment.bottomCenter,
              child: Text('$_signUpAlertMessage',style: TextStyle(color: Colors.red),),
            )
          ],
        ),
      ),
    );
  }
}
