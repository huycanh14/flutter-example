import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class Account {
  final String uid;
  Account({@required this.uid});
}

class Auth {
  final _firebaseAuth = FirebaseAuth.instance;
  Account _userFromFirebase(User user){
    if(user == null)
      return null;
    return Account(uid: user.uid);
  }
  Future<Account> currentUser() async {
    final user = _firebaseAuth.currentUser;
    return _userFromFirebase(user);
  }

  Future<Account> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(authResult.user);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
