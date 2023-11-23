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
    String? photoURL,
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
    if (photoURL != null && photoURL.isNotEmpty) {
      dataToUpdate['photoURL'] = photoURL;
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
}
