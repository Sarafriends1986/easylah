import 'package:easylah/MyInheritedWidget/StateContainer.dart';
import 'package:easylah/Utilities/Loading.dart';

import 'package:flutter/material.dart';


import 'dart:async';

import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

import 'MainCategory.dart';
import 'ModelCatergory.dart';

class PickMyImages extends StatefulWidget {
  @override
  _PickMyImagesState createState() => new _PickMyImagesState();
}

class _PickMyImagesState extends State<PickMyImages> {
  List<Asset> images = List<Asset>();
  String _error = ' ';
  String _postError = ' ';

  @override
  void initState() {
    super.initState();
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 5,
      scrollDirection: Axis.vertical,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: AssetThumb(
            asset: asset,
            width: 300,
            height: 300,
          ),
        );
      }),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
//    String error = 'No Error Dectected';
    String error = '';
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 10,
        enableCamera: true,
        selectedAssets: images,

//       cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
//        materialOptions: MaterialOptions(
//          actionBarColor: "#abcdef",
//          actionBarTitle: "Example App",
//          allViewTitle: "All Photos",
//          useDetailsView: true,
//          selectCircleStrokeColor: "#000000",
//        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
    setState(() {
      images = resultList;
      _error = error;
    });
  }

//  Widget fnProductName = SizedBox(
//    height: 1,
//  );
//  Widget fnProductNameContent = SizedBox(
//    height: 1,
//  );
//  Widget fnItemOrServiceName = SizedBox(
//    height: 1,
//  );
//  Widget fnItemOrServiceNameContent = SizedBox(
//    height: 1,
//  );
//  Widget fnPriceOrRentName = SizedBox(
//    height: 1,
//  );
//  Widget fnPriceOrRentNameContent = SizedBox(
//    height: 1,
//  );
//  Widget fnLocationName = SizedBox(
//    height: 1,
//  );
//  Widget fnLocationNameContent = SizedBox(
//    height: 1,
//  );
//  Widget fnDescriptionName = SizedBox(
//    height: 1,
//  );
//  Widget fnDescriptionNameContent = SizedBox(
//    height: 1,
//  );

  Widget fnProductName = Text(' ');
  Widget fnProductNameContent = Text(' ');
  Widget fnItemOrServiceName = Text(' ');
  Widget fnItemOrServiceNameContent = Text(' ');
  Widget fnPriceOrRentName = Text(' ');
  Widget fnPriceOrRentNameContent = Text(' ');
  Widget fnLocationName = Text(' ');
  Widget fnLocationNameContent = Text(' ');
  Widget fnDescriptionName = Text(' ');
  Widget fnDescriptionNameContent = Text(' ');

  BottomAppBar myBottomNavigationBar = BottomAppBar();

  void imagesOnSubmit() {
    List<Asset> myImageList = images;
    myImageList.forEach((element) {
      print(element.name.toString());
      print(element.identifier.toString());
    });

    print(prodNameController);
    print(itemRadioSelected);
    print(jobRadioIndustrySelected);
    print(jobRadioLevelSelected);
    print(vehicleRadioRentalSelected);
    print(vehicleRadioTypeSelected);
    print(propertyRadioRentalSelected);
    print(propertyRadioTypeSelected);
    print(propertyRadioRoomsSelected);
    print(priceNameController);
    print(locationNameController);
    print(descriptionNameController);

    print('report pressed');
    Navigator.of(context).pop();
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Successfully Posted'),
          );
        });

  }

  String radioSelected = 'Others';
  Future<void> callback() async {
    print(radioSelected);
    print('write to DB');
  }

  //TextEditingController nameController = TextEditingController();
  TextEditingController prodNameController = TextEditingController();
  String itemRadioSelected = 'Others';
  String jobRadioIndustrySelected = 'Others';
  String jobRadioLevelSelected = 'Others';
  String vehicleRadioRentalSelected = 'Others';
  String vehicleRadioTypeSelected = 'Others';
  String propertyRadioRentalSelected = 'Others';
  String propertyRadioTypeSelected = 'Others';
  String propertyRadioRoomsSelected = 'Others';
  TextEditingController priceNameController = TextEditingController();
  TextEditingController locationNameController = TextEditingController();
  TextEditingController descriptionNameController = TextEditingController();

