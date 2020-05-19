import 'package:easylah/Database/MyData.dart';
import 'package:flutter/material.dart';

import 'FavouritesHeader.dart';






class FavouritesList extends StatefulWidget {
  @override
  _FavouritesListState createState() => _FavouritesListState();
}

class _FavouritesListState extends State<FavouritesList> {

  TextEditingController nameController = TextEditingController();
  final nameHolder = TextEditingController();

  clearTextInput() {
    nameHolder.clear();
  }
  String myhint = 'Search in Home lah!!!';



  @override
  Widget build(BuildContext context) {

    String dbLoginuser = MyData().getLoginUser();
    // Edit Variables to display in screen
   // List allDBProductList = MyData().getDbData();

    List myFavouritesProductList = [
      {
        "uid_name": "Ravi2hdt5",
        "prod_name": "Home Food",
        "prod_desc": "Dinner",
        "uid_location": "Bishan",
        "prod_price": "25.00",
        "prod_picture": "images/products/food1.jpg",
      },
      {
        "uid_name": "Raju65fdre",
        "prod_name": "Home Food",
        "prod_desc": "Dinner",
        "uid_location": "Bishan",
        "prod_price": "25.00",
        "prod_picture": "images/products/food1.jpg",
      },
    ];
    // no need to display other user listings in
    // List relatedProductList = [] ;

    return Container(
      child: Scaffold(
        appBar: new AppBar(
          iconTheme: new IconThemeData(color: Colors.pink),
          centerTitle: true,
          //backgroundColor: Colors.pink,
          backgroundColor: Colors.white,
          title: Text(
            'Favourites',
            textAlign: TextAlign.center,
            style: TextStyle(
              //fontWeight: FontWeight.bold,
                color: Colors.pink),
          ),

        ),

        body: Container(
            child:ListView.builder(
              itemBuilder: (context, index) {
                return FavouritesHeader(
                    loginUser: dbLoginuser,
                    uid_name: myFavouritesProductList[index]['uid_name'],
                    prod_name: myFavouritesProductList[index]['prod_name'],
                    prod_desc: myFavouritesProductList[index]['prod_desc'],
                    uid_location: myFavouritesProductList[index]['uid_location'],
                    prod_price: myFavouritesProductList[index]['prod_price'],
                    prod_picture: myFavouritesProductList[index]['prod_picture']);

              },
              itemCount: myFavouritesProductList.length,
            )
        ),
      ),
    );

  }
}

