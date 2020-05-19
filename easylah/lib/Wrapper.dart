import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Home/Authenticate.dart';
import 'Home/HomePage.dart';
import 'Models/User.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    //print('from provider $user');
    // return home or authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      //return Home(user: user);
      return HomePage(user: user);
      //return DbTest(user: user);
    }
  }
}
