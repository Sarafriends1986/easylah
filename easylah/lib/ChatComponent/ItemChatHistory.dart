import 'package:easylah/Database/MyData.dart';
import 'package:flutter/material.dart';

import 'ChatHistoryHeader.dart';






class ItemChatHistory extends StatefulWidget {
  @override
  _ItemChatHistoryState createState() => _ItemChatHistoryState();
}

class _ItemChatHistoryState extends State<ItemChatHistory> {

  @override
  Widget build(BuildContext context) {

    String dbLoginuser = MyData().getLoginUser();
    // Edit Variables to display in screen
   // List allDBProductList = MyData().getDbData();

    List myChatProductList = [
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
            'Item Chat History',
            textAlign: TextAlign.center,
            style: TextStyle(
              //fontWeight: FontWeight.bold,
                color: Colors.pink),
          ),

        ),

        body: Container(
            child:ListView.builder(
              itemBuilder: (context, index) {
                return ChatHistoryHeader(
                    loginUser: dbLoginuser,
                    uid_name: myChatProductList[index]['uid_name'],
                    prod_name: myChatProductList[index]['prod_name'],
                    prod_desc: myChatProductList[index]['prod_desc'],
                    uid_location: myChatProductList[index]['uid_location'],
                    prod_price: myChatProductList[index]['prod_price'],
                    prod_picture: myChatProductList[index]['prod_picture']);

              },
              itemCount: myChatProductList.length,
            )
        ),
      ),
    );

  }
}

