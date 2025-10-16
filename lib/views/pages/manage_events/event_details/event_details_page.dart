// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lahzat_web/constants/colors.dart';
import 'package:lahzat_web/constants/icons.dart';
import 'package:lahzat_web/constants/variables.dart';
import 'package:lahzat_web/views/pages/manage_events/event_details/details/details_page.dart';
import 'package:lahzat_web/views/pages/manage_events/event_details/photo_video/photo_video_page.dart';
import 'package:lahzat_web/views/pages/sideBar/sideBar_page.dart';
import 'package:lahzat_web/views/widgets/app_bar.dart';
import 'package:lahzat_web/views/widgets/app_bar_admin.dart';
import 'package:lahzat_web/views/widgets/app_button.dart';
import 'package:lahzat_web/views/widgets/app_text.dart';
import 'package:lahzat_web/views/widgets/apptext_rubik.dart';
import 'package:lahzat_web/views/widgets/extension_sizebox.dart';

import '../../album/album_page.dart';
import '../../album/create_new_album_dialog.dart';

class EventDetailsPage extends StatefulWidget {
  const EventDetailsPage({super.key});

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage>
    with SingleTickerProviderStateMixin {
  late List<Tab> _tabs;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    // ✅ Build tab list dynamically based on flavour
    if (Variables.flavour == 'user') {
      _tabs = const [Tab(text: 'Details'), Tab(text: 'Photos & Videos')];
    } else {
      _tabs = const [
        Tab(text: 'Details'),
        Tab(text: 'Photos & Videos'),
        Tab(text: 'Albums'),
      ];
    }

    _tabController = TabController(length: _tabs.length, vsync: this);

    // 👇 Listen for tab changes
    _tabController.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor.bgColor,
        child: Column(
          children: [
            Variables.flavour == 'user' ? const AppBarWidgets() : AppBarAdmin(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    // ✅ Top Banner
                    Container(
                      height: context.h * 0.3,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/wedding_bg.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColor.black.withOpacity(.50),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          Positioned(
                            top: 40,
                            left: 16,
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    final sidebarState = context
                                        .findAncestorStateOfType<
                                          SidebarPageState
                                        >();
                                    if (sidebarState != null) {
                                      sidebarState.closeChildPage();
                                      sidebarState.selectedIndex = 1;
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                ),
                                const SizedBox(width: 2),
                                const AppText(
                                  "Back",
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          const Center(
                            child: AppText(
                              "Sarah & Alex's Wedding",
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),

                    2.hSpace(context),

                    // ✅ Tab bar + Button Row
                    Row(
                      children: [
                        Expanded(
                          child: TabBar(
                            controller: _tabController,
                            isScrollable: true,
                            labelPadding: const EdgeInsets.only(right: 34),
                            labelColor: AppColor.primaryColor,
                            unselectedLabelColor: AppColor.blackColor,
                            labelStyle: GoogleFonts.rubik(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                            unselectedLabelStyle: GoogleFonts.rubik(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                            indicator: PrimaryTabIndicator(),
                            dividerColor: Colors.transparent,
                            tabs: _tabs,
                            onTap: (_) => setState(() {}),
                          ),
                        ),

                        // ✅ Conditional right-side button when on "Albums" tab
                        if (Variables.flavour != 'user' &&
                            _tabController.index == 2)
                          AppButton(
                            width: context.w * 0.17,
                            height: 50,
                            radius: 16,
                            bgColor: AppColor.primaryColor,
                            ontap: () {
                              createNewAlbumDialog(context);
                            },
                            rowElements: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  AppIcons.add,
                                  color: AppColor.whiteColor,
                                  height: 16,
                                ),
                                SizedBox(width: Get.width * 0.01),
                                const AppTextRubik(
                                  "Create New Album",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),

                        // ✅ Right-side buttons for "user"
                        if (Variables.flavour == 'user') ...[
                          AppButton(
                            width: context.w * 0.17,
                            height: 50,
                            radius: 16,
                            ontap: () {},
                            rowElements: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                  size: 22,
                                ),
                                0.5.wSpace(context),
                                const AppText(
                                  "+972 52 4630 364",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            bgColor: AppColor.primaryColor,
                          ),
                          2.wSpace(context),
                          AppButton(
                            width: context.w * 0.12,
                            height: 50,
                            radius: 16,
                            ontap: () {},
                            rowElements: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/edit.svg",
                                  width: 17,
                                  height: 17,
                                ),
                                0.3.wSpace(context),
                                const AppText(
                                  "Edit Details",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            bgColor: AppColor.secondaryColor,
                          ),
                        ],
                      ],
                    ),

                    0.2.hSpace(context),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Color(0xffD1DBE8),
                    ),

                    // ✅ Tab content area
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: Variables.flavour == 'user'
                            ? [const DetailsPage(), const PhotoVideoPage()]
                            : [
                                const DetailsPage(),
                                const PhotoVideoPage(),
                                AlbumPage(),
                              ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ✅ Custom Tab Indicator
class PrimaryTabIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _PrimaryColorPainter();
  }
}

class _PrimaryColorPainter extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Rect rect =
        Offset(offset.dx, cfg.size!.height - 3) & Size(cfg.size!.width, 2);
    final Paint paint = Paint()
      ..color = AppColor.primaryColor
      ..style = PaintingStyle.fill;
    canvas.drawRect(rect, paint);
  }
}
