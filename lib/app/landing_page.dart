import 'package:app_time_tracker/app/home_page.dart';
import 'package:app_time_tracker/app/sign_in/sign_in_page.dart';
import 'package:flutter/material.dart';

import '../service/auth.dart';

class LandingPage extends StatefulWidget {
  LandingPage({@required this.auth});
  final AuthBase auth;
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Account _user;

  @override
  void initState() {
    super.initState();
    _checkCurrentUser();
    widget.auth.onAuthStateChange.listen((user) {
      print('user: ${user?.uid}');
    });
  }

  Future<void> _checkCurrentUser() async{
    Account user = await widget.auth.currentUser();
    _updateUser(user);
  }

  void _updateUser(Account user){
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(_user == null)
      return SignInPage(
        auth: widget.auth,
        onSignIn: (user) => _updateUser(user),
      );
    return HomePage(
      auth: widget.auth,
      onSignOut:() => _updateUser(null),
    ); // temporary placeholder for HomePage
  }
}
