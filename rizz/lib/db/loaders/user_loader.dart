import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:objectbox/objectbox.dart';
import 'package:rizz/db/modals/user.dart';
import 'package:rizz/db/services/database_service.dart';
import 'package:rizz/services/firestore_service.dart';

class UserLoaderService {
  late DatabaseService databaseService;
  load() async {
    databaseService = GetIt.instance.get<DatabaseService>();
    await databaseService.init();
    var response = await FirestoreService().firestore.collection('users').get();
    final userdata = response.docs.map((e) => toUser(e)).toList();
    Store store = databaseService.getStore()!;
    store.box<AppUser>().removeAll();
    store.box<AppUser>().putMany(userdata);
  }

  AppUser toUser(QueryDocumentSnapshot<Map<String, dynamic>> data) {
    final userData = data.data();
    return AppUser(
        name: userData?["username"] ?? '',
        email: '',
        snapId: userData["snapchat"] ?? '',
        age: userData["age"] ?? 0,
        gender: userData["gender"] ?? '',
        imageUrls: jsonEncode(userData?["photoURLs"]),
        uId: data.id ?? '');
  }
}
