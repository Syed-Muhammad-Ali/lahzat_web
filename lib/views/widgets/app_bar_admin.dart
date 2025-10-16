// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lahzat_web/constants/icons.dart';
import 'package:lahzat_web/views/widgets/apptext_rubik.dart';

import '../../../constants/colors.dart';
import '../../constants/images.dart';

class AppBarAdmin extends StatelessWidget {
  final Function()? onTap;
  const AppBarAdmin({super.key, this.onTap});

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
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(Appimage.appimg3),

            /// 👤 Profile Picture
            GestureDetector(
              onTap: onTap,
              child: Row(
                children: [
                  Container(
                    height: isMobile ? 40 : 48,
                    width: isMobile ? 40 : 48,
                    margin: EdgeInsets.only(left: isMobile ? 10 : 16),
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset(Appimage.p1, fit: BoxFit.cover),
                  ),
                  SizedBox(width: Get.width * 0.01),
                  AppTextRubik(
                    'Marry Jane',
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: AppColor.secondryTextColor,
                  ),
                  SizedBox(width: Get.width * 0.01),
                  SvgPicture.asset(AppIcons.dropIcon),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
