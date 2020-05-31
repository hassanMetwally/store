import 'package:flutter/material.dart';

Widget loading() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}

Widget connectionError() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Center(
      child: Text("Connection Error!!!!"),
    ),
  );
}

Widget error(var error) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Center(
      child: Text(error.toString()),
    ),
  );
}

Widget noData() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Center(
      child: Text("No Data Available"),
    ),
  );
}
