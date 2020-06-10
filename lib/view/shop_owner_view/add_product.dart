import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  bool _isError = false;

  String selectedValue = "Select Category";

  File _image;
  final picker = ImagePicker();
  Future getImage() async {
    final image = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(image.path);
    });
  }

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
      body: (_isLoading) ? loading() : _drawAddProductForm(),
    );
  }

  Widget _drawAddProductForm() {
    return SingleChildScrollView(
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
              _drawSelectCategoryMenu(),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () async {
                  getImage();
                },
                child: Text("Select image"),
              ),
              SizedBox(
                height: 16,
              ),
              RaisedButton(
                onPressed: () async{
                  if (_addProductFormKey.currentState.validate()) {
                    setState(() {
                      _isLoading = true;
                    });
                    String productImage = await uploadImage(_image);
                    print(productImage);
                    await Firestore.instance
                        .collection('products')
                        .document()
                        .setData({
                      'product_title': _titleEditingController.text,
                      'product_description': _descriptionEditingController.text,
                      'product_price': _priceEditingController.text,
                      'product_category': selectedValue,
                      'product_image' : productImage,
                    }).then((value) {
                      setState(() {
                        _isLoading = false;
                      });
                    });
                    _titleEditingController.text = "";
                    _descriptionEditingController.text = "";
                    _priceEditingController.text = "";
                    selectedValue = "Select Category";
                  }
                },
                child: Text(
                  "Save product",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
              ),
              SizedBox(
                height: 16,
              ),
              (_isError) ? Text("error!! Select Category", style: TextStyle(color: Colors.red)) : Container()
            ],
          )),
    );
  }

  Widget _drawSelectCategoryMenu() {
    return StreamBuilder(
        stream: Firestore.instance.collection("categories").snapshots(),
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text("No connection...!");
              break;
            case ConnectionState.waiting:
              return Text("Loading...!");
              break;
            case ConnectionState.active:
            case ConnectionState.done:
              return DropdownButton<String>(
                value: selectedValue,
                onChanged: (String newValue) {
                  if (newValue == "Select Category") {
                    setState(() {
                      _isError = true;
                    });
                  } else {
                    setState(() {
                      selectedValue = newValue;
                      _isError = false;
                    });
                  }
                },
                items: snapshot.data.documents
                    .map<DropdownMenuItem<String>>((DocumentSnapshot document) {
                  return DropdownMenuItem<String>(
                    value: document["title"],
                    child: Text(document["title"]),
                  );
                }).toList(),
                // icon: Icon(Icons.arrow_downward),
                // iconSize: 24,
                // elevation: 16,
                style: TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
              );
              break;
          }
        });
  }

  Future<String> uploadImage(File image) async{
    String name ="ahmed/" + Random().nextInt(1000).toString() + "_product";
    final StorageReference storageReference = FirebaseStorage().ref().child(name);
    final StorageUploadTask uploadTask = storageReference.putFile(image);
    StorageTaskSnapshot response = await uploadTask.onComplete;
    String url = await response.ref.getDownloadURL();
    return url;
  }
}
