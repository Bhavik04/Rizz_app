import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:rizz/db/modals/user.dart';
import 'package:rizz/db/services/database_service.dart';
import 'package:rizz/objectbox.g.dart';

@singleton
class UserServices {
  AppUser getUserByUid(String uId) {
    DatabaseService databaseService = GetIt.instance.get<DatabaseService>();
    Store store = databaseService.getStore()!;
    return store
        .box<AppUser>()
        .query(AppUser_.uId.equals(uId))
        .build()
        .find()
        .first;
  }
}
