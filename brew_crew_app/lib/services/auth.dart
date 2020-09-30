import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart';
class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create A User Obj Based on FirebaseUser

  User _useFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid ) : null;
  }

  // sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _useFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password


  // register with email and password

  // sign out

}
