import 'package:flutter/material.dart';
import '../product.dart';

class Recommended extends StatefulWidget {
  @override
  _RecommendedState createState() => _RecommendedState();
}

class _RecommendedState extends State<Recommended> {
  List<String> photos = [
    'assets/images/placeholder_bg.png',
    'assets/images/placeholder_bg.png',
    'assets/images/placeholder_bg.png',
    'assets/images/placeholder_bg.png',
    'assets/images/placeholder_bg.png',
    'assets/images/placeholder_bg.png',
    'assets/images/placeholder_bg.png'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: photos.length,
      itemBuilder: (context, position) {
        return InkWell(
          child: _BuildCard(img: photos[position]),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Product(
                  photo: photos[position],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _BuildCard extends StatelessWidget {
  final String img;

  _BuildCard({this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        child: Card(

          child: Column(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .25,
                child: Image(
                  image: ExactAssetImage("assets/images/placeholder_bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: 30,
                    height: 35,
                    child: IconButton(
                        padding: EdgeInsets.only(left: 10,),
                        iconSize: 18,
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        onPressed: () {}),
                  ),
                  SizedBox(
                    width: 30,
                    height: 20,
                    child: IconButton(
                        padding: EdgeInsets.only(right: 10,),
                        iconSize: 18,
                        icon: Icon(
                          Icons.visibility,
                          color: Colors.blue,
                        ),
                        onPressed: () {}),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
