import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants/colors.dart';
import '../../utils/image_picker_service.dart';

class ImagePickerBottomSheetConatiner extends StatelessWidget {
  ImagePickerBottomSheetConatiner({super.key});
  final imagePickerService = Get.put(ImagePickerService());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Take a photo'),
            onTap: () {
              Get.back();
              imagePickerService.pickImage(ImageSource.camera);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('Choose from gallery'),
            onTap: () {
              Get.back();
              imagePickerService.pickImage(ImageSource.gallery);
            },
          ),
        ],
      ),
    );
  }
}
