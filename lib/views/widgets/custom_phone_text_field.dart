// import 'package:flutter/material.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:lahzat_web/views/widgets/app_text.dart';

// import '../../constants/colors.dart';

// class CustomPhoneNumberField extends StatelessWidget {
//   final String? title;
//   final Color? titleColor;
//   final double? titleSize;
//   final TextEditingController? controller;
//   final Color? filledColor;

//   const CustomPhoneNumberField({
//     super.key,
//     this.title,
//     this.titleColor,
//     this.titleSize,
//     this.controller,
//     this.filledColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         AppText(
//           title ?? '',
//           fontSize: titleSize ?? 14,
//           fontWeight: FontWeight.w500,
//           color: titleColor ?? AppColor.blackColor,
//         ),
//         SizedBox(height: title != null ? 6 : 0),
//         Theme(
//           data: Theme.of(context).copyWith(
//             dialogTheme: DialogThemeData(backgroundColor: Colors.white),
//           ),
//           child: IntlPhoneField(
//             controller: controller,
//             initialCountryCode: 'US',
//             decoration: InputDecoration(
//               hintText: '333 000 0000',
//               filled: true,
//               fillColor: filledColor ?? AppColor.filledColor,
//               hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//                 borderSide: const BorderSide(color: Colors.grey),
//               ),
//               isDense: false,
//             ),

//             disableLengthCheck: true,
//             // flagsButtonPadding: const EdgeInsets.only(left: 8),
//             onChanged: (phone) {},
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lahzat_web/views/widgets/app_text.dart';
import '../../constants/colors.dart';

class CustomPhoneNumberField extends StatelessWidget {
  final String? title;
  final bool showAsterisk; // optional * for required fields
  final Color? titleColor;
  final double? titleSize;
  final TextEditingController? controller;
  final Color? filledColor;
  final String? hintText;
  final String? initialCountry;

  const CustomPhoneNumberField({
    super.key,
    this.title,
    this.showAsterisk = false,
    this.titleColor,
    this.titleSize,
    this.controller,
    this.filledColor,
    this.hintText,
    this.initialCountry = 'US',
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;
    final bool isTablet = screenWidth >= 600 && screenWidth < 1100;

    final double responsiveFontSize = isMobile
        ? 13
        : isTablet
        ? 14
        : 16;
    final double inputHeight = isMobile ? 52 : 56;
    final double hintFontSize = isMobile ? 14 : 16;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null && title!.isNotEmpty) ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText(
                title!,
                fontSize: titleSize ?? responsiveFontSize,
                fontWeight: FontWeight.w500,
                color: titleColor ?? AppColor.blackColor,
              ),
              if (showAsterisk)
                const Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Text(
                    "*",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 6),
        ],

        // 📞 IntlPhoneField
        SizedBox(
          height: inputHeight,
          child: IntlPhoneField(
            controller: controller,
            initialCountryCode: initialCountry ?? 'US',
            dropdownIconPosition: IconPosition.trailing,
            flagsButtonPadding: const EdgeInsets.only(left: 12),
            dropdownTextStyle: TextStyle(fontSize: hintFontSize),
            decoration: InputDecoration(
              hintText: hintText ?? '333 000 0000',
              filled: true,
              fillColor: filledColor ?? AppColor.filledColor,
              hintStyle: TextStyle(
                color: Colors.grey[600],
                fontSize: hintFontSize,
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: isMobile ? 10 : 14,
                horizontal: isMobile ? 12 : 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColor.primaryColor),
              ),
            ),
            disableLengthCheck: true,
            onChanged: (phone) {},
          ),
        ),
      ],
    );
  }
}
