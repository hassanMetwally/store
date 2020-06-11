import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _drawHeader(),
          _drawBody(),
        ],
      ),
    );
  }

  Widget _drawHeader() {
    return Column(
      children: <Widget>[
        Wrap(
          children: <Widget>[
            FlatButton(
              onPressed: () {},
              child: Text(
                "#voike",
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                "#nike",
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                "#adidas",
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                "#adidas",
              ),
            ),

          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            RaisedButton(
              color: Color.fromRGBO(188, 206, 247, .5),
              onPressed: () {},
              child: Row(
                children: <Widget>[
                  Text("filter"),
                  Icon(Icons.filter_list),
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _drawBody() {
    return GridView.builder(
      itemBuilder: (context, position) {
        return _drawBodyItems();
      },
      itemCount: 20,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }

  Widget _drawBodyItems() {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: InkWell(
        onTap: () {},
        child: Card(
          shape: RoundedRectangleBorder(
           // borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * .19,
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
                    height: 25,
                    child: IconButton(
                        padding: EdgeInsets.only(left: 10,top: 3),
                        iconSize: 18,
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        onPressed: () {}),
                  ),
                  SizedBox(
                    width: 30,
                    height: 25,
                    child: IconButton(
                      padding: EdgeInsets.only(right: 10,top: 3),
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
