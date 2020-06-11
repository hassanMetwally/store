import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  final String photo;
  Product({this.photo});

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(38, 42, 43, 1),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(),
            child: Column(
              children: <Widget>[
                Image.asset(
                  widget.photo,
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    top: 16.0,
                    bottom: 16.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Icon(
                        Icons.done_outline,
                        color: Colors.yellowAccent,
                      ),
                      Text(
                        ' 2 Shoes',
                        style: TextStyle(color: Colors.white),
                      ),
                      Container(
                        child: IconButton(
                          icon: Icon(
                            Icons.remove_red_eye,
                          ),
                          color: Colors.blue,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          ' Description :',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white54,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Hi There ? bla blablabla bla blabla bla '
                        ' Hi There ? bla blablabla bla blabla bla   '
                        'Hi There ? bla blablabla bla blabla bla',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white54,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _Type(
                        model: 'Form',
                        type: 'Nike',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _Type(
                        model: 'Price',
                        type: '15\$',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _DropListSize(),
                      SizedBox(
                        height: 20,
                      ),
                      _DropListColor(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Type extends StatelessWidget {
  final String type;
  final String model;
  _Type({this.type, this.model});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          model,
          style: TextStyle(
              color: Colors.white54, fontWeight: FontWeight.w900, fontSize: 20),
        ),
        Text(
          type,
          style: TextStyle(
              color: Colors.white54, fontWeight: FontWeight.w900, fontSize: 20),
        ),
      ],
    );
  }
}

String dropdownValueSize = '37';

class _DropListSize extends StatefulWidget {
  @override
  _DropListSizeState createState() => _DropListSizeState();
}

class _DropListSizeState extends State<_DropListSize> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          'Size',
          style: TextStyle(
              color: Colors.white54, fontWeight: FontWeight.w900, fontSize: 20),
        ),
        DropdownButton<String>(
          value: dropdownValueSize,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.blue),
          items: <String>['37', '39', '41', '43'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(
              () {
                dropdownValueSize = newValue;
              },
            );
          },
        ),
      ],
    );
  }
}

String dropdownValueColor = 'white';

class _DropListColor extends StatefulWidget {
  @override
  __DropListColorState createState() => __DropListColorState();
}

class __DropListColorState extends State<_DropListColor> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          '  Color',
          style: TextStyle(
              color: Colors.white54, fontWeight: FontWeight.w900, fontSize: 20),
        ),
        DropdownButton<String>(
          value: dropdownValueColor,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.blue),
          items: <String>['white', 'Red', 'Black', 'Bink'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(
              () {
                dropdownValueColor = newValue;
              },
            );
          },
        ),
      ],
    );
  }
}
