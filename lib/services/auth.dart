import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthResult {
  //Firebase.initializeApp();
  final GoogleSignIn googleSignIn = GoogleSignIn();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> registerWithEmail(String email, String password) async {
    // await Firebase.initializeApp();
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      if (user != null) {
        print(user.displayName);
        return true;
      } else
        return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> signWithEmail(String email, String password) async {
    // await Firebase.initializeApp();
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      if (user != null) {
        print(user.email);
        return true;
      } else
        return false;
    } catch (e) {
      return false;
    }
  }

  Future<void> logOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Error Logging Out');
    }
  }

  Future<User> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await googleSignIn.signIn();
      // if (googleUser == null) return ;
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;
      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      final User user = userCredential.user;
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);
      final User currentUser = _auth.currentUser;
      assert(currentUser.uid == user.uid);

      // if (usercredential == null) return false;
      // return true;
      print(user.displayName);
      return user;
    } catch (e) {
      print('Error $e logging with goggle');
    }
    //return  userCredential;
  }
}
