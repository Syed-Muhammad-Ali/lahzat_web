// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lahzat_web/constants/colors.dart';
import 'package:lahzat_web/constants/icons.dart';
import 'package:lahzat_web/views/widgets/app_bar_admin.dart';
import 'package:lahzat_web/views/widgets/apptext_rubik.dart';
import 'package:lahzat_web/views/widgets/extension_sizebox.dart';
import 'package:lahzat_web/views/widgets/profile_popup.dart';

import '../../widgets/app_textfield.dart';
import '../../widgets/event_rich_text.dart';
import '../../widgets/payment_checkbox.dart';
import '../../widgets/swape_button.dart';

class PaymentInfoPage extends StatefulWidget {
  const PaymentInfoPage({super.key});

  @override
  State<PaymentInfoPage> createState() => _PaymentInfoPageState();
}

class _PaymentInfoPageState extends State<PaymentInfoPage> {
  int selectedPayment = 0; // 0 = Card, 1 = Apple Pay, 2 = Google Pay
  int? selectedCardIndex;

  final List<Map<String, dynamic>> cards = [
    {"brand": "visa", "last4": "8970", "expiry": "12/26"},
    {"brand": "mastercard", "last4": "1234", "expiry": "08/27"},
    {"brand": "cash"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 App Bar on top (outside container)
          AppBarAdmin(
            onTap: () {
              profilePopup(context);
            },
          ),
          1.hSpace(context),

          // 🔹 Title Row (outside container)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 10),
            child: Row(
              children: [
                SvgPicture.asset(AppIcons.backButton),
                1.wSpace(context),
                AppTextRubik(
                  'Payment Information',
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: AppColor.black,
                ),
              ],
            ),
          ),

          // 🔹 Centered main content inside container
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  width: 1099,
                  height: 1289,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColor.black.withOpacity(0.1)),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.blackColor.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 24,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // 🔹 Payment selector
                              AppTextRubik(
                                "Payment",
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: AppColor.black,
                              ),
                              1.hSpace(context),
                              _buildPaymentSelector(context),

                              // ✅ Removed extra space here
                              3.hSpace(context),
                              _buildLeftCardList(),
                              // 🔹 Card Details Fields
                              Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppTextRubik(
                                      'Other Card Details',
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.black,
                                    ),
                                    // Card Number
                                    AppTextfield(
                                      ctr: TextEditingController(),
                                      title: 'Card Number',
                                      hint: '2427 4252 8364 1427',
                                      filledColor: AppColor.filledColor,
                                    ),

                                    1.hSpace(context),

