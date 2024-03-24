import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/services/auth_service.dart';
import 'package:rizz/services/firestore_service.dart';
import 'package:rizz/services/storage_service.dart';

class PhotoSheet extends StatefulWidget {
  const PhotoSheet({Key? key}) : super(key: key);

  @override
  _PhotoSheetState createState() => _PhotoSheetState();
}

class _PhotoSheetState extends State<PhotoSheet> {
  File? _image1;
  File? _image2;
  File? _image3;
  List<String>? _photoURLs;

  @override
  void initState() {
    super.initState();
    _fetchPhotoURLs();
  }

  Future<void> _fetchPhotoURLs() async {
    try {
      String uid = AuthService().currentUser!.uid;
      List<String>? photoURLs =
          await FirestoreService().getUserPhotoURLs(uid);
      setState(() {
        _photoURLs = photoURLs;
      });
    } catch (e) {
      print('Error fetching photo URLs: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 4,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(2),
            ),
            margin: const EdgeInsets.symmetric(vertical: 12),
          ),
          const Text(
            'Tap to add or change photo',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _openPicUpdateSheet(1),
                child: _buildPhotoContainer(_image1, 0),
              ),
              GestureDetector(
                onTap: () => _openPicUpdateSheet(2),
                child: _buildPhotoContainer(_image2, 1),
              ),
              GestureDetector(
                onTap: () => _openPicUpdateSheet(3),
                child: _buildPhotoContainer(_image3, 2),
              ),
            ],
          ),
          const SizedBox(height: 5),
          ElevatedButton(
            onPressed: _savePhotos,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
              backgroundColor: GlobalVariables.themeColor,
            ),
            child: const Text('Save', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }

  Widget _buildPhotoContainer(File? imageFile, int index) {
    File? pickedImage;
    if (index == 0) {
      pickedImage = _image1;
    } else if (index == 1) {
      pickedImage = _image2;
    } else if (index == 2) {
      pickedImage = _image3;
    }

    return Container(
      width: 120,
      height: 170,
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: pickedImage != null
            ? Image.file(pickedImage, fit: BoxFit.cover, width: 120, height: 170)
            : (_photoURLs != null && _photoURLs!.length > index && _photoURLs![index] != null
                ? Image.network(_photoURLs![index]!, fit: BoxFit.cover, width: 120, height: 170)
                : Icon(Icons.add, size: 50, color: GlobalVariables.themeColor)),
      ),
    );
  }

  void _openPicUpdateSheet(int containerIndex) async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final newPhoto = File(pickedImage.path);
      setState(() {
        if (containerIndex == 1)
          _image1 = newPhoto;
        else if (containerIndex == 2)
          _image2 = newPhoto;
        else if (containerIndex == 3)
          _image3 = newPhoto;
      });
    }
  }

  Future<void> _savePhotos() async {
    try {
      List<String> photoURLs = [];

      // Upload images to storage and update Firestore URLs
      if (_image1 != null) {
        final imageUrl1 = await StorageService().uploadImage(_image1!, 1);
        photoURLs.add(imageUrl1);
      }

      if (_image2 != null) {
        final imageUrl2 = await StorageService().uploadImage(_image2!, 2);
        photoURLs.add(imageUrl2);
      }

      if (_image3 != null) {
        final imageUrl3 = await StorageService().uploadImage(_image3!, 3);
        photoURLs.add(imageUrl3);
      }

      String uid = AuthService().currentUser!.uid;

      // Update Firestore with updated photo URLs
      await FirestoreService().updateUserPhotoURLs(uid, photoURLs);

      // Optionally clear the images after saving
      setState(() {
        _image1 = null;
        _image2 = null;
        _image3 = null;
      });
    } catch (e) {
      print('Error saving photo URLs: $e');
    }
  }
}

void showPhotoSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isDismissible: true,
    backgroundColor: const Color.fromARGB(255, 15, 15, 15),
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.85,
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) {
          return const PhotoSheet();
        },
      );
    },
  );
}
