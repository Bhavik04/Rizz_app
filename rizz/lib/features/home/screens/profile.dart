import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/db/modals/user.dart';
import 'package:rizz/db/services/database_service.dart';
import 'package:rizz/features/auth/widgets/custom_arrowbar.dart';
import 'package:rizz/features/auth/widgets/feedback_button.dart';
import 'package:rizz/features/auth/widgets/photos_sheet.dart';
import 'package:rizz/features/home/screens/subscription.dart';
import 'package:rizz/objectbox.g.dart';
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
  String? snapchatId;
  String? username;
  int? age;

  @override
  void initState() {
    super.initState();
    fetchProfileData();
  }

  Future<AppUser> getCurrentUserDetails() async {
    DatabaseService databaseService = GetIt.instance.get<DatabaseService>();
    Store store = databaseService.getStore()!;
    return store
        .box<AppUser>()
        .query(AppUser_.uId.equals(AuthService().currentUser!.uid))
        .build()
        .find()
        .first;
  }

  Future<void> fetchProfileData() async {
    // final userData = await FirestoreService().getUserData(currentUserId);
    AppUser currentUser = await getCurrentUserDetails();
    setState(() {
      profileImageURL = jsonDecode(currentUser.imageUrls)[0];
      snapchatId = currentUser.snapId;
      username = currentUser.name;
      age = currentUser.age;
    });
  }

  void updateProfileImage(File newPhoto) async {
    final currentUserId = AuthService().currentUser!.uid;

    // Upload the new photo to Firebase Storage with container index 1
    final downloadURL = await StorageService().uploadImage(newPhoto, 1);

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

    // Fetch and update the profile data
    fetchProfileData();
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
                CachedNetworkImage(
                  imageUrl: profileImageURL ?? "",
                  imageBuilder: (context, imageProvider) => Container(
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
                              image: imageProvider,
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
                              child:
                                  const Icon(Icons.edit, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),

                Text(
                  '@${snapchatId ?? 'loading...'}', // Display the Snapchat ID or 'loading...' if not available
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  '$username, ${age ?? 'loading...'}',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),

                //  const Powers(),

                Container(
                  margin: EdgeInsets.only(
                    top: GlobalVariables.deviceHeight * 0.03,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      context.goNamed(SubscriptionScreen.routeName);
                    },
                    child: Image.asset(
                      'assets/images/subscription.png',
                      width: GlobalVariables.deviceHeight * 0.5,
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.03),
                  child: CustomFeedbackButton(
                    width: GlobalVariables.deviceWidth * 0.85,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
