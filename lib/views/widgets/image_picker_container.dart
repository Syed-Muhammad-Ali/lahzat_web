import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lahzat_web/views/widgets/app_button.dart';
import 'package:lahzat_web/views/widgets/app_text.dart';
import '../../../constants/colors.dart';
import '../../utils/image_picker_service.dart';
import 'image_picker_bottom_sheet_container.dart';

class ImagepickerContainer extends StatelessWidget {
  final imagePickerService = Get.put(ImagePickerService());
  ImagepickerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // 📱 Responsive breakpoints
    final bool isMobile = screenWidth < 600;
    final bool isTablet = screenWidth >= 600 && screenWidth < 1100;

    // 📏 Auto sizes
    final double containerHeight = isMobile
        ? 160
        : isTablet
        ? 200
        : 240;

    final double fontSize = isMobile
        ? 14
        : isTablet
        ? 16
        : 18;

    final double buttonHeight = isMobile
        ? 42
        : isTablet
        ? 48
        : 54;

    return Obx(() {
      final pickedImage = imagePickerService.pickedImage.value;

      return GestureDetector(
        onTap: () => Get.bottomSheet(
          ImagePickerBottomSheetConatiner(),
          backgroundColor: Colors.transparent,
        ),
        child: pickedImage != null
            ? _buildSelectedImage(pickedImage.path, containerHeight)
            : _buildDottedUploader(
                context,
                containerHeight,
                buttonHeight,
                fontSize,
                isMobile,
              ),
      );
    });
  }

  /// 🖼️ Show selected image
  Widget _buildSelectedImage(String path, double height) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColor.secondryTextColor),
        image: DecorationImage(image: FileImage(File(path)), fit: BoxFit.cover),
      ),
    );
  }

  /// 📤 Upload placeholder (with Dotted Border)
  Widget _buildDottedUploader(
    BuildContext context,
    double height,
    double buttonHeight,
    double fontSize,
    bool isMobile,
  ) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(12),
      dashPattern: const [8, 6],
      color: AppColor.secondryTextColor,
      strokeWidth: 1,
      child: Container(
        width: double.infinity,
        height: height,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// ✅ Flexible Upload Button (no overflow)
            Flexible(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 200),
                child: AppButton(
                  label: '',
                  bgColor: AppColor.skyblue,
                  height: buttonHeight,
                  width: double.infinity,
                  rowElements: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppText(
                        'Upload',
                        fontSize: fontSize,
                        fontWeight: FontWeight.w500,
                        color: AppColor.black,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: height * 0.1),

            /// ✅ Adaptive text with safe scaling
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: AppText(
                  'Tap to upload Banner',
                  fontSize: fontSize + 2,
                  fontWeight: FontWeight.w400,
                  color: AppColor.blackColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
