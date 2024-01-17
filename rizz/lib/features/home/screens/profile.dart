import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/custom_popup.dart';
import 'package:rizz/features/auth/widgets/profile_info.dart';
import 'package:rizz/features/home/screens/play.dart';
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
        backgroundColor: HexColor('141414'),
        appBar: AppBar(
          backgroundColor: HexColor('141414'),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: HexColor('FFFFFF'),
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          automaticallyImplyLeading: false,
          title: Text(
            'Slay',
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(
              color: GlobalVariables.themeColor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              // SizedBox(
              //   width: GlobalVariables.deviceWidth * 0.60,
              //   child: Text(
              //     'Slay as you Play',
              //     textAlign: TextAlign.center,
              //     maxLines: 2,
              //     style: TextStyle(
              //       color: GlobalVariables.themeColor,
              //       fontSize: 25,
              //       fontWeight: FontWeight.w700,
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: GlobalVariables.deviceHeight * 0.01,
                        ),
                        height: GlobalVariables.deviceHeight * 0.280,
                        width: GlobalVariables.deviceWidth * 0.370,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12),
                          border:
                              Border.all(color: Colors.transparent, width: 2),
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
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    profileImageURL!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            // Edit Icon
                            Positioned(
                              bottom: 8,
                              right: 8,
                              child: GestureDetector(
                                onTap: () {
                                  showPicUpdateSheet(context);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileInfoTile(
                        label: 'Name',
                        field: 'username',
                      ),
                      ProfileInfoTile(label: 'Snap', field: 'snapchat'),
                      ProfileInfoTile(label: 'Age', field: 'age'),
                      ProfileInfoTile(label: 'Gender', field: 'gender'),
                    ],
                  ),
                ],
              ),
              Container(
                margin:
                    EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.03),
                alignment: Alignment.center,
                child: InkWell(
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
                  text: 'delete',
                  onTap: () async {
                    await AuthService().signOut();
                    debugPrint('Print button tapped');
                    context.goNamed(PlayScreen.routeName);
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
