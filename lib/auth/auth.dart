import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  final _google = GoogleSignIn();

  static Future signInAnonymous() async {
    try {
      UserCredential resutl = await _auth.signInAnonymously();
      User user = resutl.user;

      return user;
    } catch (e) {
      return null;
    }
  }

  static Future<User> signInWithGoogle() async {
    final _google = GoogleSignIn();
    GoogleSignInAccount googleAccount = await _google.signIn();
    GoogleSignInAuthentication googleAuth = await googleAccount.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );

    UserCredential result = await _auth.signInWithCredential(credential);

    User _user = result.user;

    assert(!_user.isAnonymous);
    assert(await _user.getIdToken() != null);
    User currentUser = await _auth.currentUser;
    assert(_user.uid == currentUser.uid);

    print("User Name : ${_user.displayName}");
    print("User Email : ${_user.email}");
  }

  // Future handleGoogleSignIn() async {
  //   final GoogleSignInAccount googleUser = await google.signIn();
  //   final GoogleSignInAuthentication googleAuth =
  //       await googleUser.authentication;
  //   final AuthCredential credential = GoogleAuthProvider.credential(
  //     idToken: googleAuth.idToken,
  //     accessToken: googleAuth.accessToken,
  //   );
  //   final User user = (await _aut.signInWithCredential(credential)).user;

  //   if (user != null) {
  //     print(user.providerData[1].displayName);
  //   }
  // }

  static Future<User> signUp(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User user = result.user;

      return user;
    } catch (e) {
      print("LOG : " + e.toString());
      return null;
    }
  }

  static Future<User> sigIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      User user = result.user;

      return user;
    } catch (e) {
      print("LOG : " + e.toString());
      return null;
    }
  }

  static Future<void> signOut() async {
    _auth.signOut();
  }

  static Stream<User> get userStream => _auth.authStateChanges();
}
