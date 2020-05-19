import 'package:easylah/Database/MyData.dart';
import 'package:easylah/Database/MyDataOperations.dart';
import 'package:easylah/Home/StateMyProfile.dart';
import 'package:easylah/Home/StateOthersProfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'ProductDetails.dart';

class SingleProduct extends StatelessWidget {
  String uid_name;
  String prod_name;
  String prod_desc;
  String uid_location;
  String prod_price;
  String prod_picture;

  SingleProduct(
      {this.uid_name,
      this.prod_name,
      this.prod_desc,
      this.uid_location,
      this.prod_price,
      this.prod_picture});



  @override
  Widget build(BuildContext context) {
    String dbLoginuser = MyData().getLoginUser();

    return Card(
      child: Material(
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new ProductDetails(
                      uid_name: uid_name,
                      prod_name: prod_name,
                      prod_desc: prod_desc,
                      uid_location: uid_location,
                      prod_price: prod_price,
                      prod_picture: prod_picture,
                    )));
          },
          //error onTap: ()  => Navigator.of(context).push(new MaterialPageRoute(builder: (context) => ProductDetails())),
          child: GridTile(
            child: Image.asset(
              prod_picture,
              fit: BoxFit.cover,
            ),
            footer: Container(
              //alignment: Alignment.topLeft,
              height: 65,
              color: Colors.white70,
              child: Column(children: [
                // 1  Product Name
                Container(
                  alignment: Alignment.topLeft,
                  height: 20,
                  child: Text(
                    '${prod_name}',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                // 2 Prod Desc
                /* Container(
                    height: 20,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Text(
                          prod_desc,
                        )
                      ],
                    ),
                  ), */
                // 3 User name
                Container(
                  alignment: Alignment.bottomLeft,
                  height: 20,
                  child: InkWell(
                    onTap: () async{

                      // this get only All USER Item LIST
                      List allDBProductList = await MyData().getDbData();
//                            print (allDBProductList.toString());
//                            print(widget.loginUser);

                      // this get only searched USER Item LIST from All USER Item LIST
                      List allUserDBProductList = await MyDataOperations()
                          .listUserItemForEach(
                          allDBProductList, uid_name);

                      // this get ExcludeUSER Item LIST from All USER Item LIST
                      List allExcludeUserDBProductList = await MyDataOperations()
                          .listExcludeUserItemForEach(
                          allDBProductList, uid_name);

                      //allDBProductList.clear();
                      //allUserDBProductList.clear();
                      //allExcludeUserDBProductList.clear();

                      // CHECK for Login User
                      if (dbLoginuser == uid_name) {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new StateMyProfile(loginUser: uid_name,userItemList: allUserDBProductList,)));
                      } else {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new StateOthersProfile(otherUser: uid_name,userItemList: allUserDBProductList,excludeUserItemList: allExcludeUserDBProductList,)));
                      }
                    },
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Icon(
                            Icons.person,
                            color: Colors.blue,
                            size: 18.0,
                          ),
                          Text(
                            uid_name,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              //fontWeight: FontWeight.bold,
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                            ),
                            //softWrap: true,
                          )
                        ]),
                  ),
                ),
                // 4
                Container(
                    height: 20,
                    child: Row(
                        //scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          //Icon(Icons.attach_money,color: Colors.pink,size: 18.0,),
                          Text(
                            'S\$${prod_price}',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            //softWrap: true,
                          ),
                          Spacer(),
                          Text(
                            'Used',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                color: Colors.black),
                            softWrap: true,
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              print('fav icon pressed');
                              print(this.prod_name);
                            },
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.pink,
                              size: 18.0,
                            ),
                          )
                        ]))
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
