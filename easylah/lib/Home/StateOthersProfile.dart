import 'package:easylah/Database/MyData.dart';
import 'package:easylah/Database/MyDataOperations.dart';
import 'package:easylah/Products/SingleProduct.dart';
import 'package:easylah/Products/UserIssueReport.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_read_more_text/flutter_read_more_text.dart';



// ignore: must_be_immutable
class StateOthersProfile extends StatefulWidget {
  final String otherUser;
  List userItemList;
  List excludeUserItemList;
  StateOthersProfile(
      {this.otherUser, this.userItemList, this.excludeUserItemList});

  final String _bio = "\"Hi Friedns , Check out my Ads and Listings.\"";
  //final String _followers = "173";
  int _followers = 100;
  int _reviews = 8;
  final String _posts = "24";

  String _myButton = 'FOLLOW';
  bool isFollowing = true;
  List dbProductList = MyData().getDbData();
  String currentProfileImage =
      'https://supermariorun.com/assets/img/hero/hero_chara_mario_update_pc.png';

  @override
  _StateOthersProfileState createState() => _StateOthersProfileState();
}

class _StateOthersProfileState extends State<StateOthersProfile> {
  String otherUser = '';
  @override
  void intState() {
    otherUser = widget.otherUser;
    super.initState();
  }

  TextEditingController nameController = TextEditingController();
  final nameHolder = TextEditingController();
  clearTextInput() {
    nameHolder.clear();
  }

  String myhint = 'Search User Listings!!!';

  Widget _buildCoverImage() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072823_1280.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.currentProfileImage),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(50.0),
          border: Border.all(
            color: Colors.white,
            width: 2.0,
          ),
        ),
      ),
    );
  }

  Widget _buildFullName() {
    TextStyle _nameTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
    );

    return Center(
      child: Text(
        widget.otherUser,
        style: _nameTextStyle,
      ),
    );
  }

  Widget _buildStatItem(String label, String count) {
    TextStyle _statLabelTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 10.0,
      fontWeight: FontWeight.w200,
    );

    TextStyle _statCountTextStyle = TextStyle(
      color: Colors.black54,
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          count,
          style: _statCountTextStyle,
        ),
        Text(
          label,
          style: _statLabelTextStyle,
        ),
      ],
    );
  }

  Widget _buildStatContainer() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 35.0,
        margin: EdgeInsets.only(top: 4.0),
        decoration: BoxDecoration(
          color: Colors.pink[100],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('List of Followers'),
                        );
                      });
                },
                child:
                    _buildStatItem("Followers", widget._followers.toString())),
            InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('List of Followings'),
                        );
                      });
                },
                child:
                    _buildStatItem("Following", widget._followers.toString())),
            InkWell(
                onTap: () {
                  print('followers');
                },
                child: _buildStatItem("Posts", widget._posts)),
            InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('List of Reviews'),
                        );
                      });
                },
                child: _buildStatItem("Reviews", widget._reviews.toString())),
          ],
        ),
      ),
    );
  }

  Widget _buildBio(BuildContext context) {
    TextStyle bioTextStyle = TextStyle(
      fontFamily: 'Spectral',
      fontWeight: FontWeight.w400, //try changing weight to w500 if not thin
      fontStyle: FontStyle.italic,
      color: Color(0xFF799497),
      fontSize: 16.0,
    );

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.all(8.0),
//      child: Text(
//        widget._bio,
//        textAlign: TextAlign.center,
//        style: bioTextStyle,
//      ),
      child: ReadMoreText(
        "Hi Friends , Welcome to my Store.\nA typical online store enables the customer to browse the firm's range of products and services, view photos or images of the products, along with information about the product specifications, features and prices",
      ),
    );
  }

// Change state and  FOLLOW and POST
  Widget _buildGetInTouch(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 30,
        //color: Theme.of(context).scaffoldBackgroundColor,
        padding: EdgeInsets.only(top: 1.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                  //scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: Colors.pink,
                      size: 25.0,
                    ),
                    Text(
                      'Singapore',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      //softWrap: true,
                    )
                  ]),
            ),
            Expanded(
              child: Row(
                  //scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Icon(
                      Icons.phone,
                      color: Colors.pink,
                      size: 25.0,
                    ),
                    Icon(
                      Icons.mail,
                      color: Colors.pink,
                      size: 25.0,
                    ),
                    Text(
                      'Verified',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      //softWrap: true,
                    )
                  ]),
            ),
