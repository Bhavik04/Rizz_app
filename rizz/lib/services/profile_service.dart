import 'package:rizz/db/modals/user.dart';
import 'package:rizz/db/services/database_service.dart';
import 'package:rizz/services/auth_service.dart';
import 'package:rizz/services/firestore_service.dart';

class ProfileService {
  //  DatabaseService databaseService=DatabaseService();
  Future<User> getUserDetails() async {
    List<User> userList =
        DatabaseService().getStore()!.box<User>().query().build().find();

    if (userList.isNotEmpty) {
      return userList.first;
    }
    return await setUserDetails();
  }

  Future<User> setUserDetails() async {
    final currentUserId = AuthService().currentUser!.uid;
    final userData = await FirestoreService().getUserData(currentUserId);
    User user = User(
        name: userData?["name"],
        email: userData?["email"],
        snapId: userData?["snapId"],
        age: userData?["age"],
        gender: userData?["gender"],
        imageUrl: userData?["photoURL"]);
    DatabaseService().getStore()!.box<User>().put(user);
    return user;
  }
}
