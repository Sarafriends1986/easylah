import 'package:carousel_pro/carousel_pro.dart';
import 'package:easylah/ChatComponent/Chat.dart';
import 'package:easylah/ChatComponent/ItemChatHistory.dart';
import 'package:easylah/Database/MyData.dart';
import 'package:easylah/Database/MyDataOperations.dart';
import 'package:easylah/Home/StateMyProfile.dart';
import 'package:easylah/Home/StateOthersProfile.dart';
import 'package:easylah/Models/User.dart';
import 'package:easylah/MyInheritedWidget/StateContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_read_more_text/flutter_read_more_text.dart';
import 'package:provider/provider.dart';



import 'ItemIssueReport.dart';
import 'Products.dart';
import 'SingleProduct.dart';

class ProductDetails extends StatefulWidget {
  String uid_name;
  String prod_name;
  String prod_desc;
  String uid_location;
  String prod_price;
  String prod_picture;

  ProductDetails(
      {this.uid_name,
      this.prod_name,
      this.prod_desc,
      this.uid_location,
      this.prod_price,
      this.prod_picture});
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String local_desc =
      "Product description\nProduct description\n\- Product description\n\- Product description\n\- Product description\n\- Product description\n Product descriptionProduct description\n Product descriptionProduct description\n Product descriptionProduct description\n Product descriptionProduct description\n Product descriptionProduct description\n Product descriptionProduct description\n Product descriptionProduct description\n Product descriptionProduct description\n Product descriptionProduct description\n Product descriptionProduct description\n Product description";
  List dbProductList = MyData().getDbData();
  String dbLoginuser = MyData().getLoginUser();

