import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lahzat_web/constants/colors.dart';
import 'package:lahzat_web/constants/icons.dart';
import 'package:lahzat_web/controllers/profile_tab_controller.dart';
import 'package:lahzat_web/views/pages/create_new_event/create_new_event_page.dart';
import 'package:lahzat_web/views/widgets/app_bar_admin.dart';
import 'package:lahzat_web/views/widgets/app_button.dart';
import 'package:lahzat_web/views/widgets/app_textfield.dart';
import 'package:lahzat_web/views/widgets/apptext_rubik.dart';
import 'package:lahzat_web/views/widgets/extension_sizebox.dart';

import '../../../constants/images.dart';
import 'attended_event/attended_event_page.dart';

class EventListPage extends StatelessWidget {
  final controller = Get.put(TabControllerX());
  EventListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: Column(
        children: [
          AppBarAdmin(
            onTap: () {
              showProfilePopup(context);
            },
          ),

          // Header Section
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left Side (Titles)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextRubik(
                      'Manage Events',
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: AppColor.black,
                    ),
                    AppTextRubik(
                      'Manage all the events',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColor.black,
                    ),
                  ],
                ),

                // Right Side (Add Button)
                AppButton(
                  ontap: () {
                    Get.to(() => CreateNewEventPage());
                  },
                  rowElements: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppIcons.add,
                        height: 24,
                        color: AppColor.whiteColor,
                      ),
                      const SizedBox(width: 8),
                      AppTextRubik(
                        'Manage Events',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Main Tabs Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  color: AppColor.whiteColor,
                ),
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // ✅ TabBar inside fixed-width Row (50/50 tabs)
                            SizedBox(
                              width: 400, // Adjust based on your layout needs
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                  splashFactory: NoSplash.splashFactory,
                                ),
                                child: TabBar(
                                  controller: controller.tabController,
                                  labelColor: AppColor.primaryColor,
                                  unselectedLabelColor: AppColor.ffd9d9d9d,
                                  indicatorColor: AppColor.primaryColor,
                                  dividerColor: AppColor.ffd9d9d9d,
                                  indicatorWeight: 2,
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  labelStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  unselectedLabelStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  tabs: [
                                    SizedBox(
                                      width: 200, // 50%
                                      child: const Tab(text: 'Attended Events'),
                                    ),
                                    SizedBox(
                                      width: 200, // 50%
                                      child: const Tab(text: 'My Events'),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const Spacer(),

                            // ✅ Search Field on Right
                            SizedBox(
                              width: 250,
                              //   height: 40,
                              child: AppTextfield(
                                ctr: TextEditingController(),
                                borderColor: AppColor.black,
                                hint: 'Search events...',
                              ),
                            ),
                          ],
                        ),
                      ),

                      // ✅ Tab Content Section
                      Expanded(
                        child: TabBarView(
                          controller: controller.tabController,
                          children: [
                            AttendedEventPage(),
                            Center(child: Text("My Events")),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> showProfilePopup(BuildContext context) async {
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
        backgroundColor: AppColor.baseColor,
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
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.secondryTextColor,
                  ),
                  1.hSpace(context),
                  const AppTextRubik(
                    "marryjane@gmail.com",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.secondryTextColor,
                  ),
                  1.hSpace(context),
                  const AppTextRubik(
                    "@+236542378422",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.secondryTextColor,
                  ),
                  1.hSpace(context),
                  AppButton(label: 'Edit Profile'),

                  2.hSpace(context),
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
                          SvgPicture.asset(AppIcons.logout, color: Colors.red),
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
