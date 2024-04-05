import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/screens/create_gender.dart';
import 'package:rizz/features/auth/screens/create_photo.dart';
import 'package:rizz/features/auth/widgets/custom_arrowbar.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';

class AcessScreen extends StatefulWidget {
  static const routeName = 'AcessScreen';

  const AcessScreen({Key? key}) : super(key: key);

  @override
  State<AcessScreen> createState() => _AcessScreenState();
}

class _AcessScreenState extends State<AcessScreen> {
  bool locationPermissionGranted = false;
  bool galleryPermissionGranted = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ArrowBar(
          title: 'Please allow access',
          textPadding:
              EdgeInsets.only(right: GlobalVariables.deviceWidth * 0.09),
          titleColor: Colors.white,
          backgroundColor: HexColor('F33C5E'),
          onBack: () {
            context.goNamed(GenderScreen.routeName);
          },
        ),
        body: Container(
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              stops: const [0.3, 0.5, 0.9],
              colors: [
                HexColor('F33C5E'),
                HexColor('F85D3E'),
                HexColor('FF8A41'),
              ],
            ),
          ),
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                    horizontal: GlobalVariables.deviceWidth * 0.1),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: GlobalVariables.deviceHeight * 0.07),
                      width: GlobalVariables.deviceWidth * 0.55,
                      child: Image.asset('assets/images/slaytext.png'),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: GlobalVariables.deviceHeight * 0.02),
                      width: GlobalVariables.deviceWidth * 0.65,
                      child: const Text(
                        'Slay needs to create your profile and give location based experience ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: GlobalVariables.deviceHeight * 0.08),
                      child: CustomButton(
                        text: 'Enable location',
                        textColor: locationPermissionGranted
                            ? Colors.black26
                            : Colors.white,
                        buttonColor: locationPermissionGranted
                            ? Colors.white70
                            : Colors.black,
                        image: Image.asset('assets/images/location.png'),
                        onTap: locationPermissionGranted
                            ? null
                            : () {
                                checkPermission(Permission.location, context);
                              },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: GlobalVariables.deviceHeight * 0.01),
                      child: CustomButton(
                        text: 'Enable gallery',
                        textColor: galleryPermissionGranted
                            ? Colors.black26
                            : Colors.white,
                        buttonColor: galleryPermissionGranted
                            ? Colors.white70
                            : Colors.black,
                        image: Image.asset('assets/images/gallery.png'),
                        onTap: galleryPermissionGranted
                            ? null
                            : () {
                                checkPermission(Permission.photos, context);
                              },
                      ),
                    ),
                    SizedBox(
                      height: GlobalVariables.deviceHeight * 0.62,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: GlobalVariables.deviceWidth * 0.0),
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/tinylock.png'),
                      const SizedBox(
                        width: 8,
                      ),
                      SizedBox(
                        width: GlobalVariables.deviceWidth * 0.65,
                        child: const Text(
                          'Slay cares intensily about your privacy. We will never misuse your data.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToPhotoScreenIfPermitted(BuildContext context) {
    if (locationPermissionGranted && galleryPermissionGranted) {
      context.goNamed(PhotoScreen.routeName);
    }
  }

  Future<void> checkPermission(
      Permission permission, BuildContext context) async {
    final status = await permission.request();
    if (status.isGranted) {
      setState(() {
        if (permission == Permission.location) {
          locationPermissionGranted = true;
        } else if (permission == Permission.photos) {
          galleryPermissionGranted = true;
        }
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Permission granted")));
      navigateToPhotoScreenIfPermitted(
          context); // Check if both permissions granted
    } else if (status.isDenied) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Permission denied")));
    } else if (status.isPermanentlyDenied) {
      final bool goToSettings = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Permission Required"),
            content: Text(
                "This app requires access to ${permission == Permission.location ? 'location' : 'photos'}. "
                "Would you like to open app settings to enable permission?"),
            actions: <Widget>[
              TextButton(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              TextButton(
                child: Text("Settings"),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        },
      );
      if (goToSettings) {
        openAppSettings();
      }
    }
  }
}