  @override
  Widget build(BuildContext context) {
    Widget prod_image_carousell = new Container(
      height: 400,
      child: Carousel(
        boxFit: BoxFit.fitHeight,
        images: [
          AssetImage(widget.prod_picture),
          AssetImage(widget.prod_picture),
          AssetImage(widget.prod_picture),
          AssetImage(widget.prod_picture),
        ],
        autoplay: true,
        dotSize: 4.0,
        indicatorBgPadding: 4.0,
      ),
    );
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: new AppBar(
        iconTheme: new IconThemeData(color: Colors.pink),
        centerTitle: true,
        //backgroundColor: Colors.pink,
        backgroundColor: Colors.white,
        title: Text(
          widget.prod_name,
          textAlign: TextAlign.center,
          style: TextStyle(
              //fontWeight: FontWeight.bold,
              color: Colors.pink),
        ),
        actions: <Widget>[
//          IconButton(
//            icon: Icon(
//              Icons.home,
//              color: Colors.pinkAccent,
//              //color: Colors.white,
//            ),
//            onPressed: () {
//              print('Back to home');
//              //print(HomePage().loginUser);
//              Navigator.of(context).pushNamedAndRemoveUntil(
//                  '/homepage', (Route<dynamic> route) => false);
//              //Navigator.of(context).canPop();
//            },
//          )
          InkWell(
            onTap: (){
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/homepage', (Route<dynamic> route) => false);
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 25,
                width: 25,
                child: Image(
                  image: AssetImage(
                    'images/homelah.png',

                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
          child: CustomScrollView(slivers: <Widget>[
        SliverList(
            delegate: SliverChildListDelegate([
          //Padding carousell only one item
          Padding(
            padding: EdgeInsets.all(4.0),
            child: prod_image_carousell,
          ),
          // Item Name
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0, 0),
            child: Container(
              //height: 20,
              child: Text(
                '${widget.prod_name}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16.0),
                softWrap: true,
              ),
            ),
          ),
          // Padding SGD , NEW , LIKES
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
            child: Container(
              height: 18,
              child: Row(
                children: [
                  Text(
                    'S\$12.50',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18.0),
                    softWrap: true,
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Tab(
                        icon: Container(
                          child: Image(
                            image: AssetImage(
                              'images/pricetag.png',
                            ),
                            color: Colors.blue,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      Text(
                        ' Used',
                        style: TextStyle(color: Colors.black, fontSize: 14.0),
                        softWrap: true,
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Tab(
                        icon: Container(
                          child: Image(
                            image: AssetImage(
                              'images/nolike.png',
                            ),
                            color: Colors.blue,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        ' 45 Likes',
                        style: TextStyle(color: Colors.black, fontSize: 14.0),
                        softWrap: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Padding Posted by User
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0, 0),
            child: Container(
                height: 18,
                child: Row(
                  children: <Widget>[
                    Tab(
                      icon: Container(
                        height: 18,
                        child: Image(
                          image: AssetImage(
                            'images/calendar.png',
                          ),
                          color: Colors.blue,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Text(' on 09-May-2020 ',
                        style: TextStyle(color: Colors.black, fontSize: 14.0),
                        softWrap: true),
                    Tab(
                      icon: Container(
                        height: 18,
                        child: Image(
                          image: AssetImage(
                            'images/person.png',
                          ),
                          color: Colors.blue,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        // this get only All USER Item LIST
                        List allDBProductList = await MyData().getDbData();

                        // this get only searched USER Item LIST from All USER Item LIST
                        List allUserDBProductList = await MyDataOperations()
                            .listUserItemForEach(
                                allDBProductList, widget.uid_name);

                        // this get ExcludeUSER Item LIST from All USER Item LIST
                        List allExcludeUserDBProductList =
                            await MyDataOperations().listExcludeUserItemForEach(
                                allDBProductList, widget.uid_name);

                        //                        allDBProductList.clear();
                        //                        allUserDBProductList.clear();
                        //                        allExcludeUserDBProductList.clear();

                        // Check the USER if LOGIN USER
                        final container = StateContainer.of(context);
                        print(container.user.uid);
                        print(container.user.email);
                        if (dbLoginuser == widget.uid_name) {
                          Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  new StateMyProfile(
                                    loginUser: widget.uid_name,
                                    userItemList: allUserDBProductList,
                                  )));
                        } else {
                          Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  new StateOthersProfile(
                                    otherUser: widget.uid_name,
                                    userItemList: allUserDBProductList,
                                    excludeUserItemList:
                                        allExcludeUserDBProductList,
                                  )));
                        }
                      },
                      child: Text(
                        widget.uid_name,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        //softWrap: true,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                )),
          ),
          //Padding Item Category group
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0, 0),
            child: Container(
              height: 18,
              child: Row(
                children: [
                  Tab(
                    icon: Container(
                      height: 18,
                      child: Image(
                        image: AssetImage(
                          'images/group.png',
                        ),
                        color: Colors.blue,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print('category pressed');
                    },
                    child: Text(
                      ' ${widget.prod_desc}',
                      style: TextStyle(color: Colors.black, fontSize: 14.0),
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
          //Padding Location
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0, 0),
            child: Container(
              height: 18,
              child: Row(
                children: [
                  Tab(
                    icon: Container(
                      height: 18,
                      child: Image(
                        image: AssetImage(
                          'images/location.png',
                        ),
                        color: Colors.red,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print('category pressed');
                    },
                    child: Text(
                      ' ${widget.uid_location}',
                      style: TextStyle(color: Colors.black, fontSize: 14.0),
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
          //Padding ITem Description
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0, 0),
            child: Container(
              height: 18,
              child: Row(
                children: [
                  Tab(
                    icon: Container(
                      height: 18,
                      child: Image(
                        image: AssetImage(
                          'images/document.png',
                        ),
                        color: Colors.blue,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Text(
                    ' Description',
                    style: TextStyle(color: Colors.black, fontSize: 14.0),
                    softWrap: true,
                  ),
                ],
              ),
            ),
          ),
          //Padding Description Paragraph
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0, 0),
            child: ReadMoreText(
              '${local_desc}',

            ),
          ),
          /* //Another Description
                  ListTile(
                    title: Text('Description'),
                    subtitle: Text(local_desc),
                  ), */
          Divider(),
          // Related Items
          Padding(
            padding: EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 8.0),
            child: Text(
              'Related Items',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          //Grid view Items
        ])),
        SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              ///no.of items in the horizontal axis
              crossAxisCount: 2,
            ),

            ///Lazy building of list
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                /// To convert this infinite list to a list with "n" no of items,
                /// uncomment the following line:
                /// if (index > n) return null;
                return SingleProduct(
                    uid_name: dbProductList[index]['uid_name'],
                    prod_name: dbProductList[index]['prod_name'],
                    prod_desc: dbProductList[index]['prod_desc'],
                    uid_location: dbProductList[index]['uid_location'],
                    prod_price: dbProductList[index]['prod_price'],
                    prod_picture: dbProductList[index]['prod_picture']);
              },

              /// Set childCount to limit no.of items // always defined bottom
              //childCount: 100,
              childCount: dbProductList.length,
            )),
      ])),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          height: 50,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                //Like icon
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Like'),
                          );
                        });
                  },
                  child: Tab(
                    icon: Container(
                      child: Image(
                        image: AssetImage(
                          'images/nolike.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                      height: 25,
                    ),
                  ),
                ),
                Spacer(),
                //  Chat Icon
                InkWell(
                  onTap: () {
//                    showDialog(
//                        context: context,
//                        builder: (context) {
//                          return AlertDialog(
//                            title: Text('chat'),
//                          );
//                        });
                            if(widget.uid_name == dbLoginuser){
                              Navigator.of(context).push(new MaterialPageRoute(
                                  builder: (BuildContext context) =>  ItemChatHistory()));
                            }else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Chat(
                                          loginUser: dbLoginuser,
                                          uid_name: widget.uid_name,
                                          prod_name: widget.prod_name,
                                          prod_price: widget.prod_price,
                                          prod_desc: widget.prod_desc,
                                          uid_location: widget.uid_location,
                                          prod_picture: widget.prod_picture),
                                ),
                              );
                            }
                  },
                  child: Tab(
                    icon: Container(
                      child: Image(
                        image: AssetImage(
                          'images/bubbles.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                      height: 25,
                    ),
                  ),
                ),
                Spacer(),
                //  hand shake deal  Icon
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('deal'),
                          );
                        });
                  },
                  child: Tab(
                    icon: Container(
                      child: Image(
                        image: AssetImage(
                          'images/deal.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                      height: 25,
                    ),
                  ),
                ),
                Spacer(),
                // share to public  Icon
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('share link'),
                          );
                        });
                  },
                  child: Tab(
                    icon: Container(
                      child: Image(
                        image: AssetImage(
                          'images/direction.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                      height: 25,
                    ),
                  ),
                ),
                Spacer(),
                // report issue   Icon
                InkWell(
                  onTap: () {
//                    showDialog(
//                        context: context,
//                        builder: (context) {
//                          return AlertDialog(
//                            title: Text('Report issue'),
//                          );
//                        });
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return ItemIssueReport();
                        });

                  },
                  child: Tab(
                    icon: Container(
                      child: Image(
                        image: AssetImage(
                          'images/close.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                      height: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
