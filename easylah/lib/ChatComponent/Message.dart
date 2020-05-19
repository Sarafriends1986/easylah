import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final String from;
  final String text;
  final bool me;
  final String msgDate;

  const Message({Key key, this.from, this.text, this.me,this.msgDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: Column(
          crossAxisAlignment:
          me ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              from,
              style: TextStyle(fontSize: 10),
            ),
            Material(
              color: me ? Colors.pink[50] : Colors.lightBlue[50],
              borderRadius: BorderRadius.circular(10.0),
              elevation: 6.0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                child: Text(
                  text,
                ),
              ),
            ),
            SizedBox(height: 6,),
            Text(
              msgDate,
              style: TextStyle(fontSize: 8),
            ),
          ],
        ),
      ),
    );
  }
}