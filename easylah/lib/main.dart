import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import 'Home/AuthService.dart';
import 'Home/HomePage.dart';
import 'Models/User.dart';
import 'MyInheritedWidget/StateContainer.dart';
import 'UserPostAds/PickIMyImages.dart';
import 'Wrapper.dart';

void main() {
  runApp(StateContainer(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
    value: AuthService().user,
    child: MaterialApp(
    routes: {

        '/postads': (context) => PickMyImages(),
        '/homepage': (context) => Wrapper(),
//          '/subcat': (context) => SubCategory(mCategory: 'Home',),
        //'/homepage': (context) => Chat(loginUser: 'Sara1986'),
        //'/homepage': (context) => HomePage1(),

      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            color: Colors.pink
        ),
        backgroundColor: Colors.white,
        // primaryColor: Colors.grey,
      ),
      title: "Easylah App",
      home: Wrapper(),
      //home: MyProfile(user: user),
      //home: DbTest(user: user),
    ),
    );
  }
}