//            Expanded(
//              child: InkWell(
//                onTap: () {
//
//                  if (widget.isFollowing) {
//                    setState(() {
//                      widget._myButton = 'UNFOLLOW';
//                      widget._followers = widget._followers + 1;
//                    });
//                  } else {
//                    setState(() {
//                      widget._myButton = 'FOLLOW';
//                      widget._followers = widget._followers - 1;
//                    });
//                  }
//                  widget.isFollowing = !widget.isFollowing;
//                },
//                child: Container(
//                  height: 40.0,
//                  decoration: BoxDecoration(
//                    border: Border.all(),
//                    color: Colors.pink,
//                  ),
//                  child: Center(
//                    child: Text(
//                      widget._myButton,
//                      style: TextStyle(
//                        color: Colors.white,
//                        fontWeight: FontWeight.bold,
//                      ),
//                    ),
//                  ),
//                ),
//              ),
//            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(2, 1, 8, 0),
                child: Row(
                    //scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          if (widget.isFollowing) {
                            setState(() {
                              widget._myButton = 'UNFOLLOW';
                              widget._followers = widget._followers + 1;
                            });
                          } else {
                            setState(() {
                              widget._myButton = 'FOLLOW';
                              widget._followers = widget._followers - 1;
                            });
                          }
                          widget.isFollowing = !widget.isFollowing;
                        },
                        child: Container(
                          height: 60.0,
                          width: 80,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(6.0)),
                          child: Center(
                            child: Text(
                              widget._myButton,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  UserIssueReport(otherUser: widget.otherUser,)));
                        },
                        child: Container(
                          height: 40.0,
                          width: 30,
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(6.0)),
                          child: Center(
                            child: Text(
                              "...",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String dbLoginuser = MyData().getLoginUser();
    List allUserDBProductList = widget.userItemList;
    int countUserItems = allUserDBProductList.length;

    List allExvludeUserDBProductList = widget.excludeUserItemList;

    Size screenSize = MediaQuery.of(context).size;
// SCAFFOLD DISPLAY ON MOBILE
    return Scaffold(
      appBar: new AppBar(
        iconTheme: new IconThemeData(color: Colors.pink),
        centerTitle: true,
        //backgroundColor: Colors.pink,
        backgroundColor: Colors.white,
        title: Text(
          widget.otherUser,
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
//              Navigator.of(context).pushNamedAndRemoveUntil(
//                  '/homepage', (Route<dynamic> route) => false);
//              //Navigator.of(context).canPop();
//            },
//          ),
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
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  //SizedBox(height: 10.0),
                  // Profile images Section
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(children: <Widget>[
                      _buildCoverImage(),
                      _buildProfileImage(),
                    ]),
                  ),
                  _buildFullName(),
                  _buildStatContainer(),
                  _buildBio(context),
                  Divider(),
                  _buildGetInTouch(context),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8),
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
                            myhint = 'Search User\'s Listings!!!';
                            TextEditingController().clear();
                            clearTextInput();
                            //MyDataOperations().newSortedItemList.clear();
                            // this get all Item LIST from DB // iterate as each Item
                            //await MyDataOperations().listItemForEach(MyData().getDbData());
                            //await MyDataOperations().listItemForEach(_allDBProductList);

                            // this get only All USER Item LIST
                            List allDBProductList = await MyData().getDbData();
//                            print (allDBProductList.toString());
//                            print(widget.loginUser);

                            // this get only searched USER Item LIST from All USER Item LIST
                            List allUserDBProductList = await MyDataOperations()
                                .listUserItemForEach(
                                    allDBProductList, widget.otherUser);
                            // this get ExcludeUSER Item LIST from All USER Item LIST
                            List allExcludeUserDBProductList =
                                await MyDataOperations()
                                    .listExcludeUserItemForEach(
                                        allDBProductList, widget.otherUser);

                            //this get only filter item from login  USER Item LIST
                            List sortUserDBProductList =
                                await MyDataOperations().sortUserItemForEach(
                                    allUserDBProductList, val);

                            //this get only filter item from EXCLUDEUSER Item LIST for RELATED ITEM display
                            List sortExcludeUserDBProductList =
                                await MyDataOperations()
                                    .sortExcludeUserItemForEach(
                                        allExcludeUserDBProductList, val);

                            //NULL All the MASTER LIST // ALLOW only Filter list to display
                            allDBProductList.clear();
                            allUserDBProductList.clear();
                            allExcludeUserDBProductList.clear();

                            Navigator.of(context).pop();
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new StateOthersProfile(
                                      otherUser: widget.otherUser,
                                      userItemList: sortUserDBProductList,
                                    )));
                            setState(() {
                              myhint =
                                  'Search My Listings!!!'; // search bar clear
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 20,
                      child: Row(
                        children: [
                          Text(
                            '${countUserItems} Item\(s\)',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
//                          InkWell(
//                            onTap: () {
//                              Navigator.of(context).push(new MaterialPageRoute(
//                                  builder: (BuildContext context) =>
//                                      ExpandAll()));
//                            },
//                            child: Text(
//                              'Explore',
//                              overflow: TextOverflow.ellipsis,
//                              style: TextStyle(fontWeight: FontWeight.bold),
//                            ),
//                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // ONLY USER ITEMS
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
                        uid_name: allUserDBProductList[index]['uid_name'],
                        prod_name: allUserDBProductList[index]['prod_name'],
                        prod_desc: allUserDBProductList[index]['prod_desc'],
                        uid_location: allUserDBProductList[index]
                            ['uid_location'],
                        prod_price: allUserDBProductList[index]['prod_price'],
                        prod_picture: allUserDBProductList[index]
                            ['prod_picture']);
                  },

                  /// Set childCount to limit no.of items // always defined bottom
                  //childCount: 100,
                  childCount: allUserDBProductList.length,
                )),
            SliverList(
              delegate: SliverChildListDelegate([
                Divider(),
                // show other user Related Items
                Padding(
                  padding: EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 8.0),
                  child: Text(
                    'Related Items',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
            ),
            // OTHER USERS RELATED ITEM LIST
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
                        uid_name: widget.dbProductList[index]['uid_name'],
                        prod_name: widget.dbProductList[index]['prod_name'],
                        prod_desc: widget.dbProductList[index]['prod_desc'],
                        uid_location: widget.dbProductList[index]
                            ['uid_location'],
                        prod_price: widget.dbProductList[index]['prod_price'],
                        prod_picture: widget.dbProductList[index]
                            ['prod_picture']);
                  },

                  /// Set childCount to limit no.of items // always defined bottom
                  //childCount: 100,
                  childCount: widget.dbProductList.length,
                )),
          ],
        ),
      ),
    );
  }
}
