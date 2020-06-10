import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:store/utilities/data_utilities.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('categories').snapshots(),
            // ignore: missing_return
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return connectionError();
                  break;
                case ConnectionState.waiting:
                  return loading();
                  break;
                case ConnectionState.active:
                case ConnectionState.done:
                  if(snapshot.hasError){
                    return error(snapshot.error);
                  }else if(!snapshot.hasData){
                    return noData();
                  }else{
                    return ListView(
                      children: snapshot.data.documents.map((DocumentSnapshot document) {
                        return ListTile(
                          title: Text(document["title"]),
                          trailing: IconButton(icon: Icon(Icons.delete), onPressed: (){
                            Firestore.instance.collection("categories").document(document.documentID).delete();
                          }),
                        );
                      }).toList()
                    );
                  }

                  break;
              }
            }),
      ),
    );
  }
}
