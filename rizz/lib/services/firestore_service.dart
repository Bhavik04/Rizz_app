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
    if (photoURLs != null && photoURLs.isNotEmpty) {
      dataToUpdate['photoURL'] = photoURLs;
    }

    // Generate and store referral code
    final String referralCode = _generateReferralCode();
    dataToUpdate['referralCode'] = referralCode;

    if (dataToUpdate.isNotEmpty) {
      await _firestore
          .collection('users')
          .doc(uid)
          .set(dataToUpdate, SetOptions(merge: true));
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

  Future<Map<String, dynamic>?> getUserDataForImage(String imageURL) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
          .collection('users')
          .where('photoURL', isEqualTo: imageURL)
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

  Future<List<String>> getAllUserImages(String currentUserUid) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firestore.collection('users').get();

      return querySnapshot.docs
          .where((document) =>
              document['photoURL'] != null && document.id != currentUserUid)
          .map((document) => document['photoURL'] as String)
          .toList();
    } catch (e) {
      print('Error getting user images: $e');
      return [];
    }
  }

  Future<void> deleteUserData(String uid) async {
    await _firestore.collection('users').doc(uid).delete();
  }
}
