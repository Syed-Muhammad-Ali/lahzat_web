// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lahzat_web/constants/icons.dart';
import 'package:lahzat_web/constants/images.dart';
import 'package:lahzat_web/views/widgets/app_textfield.dart';
import '../../../constants/colors.dart';

class AppBarWidgets extends StatelessWidget {
  const AppBarWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    // ✅ Define breakpoints
    final bool isMobile = screenWidth < 600;
    final bool isTablet = screenWidth >= 600 && screenWidth < 1024;
    final bool isDesktop = screenWidth >= 1024;

    return Container(
      height: 89,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: AppColor.primaryColor, width: 1),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile
            ? 12
            : isTablet
            ? 24
            : 40,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!isMobile) const Spacer(flex: 2),

          /// 🔍 Search Field
          Expanded(
            flex: isMobile
                ? 8
                : isTablet
                ? 6
                : 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppTextfield(
                  ctr: TextEditingController(),
                  hint: 'Search',
                  radius: 12,
                  filledColor: Colors.grey.shade100,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset(
                      AppIcons.search,
                      color: Colors.black,
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),

          if (!isMobile) const Spacer(flex: 3),

          /// 👤 Profile Picture
          Container(
            height: isMobile ? 40 : 48,
            width: isMobile ? 40 : 48,
            margin: EdgeInsets.only(left: isMobile ? 10 : 16),
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Image.asset(Appimage.p1, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
