import 'package:app_time_tracker/app/home_page.dart';
import 'package:app_time_tracker/app/sign_in/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User _user;

  void _updateUser(User user){
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(_user == null)
      return SignInPage(
        onSignIn: (user) => _updateUser(user),
      );
    return HomePage(
      onSignOut:() => _updateUser(null),
    ); // temporary placeholder for HomePage
  }
}
