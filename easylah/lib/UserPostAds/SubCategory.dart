

import 'package:easylah/MyInheritedWidget/StateContainer.dart';
import 'package:flutter/material.dart';




class SubCategory extends StatefulWidget {
  String mCategory;
  SubCategory({this.mCategory});

  @override
  _SubCategoryState createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {

  String subItem = 'initi';
//List <String> mSubCategory = ['Home & Services','Fashion','Health Stuffs','Mobile & Accessories',
//    'Electricals & Electronics','Games & Hobbies','Vehicles',
//    'Property','Jobs','Others'];

  List<String> getSubCategory(String variable_expression){
    print (widget.mCategory);

    switch(variable_expression) {
      case 'Home & Services': {
        // statements;
        List <String> mSubCategory = ['Cooking & Baking','Furnitures','Kitchenware','TV Entertainments','Cleaning services',
          'Home Tutions','Kids Play Items','Gardening','Crafts Decorations'];
        return mSubCategory;
      }
      break;

      case 'Fashion': {
        //statements;
        List <String> mSubCategory = ['Men\'s Watches','Women\'s Watches','Men\'s Footware','Women\'s Footware',
          'Men\'s bags & wallets','Women\'s bags & wallets','Men\'s Clothes','Women\'s Clothes','Luxury Accessories',
          'Other Accessories'];
        return mSubCategory;
      }
      break;
      case 'Health & Beauty': {
        //statements;
        List <String> mSubCategory = ['Health check Gadgets','Visual & Hearing Aids','Physical Support devices',
          'Child care','Body care','Skin care','Hair care','Make up & Grooming','Perfumes & Deodorants','Others'];
        return mSubCategory;
      }
      break;
      case 'Mobile & Accessories': {
        //statements;
        List <String> mSubCategory = ['IPhone','Android Phones','Ipad & Android Tab',
          'Mobile Accessories','Others'];
        return mSubCategory;
      }
      break;
      case 'Electricals & Electronics': {
        //statements;
        List <String> mSubCategory = ['Computer and Laptops','Electronics Gadgets','Air Con Services',
          'Electrical Services','Others'];
        return mSubCategory;
      }
      break;
      case 'Games & Hobbies': {
        //statements;
        List <String> mSubCategory = ['Camera and Lens','Drones','Photography Accessories',
          'Music Instruments','Dance Music yoga Classes','Gaming','Art and Crafts','Sports and Fitness','Pets'];
        return mSubCategory;
      }
      break;
      case 'Tours and Travels': {
        //statements;
        List <String> mSubCategory = ['Tour Attractions Tickets','Tour Guide Services','Tour Packages',
          'Others'];
        return mSubCategory;
      }
      break;
      case 'Vehicles': {
        //statements;
        List <String> mSubCategory = ['Cars Rental','Cars for sale','Bike Rental',
          'Bike for sale','Other Vehicle Rental','Other Vehicle for sale','Car Accessories','Bike Accessories',
          'Others Accessories'];
        return mSubCategory;
      }
      break;
      case 'Property': {
        //statements;
        List <String> mSubCategory = ['HDB for sale','HDB for rent','Condo for sale',
          'Condo for rent','Rooms Rental','Other Property sale','Other Property rental'];
        return mSubCategory;
      }
      break;
      case 'Jobs': {
        //statements;
        List <String> mSubCategory = ['Part time Jobs','Admin Jobs','IT Software',
          'Sales Retail','Transport Delivery','Engineering Jobs','Other Jobs'];
        return mSubCategory;
      }
      break;


      default: {
        List <String> mSubCategory = ['All Listings'];
        return mSubCategory;
      }
      break;
    }
  }

  List<String> mSubCategory ;
  String name;
  String selectedSubItem;

  validateAndSave(String mainCat , String SubCat) {

    final container = StateContainer.of(context);
    if (mainCat != null && SubCat != null)  {

      container.updateUser(mname: mainCat,sname:SubCat);
      print (mainCat);
      print (SubCat);
      Navigator.pop(context);
      //Navigator.pop(context);

      // back to post image page
      //Navigator.of(context).popUntil(ModalRoute.withName("/postads"));
      //Navigator.popUntil(context, ModalRoute.withName("/postads"));
      // Navigator.popUntil(context, ModalRoute.withName('/postads'));
      //Navigator.of(context).pushNamedAndRemoveUntil('/postads', (Route<dynamic> route) => false);



    } else {
      print("Validation Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    mSubCategory = getSubCategory(widget.mCategory);

    return Scaffold(

      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.pink),
        centerTitle: true,
        //backgroundColor: Colors.pink,
        backgroundColor: Colors.white,
        title: Text(widget.mCategory,
          textAlign: TextAlign.center,
          style: TextStyle(
            //fontWeight: FontWeight.bold,
              color: Colors.pink),
        ),
      ),
      body: ListView.builder(

        // Let the ListView know how many items it needs to build.
        itemCount: mSubCategory.length,
        // Provide a builder function. This is where the magic happens.
        // Convert each item into a widget based on the type of item it is.
        itemBuilder: (context, index) {
          // subItem = mSubCategory[index] ;

          return InkWell(
            onTap: () {
//              print('inside subcat');
//              print(index);
//              print(mSubCategory[index]);
//              print(subItem);
              validateAndSave(widget.mCategory,mSubCategory[index]);
            },
            child: ListTile(
              title: Text(mSubCategory[index]),
//              trailing: Icon(Icons.arrow_forward_ios,
//              ),

              //subtitle: item.buildSubtitle(context),
            ),
          );
        },
      ),
    );
  }
}

