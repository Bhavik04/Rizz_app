import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:rizz/db/modals/user.dart';
import 'package:rizz/db/services/database_service.dart';
import 'package:rizz/objectbox.g.dart';
import 'package:rizz/services/auth_service.dart';

@singleton
class ChatService {
  List<AppUser> getChatRooms(){
    DatabaseService databaseService = GetIt.instance.get<DatabaseService>();
    Store store = databaseService.getStore()!;
    List<AppUser> users=store
        .box<AppUser>()
        .query(AppUser_.uId.notEquals(AuthService().currentUser!.uid))
        .build()
        .find();
     return users;
  }
}