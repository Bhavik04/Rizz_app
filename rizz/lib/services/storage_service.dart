import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rizz/services/auth_service.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadImage(File imageFile, int containerIndex) async {
    try {
      final String uid = AuthService().currentUser!.uid;
      final String folderName = 'profile_images/$uid';

      final String fileName = '$folderName/image_$containerIndex.png';

      final Reference storageReference = _storage.ref().child(fileName);

      await storageReference.putFile(imageFile);

      final String downloadURL = await storageReference.getDownloadURL();

      return downloadURL;
    } catch (e) {
      print('Error uploading image to Firebase Storage: $e');
      throw Exception('Image upload failed');
    }
  }

  Future<void> deleteProfileFolder(String uid) async {
    try {
      final String folderName = 'profile_images/$uid';
      await _storage.ref(folderName).delete();
      print('User folder deleted successfully: $folderName');
    } catch (e) {
      print('Error deleting user folder: $e');
      throw Exception('User folder deletion failed');
    }
  }
}
