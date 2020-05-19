import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'HorizontalListView.dart';
import 'ProductDetails.dart';
import 'SingleProduct.dart';
////////////////   NOT  IN USE  DATABASE/MyDATA file has data list#######################
class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  String currentProfileImage =
      'https://supermariorun.com/assets/img/hero/hero_chara_mario_update_pc.png';
  var productList = [
    {
      "uid_name": "Sara1986",
      "prod_name": "Home Food",
      "prod_desc": "Dinner",
      "uid_location": "Bishan",
      "prod_price": "25.00",
      "prod_picture": "images/products/food1.jpg",
    },
    {
      "uid_name": "Ravi1976",
      "prod_name": "Hand Crafts",
      "prod_desc": "Deco",
      "uid_location": "Bedok",
      "prod_price": "15.00",
      "prod_picture": "images/products/crafts1.jpg",
    },
    {
      "uid_name": "sara1986",
      "prod_name": "Home Meal",
      "prod_desc": "Dinner",
      "uid_location": "Bishan",
      "prod_price": "24.00",
      "prod_picture": "images/products/food2.jpg",
    },
    {
      "uid_name": "Ramu1945",
      "prod_name": "Plumming works",
      "prod_desc": "Repair services",
      "uid_location": "Bedok",
      "prod_price": "25.00",
      "prod_picture": "images/products/repair1.jpg",
    },
    {
      "uid_name": "Shabir1643",
      "prod_name": "Master Room",
      "prod_desc": "Renatal",
      "uid_location": "Woodlands",
      "prod_price": "700.00",
      "prod_picture": "images/products/rent1.jpg",
    },
    {
      "uid_name": "Jeeva2543",
      "prod_name": "Painter",
      "prod_desc": "Repair services",
      "uid_location": "Jurong east",
      "prod_price": "100.00",
      "prod_picture": "images/products/repair2.jpg",
    },
    {
      "uid_name": "Raju76f3e",
      "prod_name": "Maths Tution",
      "prod_desc": "Tution",
      "uid_location": "Punggol",
      "prod_price": "50.00",
      "prod_picture": "images/products/tution1.png",
    },
    {
      "uid_name": "Jeya654gd",
      "prod_name": "Hand Crafts",
      "prod_desc": "Hand made",
      "uid_location": "Semei",
      "prod_price": "75.00",
      "prod_picture": "images/products/crafts2.jpg",
    },
    {
      "uid_name": "Rahul97gdf",
      "prod_name": "Music Class",
      "prod_desc": "Tution",
      "uid_location": "Geylang",
      "prod_price": "45.00",
      "prod_picture": "images/products/tution2.jpg",
    },
    {
      "uid_name": "Taman254fsd",
      "prod_name": "Set Meals",
      "prod_desc": "Dinner",
      "uid_location": "Bishan",
      "prod_price": "50.00",
      "prod_picture": "images/products/food2.jpg",
    },
    {
      "uid_name": "Sara1976",
      "prod_name": "Hand made pots",
      "prod_desc": "Hand Crafts",
      "uid_location": "Boonlay",
      "prod_price": "55.00",
      "prod_picture": "images/products/crafts2.jpg",
    },
    {
      "uid_name": "Bala124fdr",
      "prod_name": "Air Con Services",
      "prod_desc": "Repair",
      "uid_location": "Tampines",
      "prod_price": "25.00",
      "prod_picture": "images/products/repair1.jpg",
    },
    {
      "uid_name": "Sara1976",
      "prod_name": "Rava Dosa",
      "prod_desc": "Dinner",
      "uid_location": "Orchard",
      "prod_price": "25.00",
      "prod_picture": "images/products/food2.jpg",
    },
    {
      "uid_name": "Raji654fdr",
      "prod_name": "Master Room",
      "prod_desc": "Rental",
      "uid_location": "Bedok",
      "prod_price": "600.00",
      "prod_picture": "images/products/rent2.jpg",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return SingleProduct(
              uid_name: productList[index]['uid_name'],
              prod_name: productList[index]['prod_name'],
              prod_desc: productList[index]['prod_desc'],
              uid_location: productList[index]['uid_location'],
              prod_price: productList[index]['prod_price'],
              prod_picture: productList[index]['prod_picture']);
        });
  }
}

