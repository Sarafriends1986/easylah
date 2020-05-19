import 'package:easylah/Models/User.dart';
import 'package:easylah/MyInheritedWidget/StateContainer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Auth change user stream
  Stream<User> get user {
    return _firebaseAuth.onAuthStateChanged.map((FirebaseUser firebaseUser) =>
        _userFromFirebaseUser(firebaseUser: firebaseUser));
  }

// Sign In  with Email and Password
  Future signInWithEmailAndPassword({email, password}) async {
    try {
      AuthResult authResult = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser firebaseUser = authResult.user;
      //print('inside auth srv $firebaseUser');

      return _userFromFirebaseUser(firebaseUser: firebaseUser);
    } catch (e) {
      //print('inside catch auth srv');
      print(e.toString());
      if (e.toString().contains('ERROR_INVALID_EMAIL')) {
        return 'ERROR_INVALID_EMAIL';
      }
      if (e.toString().contains('ERROR_USER_NOT_FOUND')) {
        return 'ERROR_USER_NOT_FOUND';
      }
      if (e.toString().contains('ERROR_WRONG_PASSWORD')) {
        return 'ERROR_WRONG_PASSWORD';
      }
    }
  }

  // Sign in with Google
  Future signInWithGoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount account = await googleSignIn.signIn();
      if(account == null ) {
        //print('inside google account ---------- $account');
        return false;

      }
        AuthResult result = await _firebaseAuth.signInWithCredential(
            GoogleAuthProvider.getCredential(
              idToken: (await account.authentication).idToken,
              accessToken: (await account.authentication).accessToken,
            ));
      //print('inside google result.user ---------- ${result.user}');
      if(result.user == null) {
        return false;
      }else {
        await _userFromFirebaseUser(firebaseUser: result.user);
        return true;
        }
    } catch (e) {
      print(e.toString());
      if (e.toString().contains('ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL')) {
        return 'ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL';
      }
    }
  }

  // Sign Up with Facebook
  Future signUpWithFacebook() async{
    try {
      var facebookLogin = new FacebookLogin();
      var result = await facebookLogin.logIn(['email']);
      print('inside FB result ---------- ${result.toString()}');

      if(result.status == FacebookLoginStatus.loggedIn) {
        final AuthCredential credential = FacebookAuthProvider.getCredential(
          accessToken: result.accessToken.token,
        );
        print('inside FB result.status ---------- ${result.status }');

        final FirebaseUser firebaseUser = (await FirebaseAuth.instance.signInWithCredential(credential)).user;
        if(firebaseUser == null) {
          return false;
        }else {
          await _userFromFirebaseUser(firebaseUser: firebaseUser);
          return true;
        }


      }
    }catch (e) {
      print(e.toString());
      if (e.toString().contains('ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL')) {
        return 'ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL';
      }
    }
  }

 // Register with Email and Password
  Future registerWithEmailAndPassword({userName, email, password}) async {
    try {
      //create user in firebase authentication section.
      AuthResult authResult = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser firebaseUser = authResult.user;

      //await DatabaseService(uid: firebaseUser.uid).updateUserData(sugar: '0', name: userName, strength: 100);
      //print('inside auth srv $firebaseUser');
      return _userFromFirebaseUser(firebaseUser: firebaseUser);
    } catch (e) {
      print(e.toString());
      if (e.toString().contains('ERROR_INVALID_EMAIL')) {
        return 'ERROR_INVALID_EMAIL';
      }
      if (e.toString().contains('ERROR_EMAIL_ALREADY_IN_USE')) {
        return 'ERROR_EMAIL_ALREADY_IN_USE';
      }
      return 'Unknown Error';
    }
  }


  // Logout SignOut
  Future logOut() async {
    try {
      //print('logging out${_firebaseAuth.signOut()}');
      return await _firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Create User object from Firebase user
  User _userFromFirebaseUser({FirebaseUser firebaseUser}) {
    if (firebaseUser == null) {
      return null;
    } else {
      User user = User(uid: firebaseUser.uid, email: firebaseUser.email);

      return user;
    }
  }
}
