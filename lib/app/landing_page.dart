import 'package:app_time_tracker/app/sign_in/sign_in_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Firebase _user;
  @override
  Widget build(BuildContext context) {
    if(_user == null)
      return SignInPage();
    return Container(); // temporary placeholder for HomePage
  }
}
