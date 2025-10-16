// ignore_for_file: unused_local_variable, deprecated_member_use, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lahzat_web/constants/colors.dart';
import 'package:lahzat_web/constants/icons.dart';
import 'package:lahzat_web/views/pages/payment_info/payment_info_page.dart';
import 'package:lahzat_web/views/widgets/app_button.dart';
import 'package:lahzat_web/views/widgets/app_container.dart';
import 'package:lahzat_web/views/widgets/app_text.dart';
import 'package:lahzat_web/views/widgets/app_textfield.dart';
import 'package:lahzat_web/views/widgets/confirmation_popup.dart';
import 'package:lahzat_web/views/widgets/custom_dialog_box.dart';
import 'package:lahzat_web/views/widgets/custom_phone_text_field.dart';
import 'package:lahzat_web/views/widgets/extension_sizebox.dart';
import 'package:lahzat_web/views/widgets/image_picker_container.dart';
import 'package:lahzat_web/views/widgets/language_toggle.dart';
import 'package:lahzat_web/views/widgets/photo_selctor.dart';

import '../../../models/manage_event_model.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/delete_Confirmation_Popup.dart';

class CreateNewEventPage extends StatelessWidget {
  final UserItem? event;
  const CreateNewEventPage({super.key, this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double width = constraints.maxWidth;
            final bool isDesktop = width >= 1200;
            final bool isTablet = width >= 800 && width < 1200;
            final bool isMobile = width < 800;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// ---------- HEADER ----------
                  AppBarWidgets(),

                  /// ---------- PAGE TITLE ----------
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 80,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppIcons.backButton),
                            1.wSpace(context),
                            AppText(
                              'Create Event',
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              color: AppColor.black,
                            ),
                          ],
                        ),
                        0.5.hSpace(context),
                        AppText(
                          "            Let’s create a new event.",
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColor.black.withOpacity(0.7),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  /// ---------- MAIN CONTAINER ----------
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 120),
                    child: AppContainer(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            /// FORM + PREVIEW SIDE BY SIDE
                            isMobile
                                ? _buildMobileLayout(context)
                                : Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: _buildLeftForm(),
                                      ),
                                      SizedBox(width: isTablet ? 30 : 60),
                                      Expanded(
                                        flex: 2,
                                        child: _buildRightPreview(),
                                      ),
                                    ],
                                  ),

                            const SizedBox(height: 30),

                            /// ---------- BOTTOM BUTTONS ----------
                            event == null
                                ? Row(
                                    children: [
                                      const Spacer(),
                                      Expanded(
                                        child: AppButton(
                                          ontap: () {
                                            CustomDialogBox(context);
                                          },
                                          label: 'Cancel',
                                          bgColor: AppColor.secondryTextColor
                                              .withOpacity(0.20),

                                          height: 55,
                                          radius: 8,
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: AppButton(
                                          ontap: () {
                                            Get.to(() => PaymentInfoPage());
                                          },
                                          label: 'Create Event',
                                          bgColor: AppColor.primaryColor,
                                          txtClr: AppColor.whiteColor,
                                          height: 55,
                                          radius: 8,
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      const Spacer(),
                                      Expanded(
                                        child: AppButton(
                                          ontap: () {
                                            CustomDialogBox(context);
                                          },
                                          label: 'Cancel',
                                          bgColor: AppColor.secondryTextColor
                                              .withOpacity(0.20),

                                          height: 55,
                                          radius: 8,
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: AppButton(
                                          ontap: () {
                                            DeleteConfirdationPopup(context);
                                          },
                                          label: 'Delete Event',
                                          bgColor: AppColor.darkred,
                                          txtClr: AppColor.whiteColor,
                                          height: 55,
                                          radius: 8,
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: AppButton(
                                          ontap: () {
                                            ConfirmationPopup(context);
                                          },
                                          label: 'Update Event Details',
                                          bgColor: AppColor.primaryColor,
                                          txtClr: AppColor.whiteColor,
                                          height: 55,
                                          radius: 8,
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // /// ---------- HEADER ----------
  // Widget _buildHeader(bool isMobile) {
  //   return Container(
  //     height: 89,
  //     width: double.infinity,
  //     alignment: Alignment.center,
  //     decoration: const BoxDecoration(
  //       color: Colors.white,
  //       border: Border(
  //         bottom: BorderSide(color: AppColor.primaryColor, width: 1),
  //       ),
  //     ),
  //     padding: const EdgeInsets.symmetric(horizontal: 20),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         if (!isMobile) const Spacer(flex: 2),

  //         /// Search Field
  //         Expanded(
  //           flex: isMobile ? 8 : 5,
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //               AppTextfield(
  //                 ctr: TextEditingController(),
  //                 hint: 'Search',
  //                 suffixIcon: Padding(
  //                   padding: const EdgeInsets.all(10),
  //                   child: SvgPicture.asset(
  //                     AppIcons.search,
  //                     color: Colors.black,
  //                     height: 20,
  //                     width: 20,
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),

  //         if (!isMobile) const Spacer(flex: 3),

  //         /// Profile Picture
  //         Container(
  //           height: 45,
  //           width: 45,
  //           margin: EdgeInsets.only(left: isMobile ? 12 : 0),
  //           clipBehavior: Clip.antiAlias,
  //           decoration: const BoxDecoration(shape: BoxShape.circle),
  //           child: Image.asset(Appimage.p1, fit: BoxFit.cover),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  /// ---------- LEFT COLUMN ----------
  Widget _buildLeftForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextfield(
          ctr: TextEditingController(),
          showStar: true,
          title: 'Event Type ',
          hint: 'Select',
          filledColor: AppColor.filledColor,
          suffixIcon: Center(
            child: SvgPicture.asset(AppIcons.downArrow, color: AppColor.black),
          ),
        ),
        AppTextfield(
          ctr: TextEditingController(),
          showStar: true,
          title: 'Event Title ',
          hint: 'Sara & Ali’s Wedding',
          filledColor: AppColor.filledColor,
        ),
        Row(
          children: [
            Expanded(
              child: AppTextfield(
                ctr: TextEditingController(),
                showStar: true,
                title: 'Event Date',
                hint: 'Aug 24, 2025',
                filledColor: AppColor.filledColor,
                suffixIcon: Center(child: SvgPicture.asset(AppIcons.calender)),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: AppTextfield(
                ctr: TextEditingController(),
                showStar: true,
                title: 'Event Time',
                hint: '9:30 PM',
                filledColor: AppColor.filledColor,
                suffixIcon: Center(child: SvgPicture.asset(AppIcons.clock)),
              ),
            ),
          ],
        ),
        AppText(
          'Your event is on Sunday, Aug 24, 2025 at 9:30 PM.',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColor.primaryColor,
        ),
        const SizedBox(height: 10),
        const LanguageToggle(),
        const SizedBox(height: 16),
        AppTextfield(
          title: "Greeting Message",
          hint: 'Write welcome message for your guests..',
          ctr: TextEditingController(),
          maximumLines: 5,
          minimumLines: 5,
          filledColor: AppColor.filledColor,
        ),
        AppText(
          'Edit or keep the default message.',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColor.secondryTextColor,
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: CustomPhoneNumberField(title: 'Mobile Phone'),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 2,
              child: AppTextfield(
                ctr: TextEditingController(),
                showStar: true,
                title: 'Event PIN',
                hint: 'ROSE123',
                filledColor: AppColor.filledColor,
                suffixIcon: const Icon(Icons.visibility_off),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ImagepickerContainer(),
        const SizedBox(height: 16),
        event == null
            ? AppText(
                'Payment',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColor.black,
              )
            : SizedBox(),
        event == null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(child: AppButton(label: 'Paid')),
                  const SizedBox(width: 16),
                  Expanded(
                    child: AppButton(
                      label: 'Pending',
                      bgColor: AppColor.bgColor,
                      borderColor: AppColor.secondryTextColor,
                      txtClr: AppColor.secondryTextColor,
                    ),
                  ),
                  const Spacer(),
                ],
              )
            : SizedBox(),
      ],
    );
  }

  /// ---------- RIGHT COLUMN ----------
  Widget _buildRightPreview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          'Preview',
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: AppColor.black,
        ),
        const SizedBox(height: 16),

        /// 👇 Added PhotoSelector under Preview
        const PhotoSelector(),
        const SizedBox(height: 24),

        SizedBox(
          width: double.infinity,
          child: AppButton(
            label: '',
            rowElements: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppIcons.upload, color: AppColor.primaryColor),
                const SizedBox(width: 8),
                AppText(
                  'Change Image',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColor.primaryColor,
                ),
              ],
            ),
            bgColor: AppColor.primaryColor.withOpacity(0.20),
            radius: 6,
          ),
        ),
        const SizedBox(height: 20),

        AppText(
          'Card Details',
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: AppColor.black,
        ),
        const SizedBox(height: 10),

        AppTextfield(
          ctr: TextEditingController(),
          title: 'Card Number',
          hint: '2427 4252 8364 1427',
          filledColor: AppColor.filledColor,
        ),
        const SizedBox(height: 10),

        Row(
          children: [
            Expanded(
              child: AppTextfield(
                ctr: TextEditingController(),
                title: 'Expiry Date',
                hint: '02/25',
                filledColor: AppColor.filledColor,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: AppTextfield(
                ctr: TextEditingController(),
                hint: '101',
                title: 'CVV/CVC',
                filledColor: AppColor.filledColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),

        AppTextfield(
          ctr: TextEditingController(),
          hint: 'John Martin',
          title: 'Card Holder Name',
          filledColor: AppColor.filledColor,
        ),
      ],
    );
  }

  /// ---------- MOBILE STACKED LAYOUT ----------
  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLeftForm(),
        const SizedBox(height: 40),
        _buildRightPreview(),
      ],
    );
  }
}
