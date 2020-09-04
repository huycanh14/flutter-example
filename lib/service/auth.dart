import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class Account {
  final String uid;
  Account({@required this.uid});
}

abstract class AuthBase {
  Future<Account> currentUser();
  Future<Account> signInAnonymously();
  Future<void> signOut();
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;
  Account _userFromFirebase(User user){
    if(user == null)
      return null;
    return Account(uid: user.uid);
  }

  Stream<Account> get onAuthStateChange{
    return _firebaseAuth.authStateChanges().asyncMap((firebaseUser) => _userFromFirebase(firebaseUser));
  }

  @override
  Future<Account> currentUser() async {
    final user = _firebaseAuth.currentUser;
    return _userFromFirebase(user);
  }

  @override
  Future<Account> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
