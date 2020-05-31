import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/utilities/data_utilities.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _addProductFormKey = GlobalKey<FormState>();
  TextEditingController _titleEditingController = TextEditingController();
  TextEditingController _descriptionEditingController = TextEditingController();
  TextEditingController _priceEditingController = TextEditingController();

  bool _isLoading = false;


  @override
  void dispose() {
    _titleEditingController.dispose();
    _descriptionEditingController.dispose();
    _priceEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
        centerTitle: true,
      ),
      body: (_isLoading)? loading(): _drawAddCategoryForm(),
    );
  }

  Widget _drawAddCategoryForm(){
    return Container(
      padding: EdgeInsets.all(16),
      child: Form(
          key: _addProductFormKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _titleEditingController,
                decoration: InputDecoration(
                  hintText: "Product Title",
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Title is required";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _descriptionEditingController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: "Product Description",
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Description is required";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _priceEditingController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  hintText: "Product Price",
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Price is required";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () {
                  if (_addProductFormKey.currentState.validate()) {
                    setState(() {
                      _isLoading = true;
                    });
                    Firestore.instance.collection('products').document().setData({
                      'product_title': _titleEditingController.text,
                      'product_description': _descriptionEditingController.text,
                      'product_price': _priceEditingController.text,
                    }).then((value) {
                      setState(() {
                        _isLoading = false;
                      });
                    });
                    _titleEditingController.text ="";
                    _descriptionEditingController.text ="";
                    _priceEditingController.text= "";
                  }
                },
                child: Text(
                  "Save product",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
              )
            ],
          )),
    );
  }
}
