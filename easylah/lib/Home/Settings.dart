import 'package:easylah/Database/MyData.dart';
import 'package:flutter/material.dart';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class Settings extends StatefulWidget {
  final String uname;
  final String phone;
  final String email;
  final String gender;
  final String dob;

  Settings({this.uname, this.phone, this.email, this.gender, this.dob});

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<DropdownMenuItem<String>> myDropItem = [];
  String genderHint = 'Enter Gender';
  DateTime _dateTime = DateTime.now();
  void fetchDropdownMenuItem() {
    myDropItem.clear();
    List<String> myGenderList = MyData().getGenderList();
    myGenderList.forEach((element) {
      myDropItem.add(DropdownMenuItem<String>(
        child: Text(element.toString()),
        value: element.toString(),
      ));
    });
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void callback() {
    if (nameController.text.length > 0) {
      print(nameController.text.toString());
    }
    if (phoneController.text.length > 0) {
      print(phoneController.text.toString());
    }
    if (emailController.text.length > 0) {
      print(emailController.text.toString());
    }
    if (genderHint == 'male' || genderHint == 'female') {
      print(genderHint);
    }
    if (_dateTime != null) {
      print(_dateTime.toString().split(' ').first);
    }
  }

  @override
  Widget build(BuildContext context) {
    fetchDropdownMenuItem();
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.pink),
        centerTitle: true,
        //backgroundColor: Colors.pink,
        backgroundColor: Colors.white,
        title: Text(
          'Settings',
          textAlign: TextAlign.center,
          style: TextStyle(
              //fontWeight: FontWeight.bold,
              color: Colors.pink),
        ),

        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.save,
              color: Colors.pinkAccent,
              //color: Colors.white,
            ),
            onPressed: () {
              print('Update DB');
              callback();
              Navigator.of(context).pop();
              //print(HomePage().loginUser);
//                Navigator.of(context).pushNamedAndRemoveUntil(
//                    '/homepage', (Route<dynamic> route) => false);
              //Navigator.of(context).canPop();
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          new ListTile(
            leading: const Icon(Icons.person),
            title: new TextField(
              textInputAction: TextInputAction.none,
              keyboardType: TextInputType.text,
              maxLines: null,
              controller: nameController,
              decoration: new InputDecoration(
                hintText: widget.uname != null ? widget.uname : "Name",
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.phone),
            title: new TextField(
              textInputAction: TextInputAction.none,
              keyboardType: TextInputType.phone,
              maxLines: null,
              controller: phoneController,
              decoration: new InputDecoration(
                hintText: widget.phone != null ? widget.phone : "Phone",
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.email),
            title: new TextField(
              textInputAction: TextInputAction.none,
              keyboardType: TextInputType.emailAddress,
              maxLines: null,
              controller: emailController,
              decoration: new InputDecoration(
                hintText: widget.email != null ? widget.email : "Email",
              ),
            ),
          ),
          const Divider(
            height: 1.0,
          ),

          Container(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: DropdownButton(
                      hint: Text(
                        widget.gender != null ? widget.gender : 'Gender',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      items: myDropItem,
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          genderHint = value;
                        });
                      }),
                ),
              ],
            ),
          ),
//            new ListTile(
//              leading: const Icon(Icons.label),
//              title: const Text('Nick'),
//              subtitle: const Text('None'),
//            ),
          new ListTile(
            leading: const Icon(Icons.today),
            title: Theme(
              data: ThemeData(
                  splashColor: Colors.pink,
                  buttonColor: Colors.pink,
                  canvasColor: Colors.pink,
              cardColor: Colors.pink,
                primaryColor: Colors.pink,
                accentColor: Colors.pink,
              ),
              child: InkWell(
                  onTap: () {
                    showDatePicker(
                            context: context,
                            initialDate:
                                _dateTime == null ? DateTime.now() : _dateTime,
                            firstDate: DateTime(1970),
                            lastDate: DateTime(2021))
                        .then((date) {
                      setState(() {
                        _dateTime = date;
                      });
                    });
                  },
                  child: Text('Birthday')),
            ),
            subtitle: Text(_dateTime == null
                ? 'Set DOB'
                : DateFormat.yMMMd().format(_dateTime)),
          ),

//            new ListTile(
//              leading: const Icon(Icons.group),
//              title: const Text('Contact group'),
//              subtitle: const Text('Not specified'),
//            )
        ],
      ),
    );
  }
}
