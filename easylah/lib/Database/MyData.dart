import 'package:flutter/material.dart';


class MyData{
  //List <MyItem> dbData;
 String loginUser;
 MyData({this.loginUser});
 var  productList = [
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
     "uid_name": "Sara1986",
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

  List getDbData (){
     return productList;
  }

 String getLoginUser (){
   return 'Sara1986';
 }

 List <String> getGenderList (){
    return ['male','female'];
 }

}
