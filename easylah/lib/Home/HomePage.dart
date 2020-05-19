
import 'package:carousel_pro/carousel_pro.dart';
import 'package:easylah/ChatComponent/ChatHistory.dart';
import 'package:easylah/Database/MyData.dart';
import 'package:easylah/Database/MyDataOperations.dart';
import 'package:easylah/Favourites/FavouritesList.dart';
import 'package:easylah/Models/User.dart';
import 'package:easylah/Orders/PlacedOrders.dart';
import 'package:easylah/Orders/ReceivedOrders.dart';
import 'package:easylah/Products/ExpandAll.dart';
import 'package:easylah/Products/HorizontalListView.dart';
import 'package:easylah/Products/SingleProduct.dart';
import 'package:easylah/UserPostAds/PickIMyImages.dart';
import 'package:easylah/MyInheritedWidget/StateContainer.dart';


//import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AuthService.dart';
import 'Settings.dart';
import 'StateMyProfile.dart';


class HomePage extends StatefulWidget {
  User user = User();
  HomePage({this.user});

   @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String loginUser = '';

 // @override
//  void initState() {
//    super.initState();
//    _incrementStartup();
//  }
  /// Will get the startupnumber from shared_preferences
  /// will return 0 if null
//  Future<String> _getStringFromSharedPref() async {
//    final prefs = await SharedPreferences.getInstance();
//
//    final myuser = prefs.getString('loginUser');
//    print ('perfs ================== called ${myuser}');
//    if (myuser == null) {
//      return 'No value user';
//    }
//    return myuser;
//
//
//  }

  /// Will Increment the startup number and store it then
  /// use setState to display in the UI
//  Future<void> _incrementStartup() async {
//    final prefs = await SharedPreferences.getInstance();
//
//    String meraUser = await _getStringFromSharedPref();
//
//
//    await prefs.setString('loginUser', meraUser);
//print ('init ================== called ');
//   print(loginUser);
//   print(meraUser);
//  }

  TextEditingController nameController = TextEditingController();
  final nameHolder = TextEditingController();

  clearTextInput() {
    nameHolder.clear();
  }
  String myhint = 'Search in Home lah!!!';

  String currentProfileImage =
      'https://supermariorun.com/assets/img/hero/hero_chara_mario_update_pc.png';
  final AuthService _authService = AuthService();
  get floatingActionButtonLocation => null;
  // dummy data to avoid error
  List sortDBProductList = [{
    "uid_name": "Dummy",
    "prod_name": "Dummy Home Food",
    "prod_desc": "Dinner",
    "uid_location": "Bishan",
    "prod_price": "25.00",
    "prod_picture": "images/products/food1.jpg",
  },];

  // no need user spec for all items list
  List allDBProductList = MyData().getDbData();

  //Login User Dummy Data
  var myUserData = {
    'uname': 'Sara1986',
    'phone':'+65 91111111',
    'email' : 'sara1986@gmail.com',
    'gender': 'male',
    'dob':  '01-01-1986',
  };

