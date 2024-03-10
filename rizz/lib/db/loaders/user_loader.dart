import 'package:rizz/db/modals/user.dart';
import 'package:rizz/services/auth_service.dart';
import 'package:rizz/services/firestore_service.dart';

class UserLoaderService {
  void load() async {
    var data=
     await FirestoreService().firestore.collection('users').doc(AuthService().currentUser!.uid).get();

      
  }

  toUser(){
    // User(name: name, email: email, snapId: snapId, age: age, gender: gender, imageUrl: imageUrl)
  }
}