                                    // Expiry + CVV side by side
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: AppTextfield(
                                            ctr: TextEditingController(),
                                            title: 'Expiry Date',
                                            hint: '02/25',
                                            filledColor: AppColor.filledColor,
                                          ),
                                        ),
                                        6.wSpace(context),
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

                                    1.hSpace(context),

                                    // Card Holder Name
                                    AppTextfield(
                                      ctr: TextEditingController(),
                                      hint: 'John Martin',
                                      title: 'Card Holder Name',
                                      filledColor: AppColor.filledColor,
                                    ),
                                    6.hSpace(context),
                                    /////// swipe Button ///////
                                    SwapeButton(title: ''),
                                    //////////////
                                    2.hSpace(context),
                                    AppTextRubik(
                                      'Apply Promo Code to get discount',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.black,
                                    ),
                                    15.hSpace(context),
                                    PaymentCheckboxSection(
                                      onContinue: () {
                                        // ✅ Both boxes are checked here
                                        print("Payment form submitted!");
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        6.wSpace(context),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColor.whiteColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(
                                        0x66000000,
                                      ), // #00000040 = 40% opacity black
                                      offset: const Offset(0, 4), // x: 0, y: 4
                                      blurRadius: 4, // same as CSS blur
                                      spreadRadius: 0, // same as 0px in CSS
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  //   mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    AppTextRubik(
                                      'Booking Details',
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.black,
                                    ),
                                    2.hSpace(context),
                                    AppTextRubik(
                                      'To complete your private wedding album,\nplease confirm your payment details.',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.secondryTextColor,
                                    ),
                                    2.hSpace(context),
                                    Container(
                                      width: 400,
                                      height: 160,
                                      decoration: BoxDecoration(
                                        color: AppColor.whiteColor,
                                        border: Border.all(
                                          color: AppColor.blackColor
                                              .withOpacity(0.10),
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child:
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AppTextRubik(
                                                'Event Summary',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: AppColor.blackColor,
                                              ),

                                              EventRichText(
                                                label: 'Event:',
                                                title: 'Sara & Amir’s Wedding',
                                                color: Colors.black,
                                              ),
                                              EventRichText(
                                                label: 'Date & Time:',
                                                title: 'Aug 24, 2025  | 9:30PM',
                                                color: Colors.black,
                                              ),
                                              EventRichText(
                                                label: 'PIN:',
                                                title: '1234',
                                                color: Colors.black,
                                              ),
                                            ],
                                          ).paddingSymmetric(
                                            vertical: 20,
                                            horizontal: 20,
                                          ),
                                    ),
                                    12.hSpace(context),
                                    EventRichText(
                                      leadingIcon: AppIcons.check1,
                                      label:
                                          'Private wedding album in the app.',
                                      title:
                                          '\n      Guests upload and view photos with your\n      secure PIN.',
                                    ),
                                    SizedBox(height: Get.height * 0.02),
                                    EventRichText(
                                      leadingIcon: AppIcons.check1,
                                      label:
                                          'Personalized QR Code with decorative frames',
                                      title:
                                          '\n      Printed and ready for display at your wedding',
                                    ),
                                    SizedBox(height: Get.height * 0.02),
                                    EventRichText(
                                      leadingIcon: AppIcons.check1,
                                      label: 'On-site setup & organization',
                                      title:
                                          '\n      We deliver and place the QR code frames at\n      your event.',
                                    ),
                                    SizedBox(height: Get.height * 0.02),
                                    EventRichText(
                                      leadingIcon: AppIcons.check1,
                                      label: 'Full access for 6 months',
                                      title:
                                          '\n      Unlimited downloads and private storage for a\n      full year.',
                                    ),
                                  ],
                                ).paddingSymmetric(vertical: 30, horizontal: 30),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ).paddingSymmetric(vertical: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // 🔹 Payment selector row (Card / Apple Pay / Google Pay)
  Widget _buildPaymentSelector(BuildContext context) {
    final List<Map<String, dynamic>> paymentOptions = [
      {"label": "Card", "icon": null},
      {"label": "Pay", "icon": AppIcons.apple},
      {"label": "Pay", "icon": AppIcons.google},
    ];

    return Row(
      children: List.generate(paymentOptions.length, (index) {
        final option = paymentOptions[index];
        final isSelected = selectedPayment == index;

        return Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () => setState(() => selectedPayment = index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? AppColor.primaryColor : Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isSelected
                      ? AppColor.primaryColor
                      : AppColor.black.withOpacity(0.2),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (option["icon"] != null)
                    SvgPicture.asset(
                      option["icon"],
                      height: 24,
                      width: 24,
                      color: isSelected ? Colors.white : null,
                    ),
                  if (option["icon"] != null) const SizedBox(width: 8),
                  AppTextRubik(
                    option["label"],
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  // ---------------------------------------------------------------------------
  // 🔹 Left Side Card List
  Widget _buildLeftCardList() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColor.black.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: AppColor.blackColor.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(cards.length, (index) {
          final card = cards[index];
          final isSelected = selectedCardIndex == index;

          return InkWell(
            onTap: () => setState(() => selectedCardIndex = index),
            child: Column(
              children: [
                _buildCardRow(
                  brand: card["brand"] ?? "",
                  last4: card["last4"],
                  expiry: card["expiry"],
                  isSelected: isSelected,
                  index: index,
                  totalItems: cards.length,
                ),
                if (index != cards.length - 1)
                  const Divider(height: 1, color: Colors.grey),
              ],
            ),
          );
        }),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // 🔹 Card Row Widget
  Widget _buildCardRow({
    required String brand,
    String? last4,
    String? expiry,
    bool isSelected = false,
    required int index,
    required int totalItems,
  }) {
    BorderRadius borderRadius = BorderRadius.zero;
    if (isSelected) {
      if (index == 0) {
        borderRadius = const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        );
      } else if (index == totalItems - 1) {
        borderRadius = const BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        );
      }
    }

    return Container(
      decoration: BoxDecoration(
        color: isSelected ? AppColor.primaryColor : AppColor.whiteColor,
        borderRadius: borderRadius,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      child: Row(
        children: [
          if (brand.toLowerCase() == "visa")
            SvgPicture.asset(AppIcons.vCard, height: 28, width: 42)
          else if (brand.toLowerCase() == "mastercard")
            SvgPicture.asset(AppIcons.mCard, height: 28, width: 42)
          else
            Row(
              children: [
                SvgPicture.asset(
                  AppIcons.cash,
                  color: isSelected ? Colors.white : null,
                ),
                SizedBox(width: Get.width * 0.04),
                AppTextRubik(
                  'Cash',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: isSelected
                      ? AppColor.whiteColor
                      : AppColor.secondryTextColor,
                ),
              ],
            ),
          const SizedBox(width: 16),
          if (brand.toLowerCase() != "cash")
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (last4 != null)
                    AppTextRubik(
                      "**** **** **** $last4",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isSelected
                          ? AppColor.whiteColor
                          : AppColor.secondryTextColor,
                    ),
                  if (expiry != null) ...[
                    const SizedBox(height: 4),
                    AppTextRubik(
                      "Expires: $expiry",
                      fontSize: 14,
                      color: isSelected
                          ? AppColor.whiteColor
                          : AppColor.infoColor,
                    ),
                  ],
                ],
              ),
            )
          else
            const Spacer(),
          if (isSelected)
            const Icon(Icons.check, color: Colors.white, size: 24),
        ],
      ),
    );
  }
}