  @override
  Widget build(BuildContext context) {
     final container = StateContainer.of(context);
     container.updateMyUser(uid: widget.user.uid,email:widget.user.email);

    //declare carousel widget for promotions
    Widget image_carousell = new Container(
      height: 200,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/homecooking.jpg'),
          AssetImage('images/repairservices.jpg'),
          AssetImage('images/hometutions.jpg'),
          AssetImage('images/homecraft.jpg'),
          AssetImage('images/homerent.jpg'),
          AssetImage('images/buyandsell.jpg'),
        ],
        autoplay: true,
        dotSize: 4.0,
        indicatorBgPadding: 4.0,
      ),
    );

    return Scaffold(
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
                width: MediaQuery.of(context).size.width/1.3,
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
                    sortDBProductList = await MyDataOperations().sortItemForEach(MyData().getDbData(), val);
                    print(sortDBProductList.toString());
                    setState(() {
                      myhint = 'Search in Home lah!!!'; // search bar clear

                      allDBProductList = sortDBProductList; // sort list is new list to display
                      print(allDBProductList.toString());
                    });
                  },
                ),
              ),
            ),
          ),
          Spacer(),
          // NOTIFICATION  ICON Section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Notification'),
                        );
                      });
                },
                child: Icon(Icons.notifications,color: Colors.pink,)),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(widget.user.uid),
              accountEmail: Text('${widget.user.email}'),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  //backgroundImage: NetworkImage(currentProfileImage),
                  backgroundImage:
                  NetworkImage(currentProfileImage),

                  backgroundColor: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                  //color: Colors.pink,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072823_1280.jpg"),
                      //image: NetworkImage("https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072823_1280.jpg"),
                      fit: BoxFit.cover)),
            ),
            ListTile(
              onTap: () async{
                List allDBProductList = await MyData().getDbData();
                List allUserDBProductList = await MyDataOperations().listUserItemForEach(allDBProductList,widget.user.uid);
                allDBProductList.clear();
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new StateMyProfile(loginUser: widget.user.uid,userItemList: allUserDBProductList,)));
              },
              title: Text('My Profile'),
              leading: Icon(
                Icons.person,
                color: Colors.pink,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>  PlacedOrders()));
              },
              title: Text('Placed Orders'),
              leading: Icon(
                Icons.shopping_basket,
                color: Colors.pink,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>  ReceivedOrders()));
              },
              title: Text('Recieved Orders'),
              leading: Icon(
                Icons.shopping_basket,
                color: Colors.pink,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>  ChatHistory()));
              },
              title: Text('Chats'),
              leading: Icon(
                Icons.chat,
                color: Colors.pink,
              ),
            ),
            ListTile(
              onTap: () {

                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) =>  FavouritesList()));

              },
              title: Text('Favourites'),
              leading: Icon(
                Icons.thumb_up,
                color: Colors.pink,
              ),
            ),
            new Divider(),
            ListTile(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>  Settings(
                      uname: myUserData['uname'],
                      phone: myUserData['phone'],
                      email: myUserData['email'],
                        gender: myUserData['gender'],
                        dob: myUserData['dob'],
                    )));
              },
              title: Text('Settings'),
              leading: Icon(
                Icons.settings,
                color: Colors.pink,
              ),
            ),
            ListTile(
              onTap: () {
                print('Chats');
              },
              title: Text('About'),
              leading: Icon(
                Icons.help,
                color: Colors.pink,
              ),
            ),
            new Divider(),
            ListTile(
              onTap: () async{
                Navigator.pop(context);
                await _authService.logOut();

              },
              title: Text('Log Out'),
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.pink,
              ),
            ),
          ],
        ),
      ),
      body: Stack(children: [
        Container(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(
                  [

                    //HeaderWidget("Header 1"),
                    //SearchBar(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: image_carousell,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8, 0, 0),
                      child: Container(
                        height: 20,
                        child: Text(
                          'Category',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    //BodyWidget(Colors.blue),
                    Divider(),
                    HorizontalListView(),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 20,
                        child: Row(
                          children: [
                            Text(
                              'Recent Items',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ExpandAll()));
                              },
                              child: Text(
                                'Explore',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // HOME Page RECENT ITEM LIST Display
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
                      try{
                        return SingleProduct(
                            uid_name: allDBProductList[index]['uid_name'],
                            prod_name: allDBProductList[index]['prod_name'],
                            prod_desc: allDBProductList[index]['prod_desc'],
                            uid_location: allDBProductList[index]['uid_location'],
                            prod_price: allDBProductList[index]['prod_price'],
                            prod_picture: allDBProductList[index]['prod_picture']);
                      }catch(e){
                        print(e.toString());
                        return SingleProduct(
                          uid_name: "Dummy",
                          prod_name: "Dummy Home Food",
                          prod_desc: "Dinner",
                          uid_location: "Bishan",
                          prod_price: "25.00",
                          prod_picture: "images/products/food1.jpg",);
                      }
                    },

                    /// Set childCount to limit no.of items // always defined bottom
                    //childCount: 100,
                    childCount: allDBProductList.length,
                  )),
            ],
          ),
        ),
        // Floating button to add item
        new Positioned(
            bottom: 20.0,
            right: 20.0,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        PickMyImages()));
//                showDialog(
//                    context: context,
//                    builder: (context) {
//                      return AlertDialog(
//                        title: Text('New Item Post'),
//                      );
//                    });
              },
              child: Icon(
                Icons.add,
                color: Colors.pinkAccent,
                size: 40,
              ),
              backgroundColor: Colors.white,
            ))
      ]),
    );
  }
}








