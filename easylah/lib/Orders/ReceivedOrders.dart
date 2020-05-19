import 'package:easylah/Database/MyData.dart';
import 'package:flutter/material.dart';

import 'ReceivedOrdersHeader.dart';






class ReceivedOrders extends StatefulWidget {
  @override
  _ReceivedOrdersState createState() => _ReceivedOrdersState();
}

class _ReceivedOrdersState extends State<ReceivedOrders> {
  @override
  Widget build(BuildContext context) {

    String dbLoginuser = MyData().getLoginUser();
    // Edit Variables to display in screen
    //List allDBProductList = MyData().getDbData();
    List myOrderProductList = [
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
            'Received Orders',
            textAlign: TextAlign.center,
            style: TextStyle(
              //fontWeight: FontWeight.bold,
                color: Colors.pink),
          ),

        ),

        body: Container(
            child:ListView.builder(
              itemBuilder: (context, index) {
                return ReceivedOrdersHeader(
                    loginUser: dbLoginuser,
                    uid_name: myOrderProductList[index]['uid_name'],
                    prod_name: myOrderProductList[index]['prod_name'],
                    prod_desc: myOrderProductList[index]['prod_desc'],
                    uid_location: myOrderProductList[index]['uid_location'],
                    prod_price: myOrderProductList[index]['prod_price'],
                    prod_picture: myOrderProductList[index]['prod_picture']);

              },
              itemCount: myOrderProductList.length,
            )
        ),
      ),
    );

  }
}

