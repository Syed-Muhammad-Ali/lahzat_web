// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lahzat_web/constants/colors.dart';
import 'package:lahzat_web/constants/icons.dart';
import 'package:lahzat_web/constants/images.dart';
import 'package:lahzat_web/views/pages/dashboard/dashboard_page.dart';
import 'package:lahzat_web/views/pages/manage_events/manage_events_page.dart';
import 'package:lahzat_web/views/pages/promo_code/promo_code_page.dart';
import 'package:lahzat_web/views/widgets/app_text.dart';

class SidebarPage extends StatefulWidget {
  const SidebarPage({super.key});

  @override
  State<SidebarPage> createState() => SidebarPageState();
}

class SidebarPageState extends State<SidebarPage> {
  final _pages = [DashboardPage(), ManageEventsPage(), PromoCodePage()];

  int selectedIndex = 0;
  bool isCollapsed = false;
  Widget? childPage;

  void openChildPage(Widget page) {
    setState(() {
      childPage = page;
    });
  }

  void closeChildPage() {
    setState(() {
      childPage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;

        if (width < 700) {
          return _buildMobileLayout(); // 📱
        } else if (width < 1100) {
          return _buildTabletLayout(); // 📲
        } else {
          return _buildDesktopLayout(); // 🖥️
        }
      },
    );
  }

  // ------------------ 📱 MOBILE ------------------
  Widget _buildMobileLayout() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const AppText("Dashboard"),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: AppColor.primaryColor,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(child: _buildSidebarContent(context, isDrawer: true)),
              _buildLogoutButton(isCollapsed: false),
            ],
          ),
        ),
      ),
      body: _pages[selectedIndex],
    );
  }

  // ------------------ 📲 TABLET ------------------
  Widget _buildTabletLayout() {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: isCollapsed ? 80 : 220,
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                      isCollapsed
                          ? Icons.keyboard_double_arrow_right
                          : Icons.keyboard_double_arrow_left,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() => isCollapsed = !isCollapsed);
                    },
                  ),
                ),
                Expanded(
                  child: _buildSidebarContent(
                    context,
                    isCollapsed: isCollapsed,
                  ),
                ),
                _buildLogoutButton(isCollapsed: isCollapsed),
              ],
            ),
          ),
          Expanded(
            child: Container(color: Colors.white, child: _pages[selectedIndex]),
          ),
        ],
      ),
    );
  }

  // ------------------ 🖥️ DESKTOP ------------------
  Widget _buildDesktopLayout() {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Column(
                children: [
                  Expanded(child: _buildSidebarContent(context)),
                  _buildLogoutButton(isCollapsed: false),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              color: Colors.white,
              child: childPage ?? _pages[selectedIndex],
            ),
          ),
        ],
      ),
    );
  }

  // ------------------ COMMON SIDEBAR CONTENT ------------------
  // Widget _buildSidebarContent(
  //   BuildContext context, {
  //   bool isDrawer = false,
  //   bool isCollapsed = false,
  // }) {
  //   return SingleChildScrollView(
  //     child: Column(
  //       crossAxisAlignment: isCollapsed
  //           ? CrossAxisAlignment.center
  //           : CrossAxisAlignment.start,
  //       children: [
  //         const SizedBox(height: 30),
  //         sideBarTab(AppIcons.dBoard, "Dashboard", 0, isDrawer, isCollapsed),
  //         sideBarTab(
  //           AppIcons.product,
  //           "Manage Events",
  //           1,
  //           isDrawer,
  //           isCollapsed,
  //         ),
  //         sideBarTab(AppIcons.promo, "Promo Code", 2, isDrawer, isCollapsed),
  //       ],
  //     ),
  //   );
  // }
  Widget _buildSidebarContent(
    BuildContext context, {
    bool isDrawer = false,
    bool isCollapsed = false,
  }) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: isCollapsed
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          // 🖼️ Add your image / logo at the top
          Center(
            child: isCollapsed
                ? Image.asset(
                    Appimage.applogo, // your small icon for collapsed mode
                    height: 120,
                  )
                : Column(
                    children: [
                      Image.asset(Appimage.applogo, height: 150),
                      const SizedBox(height: 10),
                    ],
                  ),
          ),

          const SizedBox(height: 30),

          // Your navigation items
          sideBarTab(AppIcons.dBoard, "Dashboard", 0, isDrawer, isCollapsed),
          sideBarTab(
            AppIcons.product,
            "Manage Events",
            1,
            isDrawer,
            isCollapsed,
          ),
          sideBarTab(AppIcons.promo, "Promo Code", 2, isDrawer, isCollapsed),
        ],
      ),
    );
  }

  // ------------------ SIDEBAR TAB ------------------
  Widget sideBarTab(
    String icon,
    String title,
    int index,
    bool isDrawer,
    bool isCollapsed,
  ) {
    final isSelected = selectedIndex == index && childPage == null;
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        if (isDrawer) Navigator.pop(context);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        decoration: isSelected
            ? BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(8),
              )
            : null,
        child: Row(
          mainAxisAlignment: isCollapsed
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              icon,
              color: isSelected ? AppColor.primaryColor : AppColor.whiteColor,
              height: 20,
              width: 20,
            ),
            if (!isCollapsed) ...[
              const SizedBox(width: 12),
              AppText(
                title,
                color: isSelected ? AppColor.primaryColor : AppColor.whiteColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ],
          ],
        ),
      ),
    );
  }

  // ------------------ LOGOUT BUTTON ------------------
  Widget _buildLogoutButton({required bool isCollapsed}) {
    return InkWell(
      onTap: _handleLogout,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.20),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: isCollapsed
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              AppIcons.logout,
              color: AppColor.whiteColor,
              height: 20,
              width: 20,
            ),
            if (!isCollapsed) ...[
              const SizedBox(width: 12),
              const AppText("Logout", color: AppColor.whiteColor, fontSize: 13),
            ],
          ],
        ),
      ),
    );
  }

  void _handleLogout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirm Logout"),
        content: const Text("Are you sure you want to log out?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // TODO: implement your logout logic here (e.g. navigate to login)
              debugPrint("User logged out!");
            },
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }
}
