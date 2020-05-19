import 'package:flutter/material.dart';

import 'LoginScreen.dart';
import 'SignUpScreen.dart';




class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return LoginScreen(fnToggleView: toggleView);
    } else {
      return SignUpScreen(fnToggleView: toggleView);
    }
  }
}
