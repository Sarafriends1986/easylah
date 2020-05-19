import 'package:flutter/material.dart';

import 'SubCategory.dart';


class MainCategory extends StatefulWidget {
  @override
  _MainCategoryState createState() => _MainCategoryState();
}

class _MainCategoryState extends State<MainCategory> {


  List <String> mCategory = ['Home & Services','Fashion','Health & Beauty','Mobile & Accessories',
    'Electricals & Electronics','Games & Hobbies','Tours and Travels','Vehicles',
  'Property','Jobs','Others'];
  String item = 'init';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.pink),
        centerTitle: true,
        //backgroundColor: Colors.pink,
        backgroundColor: Colors.white,
        title: const Text('Category',
          textAlign: TextAlign.center,
          style: TextStyle(
            //fontWeight: FontWeight.bold,
              color: Colors.pink),
        ),
      ),
      body: ListView.builder(
        // Let the ListView know how many items it needs to build.
        itemCount: mCategory.length,
        // Provide a builder function. This is where the magic happens.
        // Convert each item into a widget based on the type of item it is.
        itemBuilder: (context, index) {
           //item = mCategory[index];

          return InkWell(
            onTap: () async {
//              print('inside Category');
//              print(mCategory.length);
//              print(index);
//              print (mCategory[index]);
//              print(item);

              await Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      SubCategory(mCategory: mCategory[index],)));
              Navigator.pop(context, mCategory[index]);
              //Navigator.pop(context);

             // Navigator.of(context).pushNamedAndRemoveUntil('/postads', ModalRoute.withName('/screen1'));
            },
            child: ListTile(
              title: Text(mCategory[index]),
              trailing: Icon(Icons.arrow_forward_ios,
              ),

              //subtitle: item.buildSubtitle(context),
            ),
          );
        },
      ),
    );
  }
}

