import 'package:easylah/Database/MyData.dart';
import 'package:easylah/Database/MyDataOperations.dart';
import 'package:flutter/material.dart';


import 'SingleProduct.dart';

class ExpandAll extends StatefulWidget {
  @override
  _ExpandAllState createState() => _ExpandAllState();
}

class _ExpandAllState extends State<ExpandAll> {

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
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: <Widget>[
            // SEARCH Bar Section
            Padding(
              padding: const EdgeInsets.fromLTRB(50.0, 0, 0, 0),
              child: Center(
                child: Container(
                  height: 40,
                  width: 320,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.pink[200],
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    textInputAction: TextInputAction.search,
                    keyboardType: TextInputType.text,
                    controller: nameHolder,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(8),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      hintText: myhint,
                    ),
                    onChanged: (val) {
                      print('typed $val');
                    },
                    onSubmitted: (val) async {
                      print('submit $val');
                      myhint = 'Search in Home lah!!!';
                      TextEditingController().clear();
                      clearTextInput();
                      //MyDataOperations().newSortedItemList.clear();
                      // this get all Item LIST from DB // iterate as each Item
                      //await MyDataOperations().listItemForEach(MyData().getDbData());
                      //await MyDataOperations().listItemForEach(_allDBProductList);

                      // this get only searched Item LIST
                      List sortDBProductList = await MyDataOperations().sortItemForEach(MyData().getDbData(), val);
                      //print(sortDBProductList.toString());
                      setState(() {
                        myhint = 'Search in Home lah!!!'; // search bar clear

                        allDBProductList = sortDBProductList; // sort list is new list to display
                        //print(allDBProductList.toString());
                      });
                    },
                  ),
                ),
              ),
            ),
            Spacer(),
            // NOTIFICATION  ICON Section
//            Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: InkWell(
//                  onTap: () {
//                    showDialog(
//                        context: context,
//                        builder: (context) {
//                          return AlertDialog(
//                            title: Text('Notification'),
//                          );
//                        });
//                  },
//                  child: Icon(Icons.notifications,color: Colors.pink,)),
//            ),
          ],
        ),

        body: Container(
          child: CustomScrollView(
            slivers: <Widget>[

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
                          uid_name: allDBProductList[index]['uid_name'],
                          prod_name: allDBProductList[index]['prod_name'],
                          prod_desc: allDBProductList[index]['prod_desc'],
                          uid_location: allDBProductList[index]['uid_location'],
                          prod_price: allDBProductList[index]['prod_price'],
                          prod_picture: allDBProductList[index]['prod_picture']);
                    },

                    /// Set childCount to limit no.of items // always defined bottom
                    //childCount: 100,
                    childCount: allDBProductList.length,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