//  final nameHolder = TextEditingController();
//  clearTextInput() {
//    nameHolder.clear();
//  }

  //String myDescHint = 'Write a Review in < 50 Words...';

  //String radioBlockSelected = 'none';

//  Future<void> callbacktext() async {
//    if (nameController.text.length > 0) {
//      var msgEnter = {
//        'text': nameController.text,
//        'from': widget.loginUser,
//        'date': DateTime.now().toIso8601String().toString(),
//      };
//      print(msgEnter.toString());
//      print(radioBlockSelected);
//      print(radioSelected);
//      nameController.clear();
//    }
//  }

  // TEMPLATE Widget for all

  Widget _myBottomApp() {
    return BottomAppBar(
        color: Colors.white,
        child: Container(
          height: 80,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(120.0, 20, 120, 20),
            child: InkWell(
              onTap: () {

               //

               // callback();
               // callbacktext();
                imagesOnSubmit();
              },
              child: Container(
                height: 40.0,
                //width: 60,
                decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(6.0)),
                child: Center(
                  child: Text(
                    "POST",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }


//================================================
  // DEFAULT ITEM NAME
  Widget wProductNameTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
      child: Text(
        'Product Name',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget wProductNameContent() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
      child: TextField(
        textInputAction: TextInputAction.none,
        keyboardType: TextInputType.emailAddress,
        maxLines: null,
        controller: prodNameController,
        decoration: new InputDecoration(
          hintText: "Enter Name of the Item...",
        ),
      ),
    );
  }

  // DEFAULT ITEM  Dynamic FORM
  Widget wItemDynamicTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
      child: Text(
        'Item or Service',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget wItemOrServiceDynamicContent() {
    return RadioButtonGroup(
      labels: [
        "New Item",
        "Used Item",
        "Service",
      ],
      disabled: [
        //"None"
      ],
      onChange: (String label, int index) =>
          print("label: $label index: $index"),
      onSelected: (String label) {
        print(label);
        setState(() {
          itemRadioSelected = label;
        });
      },
    );
  }

  // DEFAULT ITEM PRICE
  Widget wItemPriceTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
      child: Text(
        'Price in SGD \$',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget wItemPriceContent() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
      child: TextField(
        textInputAction: TextInputAction.none,
        keyboardType: TextInputType.number,
        maxLines: null,
        controller: priceNameController,
        decoration: new InputDecoration(
          hintText: "Enter Price of the Item...",
        ),
      ),
    );
  }

// ALL Location
  Widget wAllLocationTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8,0,0,0),
      child: Text(
        'Location',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget wAllLocationContent() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8,0,8,0),
      child: TextField(
        textInputAction: TextInputAction.none,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        controller: locationNameController,
        decoration: new InputDecoration(
          hintText: "Enter Postal Code or Full Address...",
        ),
      ),
    );
  }

// ALL Description
  Widget wAllDescriptionTitle() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        'Description',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget wAllDescriptionContent() {
    return Container(
      margin: EdgeInsets.all(8.0),
      // hack textfield height
      padding: EdgeInsets.only(bottom: 0.0),
//                    height: 40,
//                    width: 320,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
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
        textInputAction: TextInputAction.newline,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        controller: descriptionNameController,
        minLines: 3,
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'OpenSans',
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.fromLTRB(20, 4, 0, 8),
//                        prefixIcon: Icon(
//                          Icons.search,
//                          color: Colors.white,
//                        ),
          hintText: 'Enter Detailed Description ...',
        ),
//                      onChanged: (val) {
//                        print('typed $val');
//                      },
        onSubmitted: (val) async {
          print('submit $val');
          //myhint = 'Feedback...';
          //TextEditingController().clear();
          //clearTextInput();
          //callbacktext();
        },
      ),
    );
  }

  //================================================
  //JOB
  // DEFAULT JOB NAME
  Widget wJobNameTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
      child: Text(
        'Job Title',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget wJobNameContent() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
        child: TextField(
          textInputAction: TextInputAction.none,
          keyboardType: TextInputType.emailAddress,
          maxLines: null,
          controller: prodNameController,
          decoration: new InputDecoration(
            hintText: "Enter Job Title...",
          ),
        ),
      );
  }

  // JOB SALARY
  Widget wJobPriceTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
      child: Text(
        'Salary in SGD \$',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget wJobPriceContent() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
      child: TextField(
        textInputAction: TextInputAction.none,
        keyboardType: TextInputType.number,
        maxLines: null,
        controller: priceNameController,
        decoration: new InputDecoration(
          hintText: "Enter Salary ...",
        ),
      ),
    );
  }

