import 'dart:io';
import 'package:flutter/material.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/features/auth/widgets/custom_arrowbar.dart';
import 'package:rizz/features/auth/widgets/free_powers.dart';
import 'package:rizz/features/auth/widgets/photos_sheet.dart';
import 'package:rizz/services/auth_service.dart';
import 'package:rizz/services/firestore_service.dart';
import 'package:rizz/services/storage_service.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = 'ProfileScreen';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? profileImageURL;

  @override
  void initState() {
    super.initState();
    fetchProfileImage();
  }

  Future<void> fetchProfileImage() async {
    final currentUserId = AuthService().currentUser!.uid;

    final userData = await FirestoreService().getUserData(currentUserId);

    if (userData != null && userData.containsKey('photoURL')) {
      setState(() {
        profileImageURL = userData['photoURL'][0];
      });
    }
  }

  void updateProfileImage(File newPhoto) async {
    final currentUserId = AuthService().currentUser!.uid;

    // Upload the new photo to Firebase Storage
    final downloadURL = await StorageService().uploadImage(newPhoto);
    GlobalVariables.photoURLs[0] = downloadURL;

    // Update the photoURL in Firestore
    await FirestoreService().createUserData(
      currentUserId,
      null,
      null,
      0,
      gender: '',
      photoURLs: GlobalVariables.photoURLs,
    );

    // Fetch and update the profile image
    fetchProfileImage();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: ArrowBar(
          title: 'Profile',
          textPadding:
              EdgeInsets.only(right: GlobalVariables.deviceWidth * 0.09),
          backgroundColor: Colors.black,
          onBack: () {
            Navigator.pop(context);
          },
          showReportButton: false,
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(
                      0, 0, 0, GlobalVariables.deviceHeight * 0.01),
                  height: GlobalVariables.deviceWidth * 0.280,
                  width: GlobalVariables.deviceWidth * 0.280,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    image: profileImageURL != null
                        ? DecorationImage(
                            image: NetworkImage(profileImageURL!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: Stack(
                    children: [
                      // Profile Image
                      if (profileImageURL != null)
                        Positioned.fill(
                          child: ClipOval(
                            child: Image.network(
                              profileImageURL!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      // Edit Icon
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            showPhotoSheet(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: GlobalVariables.themeColor,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.edit, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Text(
                  '@jaat_boyhukka',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'shobhit, 99',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const Powers(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
