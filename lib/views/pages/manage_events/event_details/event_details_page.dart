// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lahzat_web/constants/colors.dart';
import 'package:lahzat_web/views/pages/manage_events/event_details/details/details_page.dart';
import 'package:lahzat_web/views/pages/manage_events/event_details/photo_video/photo_video_page.dart';
import 'package:lahzat_web/views/pages/sideBar/sideBar_page.dart';
import 'package:lahzat_web/views/widgets/app_bar.dart';
import 'package:lahzat_web/views/widgets/app_button.dart';
import 'package:lahzat_web/views/widgets/app_text.dart';
import 'package:lahzat_web/views/widgets/extension_sizebox.dart';

class EventDetailsPage extends StatefulWidget {
  const EventDetailsPage({super.key});

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Tab> _tabs = const [
    Tab(text: 'Details'),
    Tab(text: 'Photos & Videos'),
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
      // initialIndex: widget.initialTab,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.bgColor,
      child: Column(
        children: [
          AppBarWidgets(),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: context.h * 0.3,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColor.black.withOpacity(.50),
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
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
                            Center(
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
                      Row(
                        children: [
                          Expanded(
                            child: TabBar(
                              controller: _tabController,
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
                              isScrollable: true,
                              tabs: _tabs,
                              onTap: (_) {
                                setState(() {});
                              },
                            ),
                          ),
                          Row(
                            children: [
                              AppButton(
                                width: context.w * 0.15,
                                height: 50,
                                radius: 16,
                                ontap: () {},
                                rowElements: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.phone,
                                      color: AppColor.whiteColor,
                                      size: 22,
                                    ),
                                    AppText(
                                      "+972 52 4630 364",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.whiteColor,
                                    ),
                                  ],
                                ),
                                // label: 'Sign in',
                                // txtClr: AppColors.white,
                                // txtSize: 16,
                                backgroundColor: AppColor.primaryColor,
                              ),
                              2.wSpace(context),
                              AppButton(
                                width: context.w * 0.1,
                                height: 50,
                                radius: 16,
                                ontap: () {},
                                rowElements: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/edit.svg",
                                      width: 17,
                                      height: 17,
                                    ),
                                    0.5.wSpace(context),
                                    AppText(
                                      "Edit Details",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.whiteColor,
                                    ),
                                  ],
                                ),

                                backgroundColor: AppColor.secondaryColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                      0.2.hSpace(context),
                      const Divider(
                        height: 1,
                        thickness: 1,
                        color: Color(0xffD1DBE8),
                      ),
                      2.hSpace(context),
                      _tabController.index == 0
                          ? DetailsPage()
                          : PhotoVideoPage(),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

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
