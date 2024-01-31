import 'package:path_provider/path_provider.dart';
import 'package:rizz/objectbox.g.dart';

class DBStore {
  Store? _store;
  Store? get store => _store;

  // DBStore(this.authState);

  Future<Store> getStore() async {
    if (Admin.isAvailable()) {
      final admin = Admin(_store!);
    }
    String dbName = await getDbPath();
    return _store ??= await openStore(directory: dbName);
  }

  Future<String> getDbPath() async {
    String localDocumentPath =
        ((await getApplicationDocumentsDirectory()).path);
    return '$localDocumentPath/objectBox-rizz';
  }

  void close() {
    _store?.close();
  }

  void clear() {
    _store = null;
  }

  void setStore(Store? store) {
    _store = store;
  }
}
