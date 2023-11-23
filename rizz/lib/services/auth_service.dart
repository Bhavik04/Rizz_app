import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _gUser = GoogleSignIn();

  User? get currentUser => _auth.currentUser;

  bool get isUserLoggedIn => currentUser != null;

  Future<void> signInWithGoogle(
      {required Function(bool) onSignInComplete}) async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await _gUser.signIn();

      if (googleSignInAccount == null) {
        // User canceled the sign-in
        print('User canceled Google sign-in');
        onSignInComplete(false);
        return;
      }

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      await _auth.signInWithCredential(authCredential);

      if (_auth.currentUser != null) {
        // Sign-in successful
        print('User signed in successfully');
        onSignInComplete(true);
      } else {
        // Handle the case where sign-in was not successful
        print('Sign-in not successful');
        onSignInComplete(false);
      }
    } on FirebaseAuthException catch (e) {
      // Handle other FirebaseAuthExceptions
      print(e.message);
      onSignInComplete(false);
    } on Exception catch (e) {
      // Handle other exceptions
      print(e.toString());
      onSignInComplete(false);
    }
  }

  Future<void> signOut() async {
    await _gUser.signOut();
    await _auth.signOut();
  }

  Future<void> deleteUser() async {
    await _auth.currentUser?.delete();
  }
}
