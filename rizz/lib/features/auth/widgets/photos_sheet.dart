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
  List<File?> _images = List.filled(3, null);
  List<String>? _photoURLs;

  @override
  void initState() {
    super.initState();
    _fetchPhotoURLs();
  }

  Future<void> _fetchPhotoURLs() async {
    try {
      String uid = AuthService().currentUser!.uid;
      List<String>? photoURLs = await FirestoreService().getUserPhotoURLs(uid);
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
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              _images.length,
              (index) => GestureDetector(
                onTap: () => _openPicUpdateSheet(index),
                child: _buildPhotoContainer(_images[index], index),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _savePhotos();
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
              backgroundColor: GlobalVariables.themeColor,
            ),
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPhotoContainer(File? imageFile, int index) {
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
        child: imageFile != null
            ? Image.file(imageFile, fit: BoxFit.cover, width: 120, height: 170)
            : (_photoURLs != null &&
                    _photoURLs!.length > index &&
                    _photoURLs![index] != null
                ? Image.network(_photoURLs![index]!,
                    fit: BoxFit.cover, width: 120, height: 170)
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
        _images[containerIndex] = newPhoto;
      });
    }
  }

  Future<void> _savePhotos() async {
    try {
      List<String> photoURLs = [];

      for (int i = 0; i < _images.length; i++) {
        File? image = _images[i];
        if (image != null) {
          final imageUrl = await StorageService().uploadImage(image, i + 1);
          photoURLs.add(imageUrl);
        }
      }

      String uid = AuthService().currentUser!.uid;

      await FirestoreService().updateUserPhotoURLs(uid, photoURLs);

      setState(() {
        _images = List.filled(3, null);
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
