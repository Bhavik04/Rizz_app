import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/screens/create_gender.dart';
import 'package:rizz/features/auth/screens/create_photo.dart';
import 'package:rizz/features/auth/widgets/app_settings.dart';
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
          onBack: () => context.goNamed(GenderScreen.routeName),
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
                    _buildImageWidget('assets/images/slaytext.png', 0.07),
                    _buildTextWidget(
                        'Slay needs to create your profile and give location based experience',
                        0.02),
                    _buildPermissionButton('Enable location',
                        locationPermissionGranted, Permission.location),
                    _buildPermissionButton('Enable gallery',
                        galleryPermissionGranted, Permission.photos),
                    SizedBox(height: GlobalVariables.deviceHeight * 0.62),
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
                      const SizedBox(width: 8),
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

  Widget _buildImageWidget(String imagePath, double marginTop) {
    return Container(
      margin: EdgeInsets.only(top: GlobalVariables.deviceHeight * marginTop),
      width: GlobalVariables.deviceWidth * 0.55,
      child: Image.asset(imagePath),
    );
  }

  Widget _buildTextWidget(String text, double marginTop) {
    return Container(
      margin: EdgeInsets.only(top: GlobalVariables.deviceHeight * marginTop),
      width: GlobalVariables.deviceWidth * 0.65,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildPermissionButton(
      String text, bool permissionGranted, Permission permission) {
    return Container(
      margin: EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.01),
      child: CustomButton(
        text: text,
        textColor: permissionGranted ? Colors.black26 : Colors.white,
        buttonColor: permissionGranted ? Colors.white70 : Colors.black,
        image: Image.asset(permission == Permission.location
            ? 'assets/images/location.png'
            : 'assets/images/gallery.png'),
        onTap: permissionGranted ? null : () => _checkPermission(permission),
      ),
    );
  }

  void _checkPermission(Permission permission) async {
    final status = await permission.request();
    if (status.isGranted) {
      setState(() {
        if (permission == Permission.location) {
          locationPermissionGranted = true;
        } else if (permission == Permission.photos) {
          galleryPermissionGranted = true;
        }
      });
      _navigateToPhotoScreenPermitted();
      print("permission enabled");
    } else if (status.isDenied) {
      print("permission denied");
    } else if (status.isPermanentlyDenied) {
      final bool goToSettings = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AppSettingsPopup(permission: permission);
        },
      );
      if (goToSettings) {
        openAppSettings();
      }
    }
  }

  void _navigateToPhotoScreenPermitted() {
    if (locationPermissionGranted && galleryPermissionGranted) {
      context.goNamed(PhotoScreen.routeName);
    }
  }
}
