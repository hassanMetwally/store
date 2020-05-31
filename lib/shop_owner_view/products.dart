import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("All Products"),
          centerTitle: true,
        ),
        body: _drawProductsList());
  }

  Widget _drawProductsList() {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('products').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Text('Loading...');
          default:
            return ListView(
              children: snapshot.data.documents.map((DocumentSnapshot document) {
                return ListTile(
                  title: Text(document['product_title']),
                  subtitle: Text(document['product_price']),
                  trailing: IconButton(icon: Icon(Icons.delete), onPressed: (){
                    Firestore.instance.collection("products").document(document.documentID).delete();
                  }),
                );
              }).toList(),
            );
        }
      },
    );
  }
}
