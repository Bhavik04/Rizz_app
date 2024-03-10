import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String _generateReferralCode() {
    const String alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final Random random = Random();
    final String code =
        List.generate(6, (index) => alphabet[random.nextInt(alphabet.length)])
            .join();
    return code;
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
      await _firestore
          .collection('users')
          .doc(uid)
          .set(dataToUpdate, SetOptions(merge: true));
    }
  }

  Future<bool> checkIfNewUser(String uid) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> userSnapshot =
          await _firestore.collection('users').doc(uid).get();

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
          await _firestore.collection('users').doc(uid).get();

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
      final QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
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

  Future<List> getAllUserImages(String currentUserUid)  async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
           await _firestore.collection('users').get();

      return querySnapshot.docs
          .where((document) =>
              document['photoURLs'] != null && document.id != currentUserUid)
          .map((document) => document['photoURLs'] )
          .toList() ;
    } catch (e) {
      print('Error getting user images: $e');
      return [];
    }
  }

  Future<void> deleteUserData(String uid) async {
    await _firestore.collection('users').doc(uid).delete();
  }
}
