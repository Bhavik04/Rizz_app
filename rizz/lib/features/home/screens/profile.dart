import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/screens/sign_in.dart';
import 'package:rizz/features/auth/widgets/custom_arrowbar.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/custom_popup.dart';
import 'package:rizz/features/auth/widgets/photos_sheet.dart';
import 'package:rizz/services/auth_service.dart';
import 'package:rizz/services/firestore_service.dart';
import 'package:rizz/services/storage_service.dart';
import 'package:image_picker/image_picker.dart';

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
        profileImageURL = userData['photoURL'];
      });
    }
  }

  void updateProfileImage(File newPhoto) async {
    final currentUserId = AuthService().currentUser!.uid;

    // Upload the new photo to Firebase Storage
    final downloadURL = await StorageService().uploadImage(newPhoto);

    // Update the photoURL in Firestore
    await FirestoreService().createUserData(
      currentUserId,
      null,
      null,
      0,
      gender: '',
      photoURL: downloadURL,
    );

    // Fetch and update the profile image
    fetchProfileImage();
  }

  void showPicUpdateSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      builder: (BuildContext context) {
        return _buildPicUpdateSheet(context);
      },
    );
  }

  Widget _buildPicUpdateSheet(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),
          _buildBottomSheetItem(
            context,
            'Change Photo',
            Colors.blue,
            18,
            FontWeight.normal,
            () async {
              final pickedImage =
                  await ImagePicker().pickImage(source: ImageSource.gallery);

              if (pickedImage != null) {
                final newPhoto = File(pickedImage.path);
                updateProfileImage(newPhoto);
              }

              Navigator.pop(context);
            },
          ),
          const Divider(
            height: 2,
          ),
          _buildBottomSheetItem(
            context,
            'Cancel',
            Colors.black,
            18,
            FontWeight.normal,
            () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildBottomSheetItem(
    BuildContext context,
    String title,
    Color textColor,
    double fontSize,
    FontWeight fontWeight,
    Function onTap,
  ) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: ListTile(
        title: Center(
          child: Text(
            title,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor('0F0F0F'),
        appBar: ArrowBar(
          title: 'Profile',
          textPadding:
              EdgeInsets.only(right: GlobalVariables.deviceWidth * 0.09),
          backgroundColor: HexColor('0F0F0F'),
          onBack: () {
            Navigator.pop(context);
          },
          showReportButton: false,
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(
                    0,
                    GlobalVariables.deviceHeight * 0.01,
                    0,
                    GlobalVariables.deviceHeight * 0.01),
                height: GlobalVariables.deviceWidth * 0.360,
                width: GlobalVariables.deviceWidth * 0.360,
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
                          padding: const EdgeInsets.all(8),
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
              Container(
                margin:
                    EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.03),
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomDialog(
                          onButtonTap: (buttonText) {
                            debugPrint('$buttonText button tapped');
                          },
                        );
                      },
                    );
                  },
                  child: Image.asset(
                    'assets/images/subscription.png',
                    fit: BoxFit.contain,
                    height: GlobalVariables.deviceHeight * 0.19,
                    width: GlobalVariables.deviceWidth * 0.90,
                  ),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.03),
                child: CustomButton(
                  text: 'Sign Out',
                  onTap: () async {
                    await AuthService().signOut();
                    debugPrint('Print button tapped');
                    context.goNamed(SignInPage.routeName);
                  },
                  buttonColor: HexColor('693DE7'),
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