// JOB DYNAMIC FORM
  Widget wJobDynamicTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
      child: Text(
        'Job Designation',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget wJobDynamicContent() {
    return Column(
      children: [
        Text(
          'Industry',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        RadioButtonGroup(
          labels: [
            "IT Software",
            "Engineering",
            "Retail Sales",
            "Admin Jobs",
            "Others"
          ],
          disabled: [
            //"None"
          ],
          onChange: (String label, int index) =>
              print("label: $label index: $index"),
          onSelected: (String label) {
            print(label);
            setState(() {
              jobRadioIndustrySelected = label;
            });
          },
        ),
        Text(
          'Level',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        RadioButtonGroup(
          labels: [
            "Intern",
            "Entry Level",
            "Intermediate Level",
            "Expert Level",
            "Others"
          ],
          disabled: [
            //"None"
          ],
          onChange: (String label, int index) =>
              print("label: $label index: $index"),
          onSelected: (String label) {
            print(label);
            setState(() {
              jobRadioLevelSelected = label;
            });
          },
        ),
      ],
    );
  }

  //================================================
//Property
  // DEFAULT Property NAME
  Widget wPropertyNameTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
      child: Text(
        'Property Name',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget wPropertyNameContent() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
      child: TextField(
        textInputAction: TextInputAction.none,
        keyboardType: TextInputType.emailAddress,
        maxLines: null,
        controller: prodNameController,
        decoration: new InputDecoration(
          hintText: "Enter Property name...",
        ),
      ),
    );
  }

// RENT in SGD
  Widget wPropertyPriceTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
      child: Text(
        'Price in SGD \$',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget wPropertyPriceContent() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
      child: TextField(
        textInputAction: TextInputAction.none,
        keyboardType: TextInputType.number,
        maxLines: null,
        controller: priceNameController,
        decoration: new InputDecoration(
          hintText: "Enter Price or Rent...",
        ),
      ),
    );
  }

//Property Dynamic FORM
  Widget wPropertyDynamicTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
      child: Text(
        'Property Type',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget wPropertyDynamicContent() {
    return Column(
      children: [
        Text(
          'Rent or Sale',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        RadioButtonGroup(
          labels: ["Rent", "Sale"],
          disabled: [
            //"None"
          ],
          onChange: (String label, int index) =>
              print("label: $label index: $index"),
          onSelected: (String label) {
            print(label);
            setState(() {
              propertyRadioRentalSelected = label;
            });
          },
        ),
        Text(
          'Type',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        RadioButtonGroup(
          labels: [
            "Condo",
            "HDB",
            "Executive Condo",
            "Commercial",
            "Landed",
            "Others"
          ],
          disabled: [
            //"None"
          ],
          onChange: (String label, int index) =>
              print("label: $label index: $index"),
          onSelected: (String label) {
            print(label);
            setState(() {
              propertyRadioTypeSelected = label;
            });
          },
        ),
        Text(
          'Rooms Level',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        RadioButtonGroup(
          labels: [
            "Entire Unit",
            "Master Room",
            "Common Room",
            "Utility Room",
            "Others"
          ],
          disabled: [
            //"None"
          ],
          onChange: (String label, int index) =>
              print("label: $label index: $index"),
          onSelected: (String label) {
            print(label);
            setState(() {
              propertyRadioRoomsSelected = label;
            });
          },
        ),
      ],
    );
  }

  //================================================
  //Vehicle Name
  Widget wVehicleNameTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
      child: Text(
        'Vehicle Name',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget wVehicleNameContent() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
      child: TextField(
        textInputAction: TextInputAction.none,
        keyboardType: TextInputType.emailAddress,
        maxLines: null,
        controller: prodNameController,
        decoration: new InputDecoration(
          hintText: "Enter Property name...",
        ),
      ),
    );
  }

// RENT in SGD
  Widget wVehiclePriceTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
      child: Text(
        'Price in SGD \$',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget wVehiclePriceContent() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
      child: TextField(
        textInputAction: TextInputAction.none,
        keyboardType: TextInputType.number,
        maxLines: null,
        controller: priceNameController,
        decoration: new InputDecoration(
          hintText: "Enter Price or Rent...",
        ),
      ),
    );
  }

//Property Dynamic FORM
  Widget wVehicleDynamicTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
      child: Text(
        'Vechicle Type',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget wVehiclesDynamicContent() {
    return Column(
      children: [
        Text(
          'Rental or Sale',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        RadioButtonGroup(
          labels: ["Rental", "Sale"],
          disabled: [
            //"None"
          ],
          onChange: (String label, int index) =>
              print("label: $label index: $index"),
          onSelected: (String label) {
            print(label);
            setState(() {
              vehicleRadioRentalSelected = label;
            });
          },
        ),
        Text(
          'Type',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        RadioButtonGroup(
          labels: ["Car", "Bike", "Van", "Heavy Vehicles", "Others"],
          disabled: [
            //"None"
          ],
          onChange: (String label, int index) =>
              print("label: $label index: $index"),
          onSelected: (String label) {
            print(label);
            setState(() {
              vehicleRadioTypeSelected = label;
            });
          },
        ),
      ],
    );
  }
  //================================================

//  widgetsOnSubmit(String sname){
//    print ('selected Suc cat $sname');
//    fnProductName = wJobNameTitle();
//    fnProductNameContent = wJobNameContent();
//    fnItemOrServiceName = wJobDynamicTitle();
//    fnItemOrServiceNameContent = wJobDynamicContent();
//    fnPriceOrRentName = wJobPriceTitle();
//    fnPriceOrRentNameContent = wJobPriceContent();
//    fnLocationName = wAllLocationTitle();
//    fnLocationNameContent = wAllLocationContent();
//    fnDescriptionName = wAllDescriptionTitle();
//    fnDescriptionNameContent = wAllDescriptionContent();
//
//  }
  String tCategory = 'Select Category >';
  String sCategory = ' ';
  ModelCategory myMCategory = ModelCategory(fnMainCategory: 'Home',fnSubCategory:'home');
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final container = StateContainer.of(context);
//      if(container.modelCategory == null){
//        myMCategory = ModelCategory(fnMainCategory: 'Home',fnSubCategory:'home');
//      }else{myMCategory = container.modelCategory;
//      }
    myMCategory = container.modelCategory;

    return loading
          ? Loading()
          : new MaterialApp(
             home: new Scaffold(
                       appBar: new AppBar(
                      iconTheme: new IconThemeData(color: Colors.pink),
                      centerTitle: true,
                      //backgroundColor: Colors.pink,
                      backgroundColor: Colors.white,
                      title: const Text(
                        'Post Item',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            color: Colors.pink),
                      ),
                    ),
                    body: ListView(
                      children: <Widget>[
                        Divider(),
                        //Images Grid display
                        Container(
                          height: 200,
                          child: buildGridView(),
                        ),

                        Center(
                            child:
            //            Text('Error: $_error')
                                Text(_error)),

            //                RaisedButton(
            //                  child: Text("Pick images"),
            //                  onPressed: loadAssets,
            //                ),
                        InkWell(
                          onTap: () {
                            loadAssets();
                          },
                          child: Container(
                            height: 40.0,
                            //width: 60,

                            decoration: BoxDecoration(
                                border: Border.all(),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6.0)),
                            child: Center(
                              child: Row(
                                children: [
                                  Spacer(),
                                  Icon(
                                    Icons.camera_enhance,
                                    color: Colors.pink,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Add & Replace Images",
                                    style: TextStyle(
                                      color: Colors.pink,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Divider(),
                        InkWell(
                          onTap: () async {
                            print('images');
                            print(images == null ? 'no images found' : images.toString());

                               final result = await Navigator.of(context).push(new MaterialPageRoute(
                                   builder: (BuildContext context) => MainCategory()));


                            // Loop until Category Obj get the data
                               setState(() {
                                loading = true;
                              });

                            while (myMCategory==null){
                              await new Future.delayed(const Duration(seconds : 1));
                              print('inside while loop ');
                            }

                            setState(() {
                              loading = false;
                            });

                            if(myMCategory == null) {
                              setState(() {
                                print('myMCategory is null');
                                sCategory = 'Listing under All Listings';
                                tCategory = 'Change Category >';
                                fnProductName = wProductNameTitle();
                                fnProductNameContent = wProductNameContent();
                                fnItemOrServiceName = wItemDynamicTitle();
                                fnItemOrServiceNameContent =
                                    wItemOrServiceDynamicContent();
                                fnPriceOrRentName = wItemPriceTitle();
                                fnPriceOrRentNameContent = wItemPriceContent();
                                fnLocationName = wAllLocationTitle();
                                fnLocationNameContent = wAllLocationContent();
                                fnDescriptionName = wAllDescriptionTitle();
                                fnDescriptionNameContent = wAllDescriptionContent();
                                myBottomNavigationBar = _myBottomApp();
                              });

                            } else {
                              print('myMCategory is not null');
                            setState(() {
                            tCategory = 'Change Category >';
                            sCategory =
                            'Listing under ${myMCategory.fnMainCategory} > ${myMCategory.fnSubCategory}';
                            myBottomNavigationBar = _myBottomApp();
                            if(myMCategory.fnMainCategory != null) {
                            switch (myMCategory.fnMainCategory) {
                            case 'Vehicles':
                            {
                            // statements;
                            fnProductName = wVehicleNameTitle();
                            fnProductNameContent = wVehicleNameContent();
                            fnItemOrServiceName = wVehicleDynamicTitle();
                            fnItemOrServiceNameContent = wVehiclesDynamicContent();
                            fnPriceOrRentName = wVehiclePriceTitle();
                            fnPriceOrRentNameContent = wVehiclePriceContent();
                            fnLocationName = wAllLocationTitle();
                            fnLocationNameContent = wAllLocationContent();
                            fnDescriptionName = wAllDescriptionTitle();
                            fnDescriptionNameContent = wAllDescriptionContent();

                            if (myMCategory.fnSubCategory.contains('Accessories')) {
                            fnProductName = wProductNameTitle();
                            fnProductNameContent = wProductNameContent();
                            fnItemOrServiceName = wItemDynamicTitle();
                            fnItemOrServiceNameContent =
                            wItemOrServiceDynamicContent();
                            fnPriceOrRentName = wItemPriceTitle();
                            fnPriceOrRentNameContent = wItemPriceContent();
                            fnLocationName = wAllLocationTitle();
                            fnLocationNameContent = wAllLocationContent();
                            fnDescriptionName = wAllDescriptionTitle();
                            fnDescriptionNameContent = wAllDescriptionContent();
                            }
                            //return mSubCategory;
                            }
                            break;
                            case 'Property':
                            {
                            // statements;
                            fnProductName = wPropertyNameTitle();
                            fnProductNameContent = wPropertyNameContent();
                            fnItemOrServiceName = wPropertyDynamicTitle();
                            fnItemOrServiceNameContent = wPropertyDynamicContent();
                            fnPriceOrRentName = wPropertyPriceTitle();
                            fnPriceOrRentNameContent = wPropertyPriceContent();
                            fnLocationName = wAllLocationTitle();
                            fnLocationNameContent = wAllLocationContent();
                            fnDescriptionName = wAllDescriptionTitle();
                            fnDescriptionNameContent = wAllDescriptionContent();
                            //return mSubCategory;
                            }
                            break;
                            case 'Jobs':
                            {
                            // statements;
                            fnProductName = wJobNameTitle();
                            fnProductNameContent = wJobNameContent();
                            fnItemOrServiceName = wJobDynamicTitle();
                            fnItemOrServiceNameContent = wJobDynamicContent();
                            fnPriceOrRentName = wJobPriceTitle();
                            fnPriceOrRentNameContent = wJobPriceContent();
                            fnLocationName = wAllLocationTitle();
                            fnLocationNameContent = wAllLocationContent();
                            fnDescriptionName = wAllDescriptionTitle();
                            fnDescriptionNameContent = wAllDescriptionContent();
                            //return mSubCategory;
                            }
                            break;
                            default:
                            {
                            fnProductName = wProductNameTitle();
                            fnProductNameContent = wProductNameContent();
                            fnItemOrServiceName = wItemDynamicTitle();
                            fnItemOrServiceNameContent =
                            wItemOrServiceDynamicContent();
                            fnPriceOrRentName = wItemPriceTitle();
                            fnPriceOrRentNameContent = wItemPriceContent();
                            fnLocationName = wAllLocationTitle();
                            fnLocationNameContent = wAllLocationContent();
                            fnDescriptionName = wAllDescriptionTitle();
                            fnDescriptionNameContent = wAllDescriptionContent();
                            }
                            break;
                            }
                            }
                            else{
                            fnProductName = wProductNameTitle();
                            fnProductNameContent = wProductNameContent();
                            fnItemOrServiceName = wItemDynamicTitle();
                            fnItemOrServiceNameContent =
                            wItemOrServiceDynamicContent();
                            fnPriceOrRentName = wItemPriceTitle();
                            fnPriceOrRentNameContent = wItemPriceContent();
                            fnLocationName = wAllLocationTitle();
                            fnLocationNameContent = wAllLocationContent();
                            fnDescriptionName = wAllDescriptionTitle();
                            fnDescriptionNameContent = wAllDescriptionContent();
                            }


                            });
                            }
                          },

                          // CATEGORY SELECT // CHANGE Section
                          child: Container(
                            height: 40.0,
                            //width: 60,
                            decoration: BoxDecoration(
                                border: Border.all(),
                                color: Colors.pink,
                                borderRadius: BorderRadius.circular(6.0)),
                            child: Center(
                              child: Text(
                                tCategory,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Selected String From Sub Category
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            sCategory,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        // Product Name
                       fnProductName,
                        fnProductNameContent,
            //            Padding(
            //              padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
            //              child: Text(
            //                'Product Name',
            //                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            //              ),
            //            ),
            //            Padding(
            //              padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
            //              child: TextField(
            //                textInputAction: TextInputAction.none,
            //                keyboardType: TextInputType.emailAddress,
            //                maxLines: null,
            //                controller: prodNameController,
            //                decoration: new InputDecoration(
            //                  hintText: "Enter Name of the Item...",
            //                ),
            //              ),
            //            ),

                        SizedBox(
                          height: 10,
                        ),
                        // ITEM or SERVICE or JOB or PROPERTY // Here Dynamic Widget is loaded
            //            Padding(
            //              padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
            //              child: Text(
            //                'Item or Service',
            //                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            //              ),
            //            ),
                        //myWidgetItemorService,
                        fnItemOrServiceName,
                        fnItemOrServiceNameContent,
                        SizedBox(
                          height: 10,
                        ),

                        //Price in SGD
            //            Padding(
            //              padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
            //              child: Text(
            //                'Price in SGD \$',
            //                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            //              ),
            //            ),
            //            Padding(
            //              padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
            //              child: TextField(
            //                textInputAction: TextInputAction.none,
            //                keyboardType: TextInputType.number,
            //                maxLines: null,
            //                controller: priceNameController,
            //                decoration: new InputDecoration(
            //                  hintText: "Enter Price of the Item...",
            //                ),
            //              ),
            //            ),

            //        Padding(
            //          padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
            //          child: Text(
            //            'Salary in SGD \$',
            //            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            //          ),
            //        ),

                        fnPriceOrRentName,
                        fnPriceOrRentNameContent,
                        SizedBox(
                          height: 10,
                        ),
                        //Deal Location
                        fnLocationName,
            //            Padding(
            //              padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
            //              child: TextField(
            //                textInputAction: TextInputAction.none,
            //                keyboardType: TextInputType.multiline,
            //                maxLines: null,
            //                controller: locationNameController,
            //                decoration: new InputDecoration(
            //                  hintText: "Enter Postal Code or Full Address...",
            //                ),
            //              ),
            //            ),
                       fnLocationNameContent,

                        SizedBox(
                          height: 10,
                        ),
                        // Product Description

                        fnDescriptionName,
                        fnDescriptionNameContent,
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                            child:
            //            Text('Error: $_error')
                                Text(_postError))
                      ],
                    ),
                    bottomNavigationBar: myBottomNavigationBar,
                  ),
      );
  }
}
