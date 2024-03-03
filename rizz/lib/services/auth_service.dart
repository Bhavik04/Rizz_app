import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rizz/services/firestore_service.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _gUser = GoogleSignIn();

  User? get currentUser => _auth.currentUser;

  bool get isUserLoggedIn => currentUser != null;

  Future<void> signInWithGoogle(
      {required Function(bool) onSignInComplete}) async {
    try {
      // Sign out the current user from Google Sign-In
      await _gUser.signOut();

      // Sign out the current user from Firebase Authentication
      await _auth.signOut();

      // Trigger the Google Sign-In process
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

      // Sign in with Firebase using the obtained credentials
      await _auth.signInWithCredential(authCredential);

      // Check if the user is new or existing
      final bool isNewUser =
          await FirestoreService().checkIfNewUser(_auth.currentUser?.uid ?? '');

      // Depending on the user's status, navigate to the appropriate screen
      if (isNewUser) {
        // For a new user, navigate to the UserNameScreen
        print('New user signed in successfully');
        onSignInComplete(true);
      } else {
        // For an existing user, navigate to the PlayScreen
        print('Existing user signed in successfully');
        // Adjust this line based on your navigation logic
        // For example: context.goNamed(PlayScreen.routeName);
        onSignInComplete(true);
      }
    } on FirebaseAuthException catch (e) {
      // Handle FirebaseAuthExceptions
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
