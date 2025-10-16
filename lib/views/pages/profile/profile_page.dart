import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:lahzat_web/constants/colors.dart';
import 'package:lahzat_web/views/widgets/app_button.dart';

import 'package:lahzat_web/views/widgets/app_textfield.dart';
import 'package:lahzat_web/views/widgets/apptext_rubik.dart';
import 'package:lahzat_web/views/widgets/custom_phone_text_field.dart';
import 'package:lahzat_web/views/widgets/extension_sizebox.dart';
import 'package:lahzat_web/views/widgets/image_picker_bottom_sheet_container.dart';

import '../../../constants/images.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: 1100,
          //  height: 500,
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// 🔹 Profile image with camera icon overlay
                  Stack(
                    children: [
                      /// Profile image
                      CircleAvatar(
                        radius: 45,
                        backgroundImage: AssetImage(Appimage.p1),
                      ),

                      /// Camera icon overlay
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            Get.bottomSheet(ImagePickerBottomSheetConatiner());
                          },
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              color: const Color(
                                0xFFD6A98A,
                              ), // light brown tone
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  2.wSpace(context),

                  /// 🔹 Name + Email
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextRubik(
                        'Marry Jane',
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      1.hSpace(context),
                      AppTextRubik(
                        'marryjane@gmail.com',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: AppColor.secondryTextColor,
                      ),
                    ],
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: AppTextfield(
                      ctr: TextEditingController(),
                      title: 'Full Name',
                      hint: 'Marry Jane',
                      filledColor: AppColor.filledColor,
                      titleColor: AppColor.black,
                    ),
                  ),
                  10.wSpace(context),
                  Expanded(
                    flex: 2,
                    child: AppTextfield(
                      ctr: TextEditingController(),
                      title: 'Username',
                      hint: '@marryjane',
                      filledColor: AppColor.filledColor,
                      titleColor: AppColor.black,
                    ),
                  ),
                ],
              ),
              2.hSpace(context),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomPhoneNumberField(title: 'Phone Number'),
                  ),
                  10.wSpace(context),
                  Expanded(
                    flex: 2,
                    child: AppTextfield(
                      ctr: TextEditingController(),
                      title: 'Full Name',
                      hint: 'Marry Jane',
                      filledColor: AppColor.filledColor,
                      titleColor: AppColor.black,
                    ),
                  ),
                ],
              ),
              6.hSpace(context),
              AppButton(label: 'Update Profiles'),
            ],
          ).paddingSymmetric(vertical: 40, horizontal: 40),
        ).paddingSymmetric(vertical: 20),
      ),
    );
  }
}
