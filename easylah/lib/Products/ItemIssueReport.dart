import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class ItemIssueReport extends StatefulWidget {
  @override
  _ItemIssueReportState createState() => _ItemIssueReportState();
}

class _ItemIssueReportState extends State<ItemIssueReport> {
//  ScrollController scrollController = ScrollController();
//  TextEditingController nameController = TextEditingController();
//  final nameHolder = TextEditingController();
//  clearTextInput() {
//    nameHolder.clear();
//  }
//
//  String myhint = 'FeedBack in < 50 words ...';
//  String radioSelected = 'Others';
//
//  Future<void> callback() async {
//    if (nameController.text.length > 0) {
//      var msgEnter = {
//        'text': nameController.text,
//        'from': widget.loginUser,
//        'date': DateTime.now().toIso8601String().toString(),
//      };
//      print(msgEnter.toString());
//      print(radioSelected);
//      nameController.clear();
//      scrollController.animateTo(
//        scrollController.position.maxScrollExtent,
//        curve: Curves.easeOut,
//        duration: const Duration(milliseconds: 300),
//      );
//    }
//  }

  String radioSelected = 'Others';
  Future<void> callback() async {
    print(radioSelected);
    print('write to DB');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: new IconThemeData(color: Colors.pink),
          centerTitle: true,
          //backgroundColor: Colors.pink,
          backgroundColor: Colors.white,
          title: Text(
            "Product Issue Report",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.pink),
          ),
        ),
        body: _body(),
        bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            child: Container(
              height: 80,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(120.0, 20, 120, 20),
                child: InkWell(
                  onTap: () {
                    print('report pressed');
                    Navigator.of(context).pop();

                    callback();

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
                        "REPORT",
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
            ))
    );
    //
  }

  Widget _body() {
    return ListView(children: <Widget>[
      Container(
        padding: const EdgeInsets.only(left: 14.0, top: 14.0),
      ),
      RadioButtonGroup(
        labels: [
          "Selling Prohibited Item",
          "Offensive behaviour",
          "Fake Product",
          "Fake Account",
          "None"
        ],
        disabled: [
          //"None"
        ],
        onChange: (String label, int index) =>
            print("label: $label index: $index"),
        onSelected: (String label) {
          print(label);
          setState(() {
            radioSelected = label;
          });
        },
      ),
      //Text comments
//      Padding(
//        padding: const EdgeInsets.fromLTRB(20.0, 4, 20, 4),
//        child: Container(
//          margin: EdgeInsets.all(8.0),
//          // hack textfield height
//          padding: EdgeInsets.only(bottom: 0.0),
////                    height: 40,
////                    width: 320,
//          alignment: Alignment.centerLeft,
//          decoration: BoxDecoration(
//            color: Colors.pink[200],
//            borderRadius: BorderRadius.circular(20.0),
//            boxShadow: [
//              BoxShadow(
//                color: Colors.black12,
//                blurRadius: 10.0,
//                offset: Offset(0, 2),
//              ),
//            ],
//          ),
//          child: TextField(
//            textInputAction: TextInputAction.newline,
//            keyboardType: TextInputType.multiline,
//            maxLines: 6,
//            controller: nameController,
//            minLines: 3,
//            style: TextStyle(
//              color: Colors.white,
//              fontFamily: 'OpenSans',
//            ),
//            decoration: InputDecoration(
//              border: InputBorder.none,
//              contentPadding: EdgeInsets.fromLTRB(20, 4, 0, 8),
////                        prefixIcon: Icon(
////                          Icons.search,
////                          color: Colors.white,
////                        ),
//              hintText: myhint,
//            ),
////                      onChanged: (val) {
////                        print('typed $val');
////                      },
//            onSubmitted: (val) async {
//              print('submit $val');
//              myhint = 'Feedback...';
//              TextEditingController().clear();
//              clearTextInput();
//              callback();
//            },
//          ),
//        ),
//      ),

    ]);
  }
}
