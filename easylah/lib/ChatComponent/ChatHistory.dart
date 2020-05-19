import 'package:easylah/Database/MyData.dart';
import 'package:flutter/material.dart';


import 'ChatHeader.dart';
import 'ChatHistoryHeader.dart';



class ChatHistory extends StatefulWidget {
  @override
  _ChatHistoryState createState() => _ChatHistoryState();
}

class _ChatHistoryState extends State<ChatHistory> {

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
    List allDBProductList = MyData().getDbData();


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
            'Chat History',
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
                    uid_name: allDBProductList[index]['uid_name'],
                    prod_name: allDBProductList[index]['prod_name'],
                    prod_desc: allDBProductList[index]['prod_desc'],
                    uid_location: allDBProductList[index]['uid_location'],
                    prod_price: allDBProductList[index]['prod_price'],
                    prod_picture: allDBProductList[index]['prod_picture']);

            },
            itemCount: allDBProductList.length,
          )
          ),
        ),
      );

  }
}

