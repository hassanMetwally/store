import 'package:flutter/material.dart';
import 'package:store/utilities/theme_data.dart';
import 'package:store/view/costumer_view/screens/splash_screen.dart';

void main() {
  runApp(Store());
}

class Store extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: SplashScreen(),
    );
  }
}


