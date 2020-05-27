import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store/authentication/authenticatable.dart';
import 'package:store/authentication/authentication_controller.dart';

void main() {
  runApp(Store());
}

class Store extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Registering(),
    );
  }
}

class Registering extends StatefulWidget {
  @override
  _RegisteringState createState() => _RegisteringState();
}

class _RegisteringState extends State<Registering> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  Authenticatable _authenticatable = FirebaseAuthenticationController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Auth test"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("login"),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,

                  decoration: InputDecoration(
                    hintText: "email",
                  ),
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "password",
                  ),
                ),
                RaisedButton(
                  onPressed: () async {
                    String email = _emailController.text;
                    String password = _passwordController.text;
                    FirebaseUser fireBaseUser = await _authenticatable.logIn(email, password);
                    print(_authenticatable.getCurrentUser());
                  },
                  child: Text("logIn"),
                ),
                RaisedButton(
                  onPressed: () async {
                    _authenticatable.signOut();print(_authenticatable.getCurrentUser());
                  },
                  child: Text("sign out"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
