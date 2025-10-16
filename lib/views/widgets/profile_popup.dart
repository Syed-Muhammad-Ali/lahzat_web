import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lahzat_web/constants/icons.dart';
import 'package:lahzat_web/views/pages/settings/settings_page.dart';
import 'package:lahzat_web/views/widgets/apptext_rubik.dart';
import 'package:lahzat_web/views/widgets/extension_sizebox.dart';

import '../../../constants/colors.dart';
import '../../constants/images.dart';

Future<void> profilePopup(BuildContext context) async {
  await showDialog(
    context: context,
    barrierDismissible: true, // allow closing by clicking outside
    builder: (context) {
      // ✅ Responsive dialog size setup
      final screenWidth = MediaQuery.of(context).size.width;
      final screenHeight = MediaQuery.of(context).size.height;

      // 🔹 Responsive width (min 300, max 400)
      final double dialogWidth =
          (screenWidth * 0.3 < 300
                  ? 300
                  : screenWidth * 0.3 > 400
                  ? 400
                  : screenWidth * 0.3)
              .toDouble();

      // 🔹 Responsive height (min 340, max 500)
      final double dialogHeight =
          (screenHeight * 0.5 < 340
                  ? 340
                  : screenHeight * 0.5 > 500
                  ? 500
                  : screenHeight * 0.5)
              .toDouble();

      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        insetPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        backgroundColor: const Color(0xFFFAFAF9),
        child: SizedBox(
          width: dialogWidth,
          height: dialogHeight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ✅ Profile Image
                  CircleAvatar(
                    radius: 42,
                    backgroundImage: AssetImage(Appimage.p1),
                    backgroundColor: AppColor.bgColor,
                  ),
                  1.hSpace(context),

                  // ✅ Name & Username
                  const AppTextRubik(
                    "Marry Jane",
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppColor.blackColor,
                  ),
                  const AppTextRubik(
                    "@marryjane",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColor.primaryColor,
                  ),

                  2.hSpace(context),
                  const Divider(color: Color(0xFFE5E7EB), thickness: 1),

                  // ✅ Settings Button
                  InkWell(
                    onTap: () {
                      Get.to(() => SettingsPage());
                    },
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.settings,
                            width: 22,
                            height: 22,
                          ),
                          // Icon(Icons.settings),
                          1.wSpace(context),
                          const AppTextRubik(
                            "Settings",
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppColor.blackColor,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const Divider(color: Color(0xFFE5E7EB), thickness: 1),

                  // ✅ Logout Button
                  InkWell(
                    // onTap: () {
                    //   Navigator.pop(context);
                    //   // TODO: handle logout
                    // },
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.logout,
                            width: 22,
                            height: 22,
                            color: Colors.red,
                          ),
                          // Icon(Icons.logout),
                          1.wSpace(context),
                          const AppTextRubik(
                            "Logout",
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
