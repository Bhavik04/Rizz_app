import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rizz/common/global_variables.dart';
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
                child: _buildPhotoContainer(_image1),
              ),
              GestureDetector(
                onTap: () => _openPicUpdateSheet(2),
                child: _buildPhotoContainer(_image2),
              ),
              GestureDetector(
                onTap: () => _openPicUpdateSheet(3),
                child: _buildPhotoContainer(_image3),
              ),
            ],
          ),
          const SizedBox(height: 5),
          ElevatedButton(
            onPressed: () async {
              if (_image1 != null) {
                final imageUrl = await StorageService().uploadImage(_image1!, 1);
                // Handle saving or updating the image URL for container 1
              }
              if (_image2 != null) {
                final imageUrl = await StorageService().uploadImage(_image2!, 2);
                // Handle saving or updating the image URL for container 2
              }
              if (_image3 != null) {
                final imageUrl = await StorageService().uploadImage(_image3!, 3);
                // Handle saving or updating the image URL for container 3
              }
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
              backgroundColor: GlobalVariables.themeColor,
            ),
            child: const Text('Save', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoContainer(File? imageFile) {
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
            : Icon(Icons.add, size: 50, color: GlobalVariables.themeColor),
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
