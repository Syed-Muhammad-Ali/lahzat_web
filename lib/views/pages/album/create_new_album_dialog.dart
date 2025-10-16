import 'package:flutter/material.dart';
import 'package:lahzat_web/constants/colors.dart';
import 'package:lahzat_web/views/widgets/app_button.dart';
import 'package:lahzat_web/views/widgets/app_text.dart';
import 'package:lahzat_web/views/widgets/apptext_rubik.dart';
import 'package:lahzat_web/views/widgets/extension_sizebox.dart';
import 'package:lahzat_web/views/widgets/image_picker_bottom_sheet_container.dart';
import 'package:lahzat_web/views/widgets/image_picker_container.dart';

import '../../widgets/app_textfield.dart';

Future<void> createNewAlbumDialog(BuildContext context) async {
  bool isPrivate = true;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController pinController = TextEditingController();

  await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          final screenWidth = MediaQuery.of(context).size.width;
          final screenHeight = MediaQuery.of(context).size.height;

          // ✅ Responsive width logic
          double dialogWidth;
          if (screenWidth <= 600) {
            // 📱 Mobile
            dialogWidth = screenWidth * 0.9;
          } else if (screenWidth <= 1024) {
            // 💻 Tablet
            dialogWidth = screenWidth * 0.6;
          } else {
            // 🖥️ Desktop
            dialogWidth = 709;
          }

          // ✅ Responsive height logic
          double dialogHeight;
          if (screenHeight <= 700) {
            // Small screens
            dialogHeight = screenHeight * 0.8;
          } else if (screenHeight <= 1200) {
            dialogHeight = screenHeight * 0.7;
          } else {
            dialogHeight = 833;
          }

          return Dialog(
            insetPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            backgroundColor: Colors.white,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 709,
                maxHeight: 833,
                minWidth: 320,
                minHeight: 400,
              ),
              child: SizedBox(
                width: dialogWidth,
                height: dialogHeight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 32,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 🔹 Title
                        const AppText(
                          "Create New Album",
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: AppColor.blackColor,
                        ),
                        0.5.hSpace(context),
                        const AppTextRubik(
                          "Create a new album specifically for your Friends or Family.",
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColor.black,
                        ),
                        2.hSpace(context),

                        // 🔹 Upload Image Section
                        GestureDetector(
                          onTap: () async {
                            ImagePickerBottomSheetConatiner();
                          },
                          child: ImagepickerContainer(),
                        ),
                        2.hSpace(context),

                        // 🔹 Album Name
                        Row(
                          children: [
                            const AppTextRubik(
                              "Album Name",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColor.blackColor,
                            ),
                            const AppTextRubik(
                              "*",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColor.redColor,
                            ),
                          ],
                        ),
                        0.5.hSpace(context),
                        AppTextfield(
                          ctr: nameController,
                          hint: "Album Name",
                          borderColor: AppColor.black,
                        ),
                        2.hSpace(context),

                        // 🔹 Album Visibility
                        Row(
                          children: [
                            const AppTextRubik(
                              "Album Visibility",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColor.blackColor,
                            ),
                            const AppTextRubik(
                              "*",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColor.redColor,
                            ),
                          ],
                        ),
                        1.hSpace(context),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => setState(() => isPrivate = true),
                              child: Container(
                                width: 120,
                                height: 44,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: isPrivate
                                      ? AppColor.primaryColor
                                      : AppColor.baseColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: AppTextRubik(
                                  "Private",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: isPrivate
                                      ? AppColor.bgColor
                                      : AppColor.blackColor,
                                ),
                              ),
                            ),
                            1.wSpace(context),
                            GestureDetector(
                              onTap: () => setState(() => isPrivate = false),
                              child: Container(
                                width: 120,
                                height: 44,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: !isPrivate
                                      ? AppColor.primaryColor
                                      : AppColor.baseColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: AppTextRubik(
                                  "Public",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: !isPrivate
                                      ? Colors.white
                                      : AppColor.blackColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        2.hSpace(context),

                        // 🔹 Album PIN
                        const AppTextRubik(
                          "Album PIN",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColor.blackColor,
                        ),
                        0.5.hSpace(context),
                        AppTextfield(
                          ctr: pinController,
                          hint: "1234",
                          borderColor: AppColor.black,
                        ),
                        0.5.hSpace(context),
                        const AppTextRubik(
                          "Guests will use this PIN to view and download photos.",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColor.secondryTextColor,
                        ),
                        3.hSpace(context),

                        // 🔹 Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppButton(
                              width: 130,
                              height: 48,
                              radius: 12,
                              bgColor: AppColor.ff979797,
                              ontap: () => Navigator.pop(context),
                              label: 'Cancel',
                            ),
                            1.wSpace(context),
                            AppButton(
                              width: 160,
                              height: 48,
                              radius: 12,
                              bgColor: AppColor.primaryColor,
                              ontap: () {
                                // ✅ Handle album creation
                                Navigator.pop(context);
                              },
                              label: 'Create Album',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
