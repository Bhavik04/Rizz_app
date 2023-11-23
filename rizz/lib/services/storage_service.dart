import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rizz/services/auth_service.dart'; // to get the user's UID

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadImage(File imageFile) async {
    try {
      final String uid = AuthService().currentUser!.uid;
      const String folderName = 'profile_images';
      final String fileName = '$folderName/$uid.png';

      final Reference storageReference = _storage.ref().child(fileName);

      await storageReference.putFile(imageFile);

      final String downloadURL = await storageReference.getDownloadURL();

      return downloadURL;
    } catch (e) {
      print('Error uploading image to Firebase Storage: $e');
      throw Exception('Image upload failed');
    }
  }

  Future<void> deleteProfileImage(String uid) async {
    final String fileName = 'profile_images/$uid.png';
    await _storage.ref().child(fileName).delete();
  }
}
