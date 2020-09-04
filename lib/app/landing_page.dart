import 'package:app_time_tracker/app/home_page.dart';
import 'package:app_time_tracker/app/sign_in/sign_in_page.dart';
import 'package:flutter/material.dart';

import '../service/auth.dart';

class LandingPage extends StatelessWidget {
  LandingPage({@required this.auth});

  final AuthBase auth;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Account>(
      stream: auth.onAuthStateChange,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Account user = snapshot.data;
          if (user == null)
            return SignInPage(
              auth: auth,
            );
          return HomePage(
            auth: auth,
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
