import 'package:rizz/db/services/dbstore.dart';
import 'package:rizz/objectbox.g.dart';

abstract class DatabaseService {
  DBStore dbStore = DBStore();
  Store? _store = null;

  Store? getStore<T>([String boxName = ""]) {
    return _store;
  }

  Future<void> init([String env = "prod", int attemptNumber = 1]) async {
    if (env == "test") {
      _store = await openStore(directory: '/tmp/test/');
    } else {
      try {
        _store = await dbStore.getStore();
      } catch (_) {
        try {
          _store = await openStore();
        } catch (e) {
          print("error opening store: ${e.toString()}");
        }
      }
    }
  }

  void clearOldStoreCache() {
    dbStore.clear();
  }

  void closeStore() {
    dbStore.close();
  }

  void setStore(dynamic storeParam) {
    Store store = storeParam as Store;
    _store = store;
    dbStore.setStore(store);
  }

  Future<void> deleteAllDatabases() => throw UnimplementedError();
}
