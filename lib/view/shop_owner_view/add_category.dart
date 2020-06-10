import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:store/utilities/data_utilities.dart';

class AddCategory extends StatefulWidget {
  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  final _addCategoryFormKey = GlobalKey<FormState>();
  TextEditingController _categoryTitleEditingController =
      TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _categoryTitleEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Category"),
        centerTitle: true,
      ),
      body: (_isLoading) ? loading() : _drawAddCategoryForm(),
    );
  }

  Widget _drawAddCategoryForm() {
    return Form(
      key: _addCategoryFormKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _categoryTitleEditingController,
              decoration: InputDecoration(hintText: "Category Title"),
              validator: (value) {
                if (value.isEmpty) {
                  return "Category title is required";
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () async {
                if (_addCategoryFormKey.currentState.validate()) {
                  bool exist = false;
                  if (exist) {
                  } else {
                    setState(() {
                      _isLoading = true;
                    });
                    await Firestore.instance
                        .collection("categories")
                        .document()
                        .setData({
                      'title': _categoryTitleEditingController.text
                    }).then((value) {
                      setState(() {
                        _isLoading = false;
                      });
                      _categoryTitleEditingController.text = "";
                    });
                  }
                }
              },
              child: Text("Save Category", style: TextStyle(color: Colors.white)),
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
