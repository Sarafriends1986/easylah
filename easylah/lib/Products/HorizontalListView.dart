import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorizontalListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(imageCaption: 'Home Baking',imageLocation: 'images/category/cook.png',),
          Category(imageCaption: 'Home Services',imageLocation: 'images/category/tools.png',),
          Category(imageCaption: 'Home Tutions',imageLocation: 'images/category/presentation.png',),
          Category(imageCaption: 'Home Crafts',imageLocation: 'images/category/homecrafts.png',),
          Category(imageCaption: 'Room Rental',imageLocation: 'images/category/roomrental.png',),
          Category(imageCaption: 'Buy and Sell',imageLocation: 'images/category/buyandsell.png',),


        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;

  Category({this. imageLocation, this. imageCaption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: GestureDetector(
        onTap: (){
          print('$imageCaption pressed');
        },
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Container(
              width: 100,
              height: 80,
                child: Image.asset(imageLocation)),
            subtitle: Container(
              alignment: Alignment.topCenter,
                child: Text(imageCaption,style: TextStyle(fontSize: 12.0),textAlign: TextAlign.center)),
          ),
        ),
      ),
    );
  }
}

