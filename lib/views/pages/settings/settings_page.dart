import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:lahzat_web/constants/colors.dart';
import 'package:lahzat_web/constants/icons.dart';
import 'package:lahzat_web/views/pages/language/language_page.dart';
import 'package:lahzat_web/views/pages/profile/profile_page.dart';
import 'package:lahzat_web/views/widgets/app_button.dart';
import 'package:lahzat_web/views/widgets/apptext_rubik.dart';
import 'package:lahzat_web/views/widgets/extension_sizebox.dart';
import '../../widgets/app_bar_admin.dart';
import '../change_password/change_password_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final Color primaryColor = const Color(0xFF2F5D50);
  final Color borderColor = Colors.grey.shade400;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F8),
      body: Center(
        child: Column(
          children: [
            /// 🔹 Reusable Admin AppBar
            const AppBarAdmin(),

            2.hSpace(context),
            Row(
              children: [
                SvgPicture.asset(AppIcons.backButton),
                2.wSpace(context),
                AppTextRubik(
                  'Settings',
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: AppColor.black,
                ),
                const Spacer(),
                AppButton(label: 'Delete Account', bgColor: AppColor.darkred),
              ],
            ).paddingSymmetric(vertical: 0, horizontal: 120),

            /// 🔹 Custom Tab Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 200, vertical: 0),
              child: Row(
                children: [
                  _buildTabButton('Profile', 0),
                  const SizedBox(width: 10),
                  _buildTabButton('Language', 1),
                  const SizedBox(width: 10),
                  _buildTabButton('Change Password', 2),
                ],
              ),
            ),

            /// 🔹 Tab Content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [ProfilePage(), LanguagePage(), ChangePasswordPage()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔸 Custom Tab Button (like your screenshot)
  Widget _buildTabButton(String title, int index) {
    bool isSelected = _tabController.index == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _tabController.index = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: isSelected ? primaryColor : borderColor),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey.shade700,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
