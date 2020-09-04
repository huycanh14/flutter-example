import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Account {
  final String uid;

  Account({@required this.uid});
}

abstract class AuthBase {
  Stream<Account> get onAuthStateChange;

  Future<Account> currentUser();

  Future<Account> signInAnonymously();

  Future<void> signOut();

  Future<Account> signInWithGoogle();
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  Account _userFromFirebase(User user) {
    if (user == null) return null;
    return Account(uid: user.uid);
  }

  @override
  Stream<Account> get onAuthStateChange {
    return _firebaseAuth
        .authStateChanges()
        .asyncMap((firebaseUser) => _userFromFirebase(firebaseUser));
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
  Future<Account> signInWithGoogle() async {
    final googleSignIn = new GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        final authResult = await _firebaseAuth.signInWithCredential(
          GoogleAuthProvider.credential(
              idToken: googleAuth.idToken, accessToken: googleAuth.accessToken),
        );
        return _userFromFirebase(authResult.user);
      } else {
        throw PlatformException(
            code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
            message: 'Missing Google Auth Token');
      }
    } else {
      throw PlatformException(
          code: 'ERROR_ABORTED_BY_USER', message: 'Sign in aborted by user');
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
