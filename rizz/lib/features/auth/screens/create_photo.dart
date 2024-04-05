import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/screens/create_profile.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/custom_text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rizz/services/storage_service.dart';

class PhotoScreen extends StatefulWidget {
  static const routeName = 'PhotoScreen';
  static File? selectedImage;

  const PhotoScreen({Key? key}) : super(key: key);

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  File? _pickedImage;

  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _pickedImage = File(pickedImage.path);
      });

      // Store the selected image in the static variable
      PhotoScreen.selectedImage = _pickedImage;

      try {
        // Upload the image to Firebase Storage
        final downloadURL =
            await StorageService().uploadImage(_pickedImage!, 1);

        // await FirestoreService().createUserData(
        //   AuthService().currentUser!.uid,
        //   null,
        //   null,
        //   0,
        //   gender: '',
        //   photoURL: downloadURL,
        // );
        GlobalVariables.photoURLs.add(downloadURL);

        context.goNamed(CreateProfileScreen.routeName);
      } catch (e) {
        print('Error uploading image: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor('F33C5E'),
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
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: GlobalVariables.deviceHeight * 0.11),
                    width: GlobalVariables.deviceWidth * 0.55,
                    child: const CustomText(text: "Upload a photo of you!"),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: GlobalVariables.deviceHeight * 0.03),
                    alignment: Alignment.center,
                    width: GlobalVariables.deviceWidth * 0.500,
                    height: GlobalVariables.deviceHeight * 0.500,
                    child: Image.asset(
                      'assets/images/Rectangle.png',
                      height: GlobalVariables.deviceHeight * 0.500,
                      width: GlobalVariables.deviceWidth * 0.500,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: GlobalVariables.deviceHeight * 0.06),
                    child: CustomButton(
                      text: 'Pick your fav pic',
                      onTap: () {
                        debugPrint('print button');
                        _pickImage();
                      },
                      buttonColor: Colors.white,
                      textColor: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
