import 'package:flutter/material.dart';

import 'ChatHeader.dart';
import 'Message.dart';
import 'MessageData.dart';




class Chat extends StatefulWidget {
  static const String id = "CHAT";
//  final FirebaseUser user;
  final String loginUser;
  final String uid_name;
  final String prod_name;
  final String prod_desc;
  final String uid_location;
  final String prod_price;
  final String prod_picture;

  const Chat(
      {Key key,
      this.loginUser,
      this.uid_name,
      this.prod_name,
      this.prod_desc,
      this.uid_location,
      this.prod_price,
      this.prod_picture})
      : super(key: key);
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
//  final FirebaseAuth _auth = FirebaseAuth.instance;
//  final Firestore _firestore = Firestore.instance;

  String currentProfileImage =
      'https://supermariorun.com/assets/img/hero/hero_chara_mario_update_pc.png';
  ScrollController scrollController = ScrollController();
  TextEditingController nameController = TextEditingController();
  final nameHolder = TextEditingController();

  clearTextInput() {
    nameHolder.clear();
  }
  String myhint = 'Enter a Message...';

  // add the message to collection db
  Future<void> callback() async {
    if (nameController.text.length > 0) {
//      await _firestore.collection('messages').add({
//        'text': messageController.text,
//        'from': widget.user.email,
//        'date': DateTime.now().toIso8601String().toString(),
//      });
      var msgEnter = {
        'text': nameController.text,
        'from': widget.loginUser,
        'date': DateTime.now().toIso8601String().toString(),
      };
      print(msgEnter.toString());
      nameController.clear();
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),

      );
    }
  }



  List chatMessages = MessageData().getMessageData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: new AppBar(
//        iconTheme: new IconThemeData(color: Colors.pink),
//        centerTitle: true,
//        //backgroundColor: Colors.pink,
//        backgroundColor: Colors.white,
//        title: Text(
//          widget.prod_name,
//          textAlign: TextAlign.center,
//          style: TextStyle(
//            //fontWeight: FontWeight.bold,
//              color: Colors.pink),
//        ),
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(
//              Icons.home,
//              color: Colors.pinkAccent,
//              //color: Colors.white,
//            ),
//            onPressed: () {
//              print('Back to home');
//              print(HomePage().loginUser);
//              Navigator.of(context).pushNamedAndRemoveUntil(
//                  '/homepage', (Route<dynamic> route) => false);
//              //Navigator.of(context).canPop();
//            },
//          )
//        ],
//      ),
      body: Column(
        children: [
          InkWell(
            onTap: (){
              Navigator.of(context).pop();
//              Navigator.of(context).push(new MaterialPageRoute(
//                  builder: (BuildContext context) => new ProductDetails(
//                    uid_name: widget.uid_name,
//                    prod_name: widget.prod_name,
//                    prod_desc: widget.prod_desc,
//                    uid_location: widget.uid_location,
//                    prod_price: widget.prod_price,
//                    prod_picture: widget.prod_picture,
//                  )));
            },
            child: ChatHeader( loginUser:widget.loginUser,
              uid_name: widget.uid_name,
              prod_name: widget.prod_name,
              prod_desc: widget.prod_desc,
              uid_location: widget.uid_location,
              prod_price: widget.prod_price,
              prod_picture: widget.prod_picture,
            ),
          ),
          Expanded(
            child: StreamBuilder(
              builder: (context, snapshot) {
                List<Widget> messages = chatMessages
                    .map((doc) => Message(
                  from: doc['from'],
                  text: doc['text'],
                  me: widget.loginUser == doc['from'],
                  msgDate: doc['date'],
                ))
                    .toList();

                return ListView(
                  controller: scrollController,
                  children: <Widget>[
                    ...messages,
                  ],
                );
              },
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8.0),
                    // hack textfield height
                    padding: EdgeInsets.only(bottom: 0.0),
//                    height: 40,
//                    width: 320,
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
                      textInputAction: TextInputAction.newline,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      controller: nameController,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(20,4,0,8),
//                        prefixIcon: Icon(
//                          Icons.search,
//                          color: Colors.white,
//                        ),
                        hintText: myhint,
                      ),
//                      onChanged: (val) {
//                        print('typed $val');
//                      },
                      onSubmitted: (val) async {
                        print('submit $val');
                        myhint = 'Enter a Message...';
                        TextEditingController().clear();
                        clearTextInput();
                        callback();
                      },
                    ),
                  ),
//                  child: TextField(
//                    onSubmitted: (value) => callback(),
//                    decoration: InputDecoration(
//                      hintText: "Enter a Message...",
//                      //border: const OutlineInputBorder(),
//                      border: InputBorder.none,
//                    ),
//                    controller: messageController,
//                  ),
                ),
                Divider(),
//                SendButton(
//                  text: "Send",
//                  callback: callback,
//                )
                InkWell(
                  onTap: () {
                    callback();
//                    showDialog(
//                        context: context,
//                        builder: (context) {
//                          return AlertDialog(
//                            title: Text('Like'),
//                          );
//                        });
                  },
                  child: Tab(
                    icon: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0,8,12,8),
                      child: Container(
                        child: Image(
                          image: AssetImage(
                            'images/send.png',
                          ),
                          fit: BoxFit.cover,color: Colors.pink,
                        ),
                        height: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
          ),
        );



  }
}

class SendButton extends StatelessWidget {
  final String text;
  final VoidCallback callback;

  const SendButton({Key key, this.text, this.callback}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.orange,
      onPressed: callback,
      child: Text(text),
    );
  }
}
