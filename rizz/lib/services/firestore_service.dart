import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rizz/db/modals/user.dart';
import 'package:rizz/services/auth_service.dart';

class FirestoreService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String _generateReferralCode() {
    const String alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final Random random = Random();
    final String code =
        List.generate(6, (index) => alphabet[random.nextInt(alphabet.length)])
            .join();
    return code;
  }

  void sendRating(AppUser user, int rating) {
    final Map<String, dynamic> dataToUpdate = {};
    dataToUpdate[AuthService().currentUser!.uid] = rating.toString();
    firestore
        .collection('rating')
        .doc(user.uId)
        .set(dataToUpdate, SetOptions(merge: true));
    // dataToUpdate[user.uId] = rating.toString();
    // firestore
    //     .collection('rating')
    //     .doc(AuthService().currentUser!.uid)
    //     .set(dataToUpdate,SetOptions(merge: true));
  }

  fetchRatings() async {
    final DocumentSnapshot<Map<String, dynamic>> userSnapshot = await firestore
        .collection('rating')
        .doc(AuthService().currentUser!.uid)
        .get();

    return userSnapshot.data();
  }

  Future<void> createUserData(
    String uid,
    String? username,
    String? snapchat,
    int? age, {
    String? gender = '',
    required List<String> photoURLs,
  }) async {
    final Map<String, dynamic> dataToUpdate = {};

    if (username != null && username.isNotEmpty) {
      dataToUpdate['username'] = username;
    }
    if (snapchat != null && snapchat.isNotEmpty) {
      dataToUpdate['snapchat'] = snapchat;
    }
    if (age != null && age > 0) {
      dataToUpdate['age'] = age;
    }
    if (gender != null && gender.isNotEmpty) {
      dataToUpdate['gender'] = gender;
    }
    if (photoURLs.isNotEmpty) {
      dataToUpdate['photoURLs'] = FieldValue.arrayUnion(photoURLs);
    }

    // Check if the user is new or existing
    final bool isNewUser = await checkIfNewUser(uid);

    // Generate and store referral code only for new users
    if (isNewUser) {
      final String referralCode = _generateReferralCode();
      dataToUpdate['referralCode'] = referralCode;
    }

    if (dataToUpdate.isNotEmpty) {
      await firestore
          .collection('users')
          .doc(uid)
          .set(dataToUpdate, SetOptions(merge: true));
    }
  }

  Future<bool> checkIfNewUser(String uid) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> userSnapshot =
          await firestore.collection('users').doc(uid).get();

      return !userSnapshot
          .exists; // If the user exists, return false; otherwise, return true
    } catch (e) {
      print('Error checking if user is new: $e');
      return true; // Consider the user as new in case of an exception
    }
  }

  Future<Map<String, dynamic>?> getUserData(String uid) async {
    try {
      final DocumentSnapshot documentSnapshot =
          await firestore.collection('users').doc(uid).get();

      if (documentSnapshot.exists) {
        return documentSnapshot.data() as Map<String, dynamic>;
      } else {
        return null;
      }
    } catch (e) {
      print('Error getting user data: $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> getUserDataForImage(dynamic imageURL) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
          .collection('users')
          .where('photoURLs', isEqualTo: imageURL)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first.data() as Map<String, dynamic>;
      } else {
        return null;
      }
    } catch (e) {
      print('Error getting user data for image: $e');
      return null;
    }
  }

  Future<List> getAllUserImages(String currentUserUid) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await firestore.collection('users').get();

      return querySnapshot.docs
          .where((document) =>
              document['photoURLs'] != null && document.id != currentUserUid)
          .map((document) => document['photoURLs'])
          .toList();
    } catch (e) {
      print('Error getting user images: $e');
      return [];
    }
  }

  Future<void> deleteUserData(String uid) async {
    await firestore.collection('users').doc(uid).delete();
  }

  Future<void> updateUserPhotoURLs(String uid, List<String> photoURLs) async {
    try {
      await firestore.collection('users').doc(uid).update({
        'photoURLs': FieldValue.arrayUnion(photoURLs),
      });
      print('Photo URLs updated successfully.');
    } catch (e) {
      print('Error updating photo URLs: $e');
      throw Exception('Failed to update photo URLs.');
    }
  }

  Future<List<String>?> getUserPhotoURLs(String uid) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> userSnapshot =
          await firestore.collection('users').doc(uid).get();

      if (userSnapshot.exists) {
        final data = userSnapshot.data();
        if (data != null && data.containsKey('photoURLs')) {
          final List<dynamic>? photoURLs = data['photoURLs'];
          if (photoURLs != null && photoURLs.isNotEmpty) {
            return List<String>.from(photoURLs);
          }
        }
      }
      return null; // Return null if user or photoURLs data doesn't exist
    } catch (e) {
      print('Error getting user photo URLs: $e');
      return null;
    }
  }
}
