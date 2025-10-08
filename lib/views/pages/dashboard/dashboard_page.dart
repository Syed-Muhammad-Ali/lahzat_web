import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lahzat_web/constants/icons.dart';
import 'package:lahzat_web/constants/images.dart';
import 'package:lahzat_web/views/widgets/app_bar.dart';
import 'package:lahzat_web/views/widgets/charts/category_bar_chart.dart';

import '../../../constants/colors.dart';
import '../../../controllers/dashboard_controller.dart';
import '../../widgets/app_text.dart';
import '../../widgets/cards/stats_card.dart';
import '../../widgets/charts/Event_Stats_Chart.dart';
import '../../widgets/custom_calender.dart';

class DashboardPage extends StatelessWidget {
  final controller = Get.put(DashboardController());
  DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double width = constraints.maxWidth;

            // 🔹 Define device breakpoints
            final bool isDesktop = width >= 1200;
            final bool isTablet = width >= 800 && width < 1200;
            final bool isMobile = width < 800;

            // 🔹 Adaptive grid columns for stats
            int gridColumns = 1;
            if (isDesktop) {
              gridColumns = 4;
            } else if (isTablet) {
              gridColumns = 2;
            }

            return Column(
              children: [
                // 🔹 HEADER BAR
                AppBarWidgets(),

                // 🔹 MAIN BODY
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 📊 Stats Grid
                        GetBuilder<DashboardController>(
                          builder: (_) {
                            return GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: gridColumns,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20,
                                    childAspectRatio: isMobile ? 1.5 : 1.7,
                                  ),
                              itemCount: controller.statslist.length,
                              itemBuilder: (context, index) {
                                final item = controller.statslist[index];
                                return StatsCard(item: item);
                              },
                            );
                          },
                        ),

                        const SizedBox(height: 30),

                        // 📈 Charts + Calendar
                        if (isMobile)
                          // 📱 Column layout for mobile
                          Column(
                            children: [
                              const EventStatsChart(),
                              const SizedBox(height: 20),
                              const CategoryBarChart(),
                              const SizedBox(height: 20),
                              _buildCreateEventCard(),
                              const SizedBox(height: 20),
                              const CustomCalendar(),
                            ],
                          )
                        else
                          // 💻 Row layout for Tablet & Desktop
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // 🟣 Left Section (Charts)
                              Expanded(
                                flex: 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxWidth: isDesktop ? 710 : width * 0.8,
                                        maxHeight: isDesktop
                                            ? 340
                                            : (isTablet ? 300 : 260),
                                      ),
                                      child: const EventStatsChart(),
                                    ),
                                    const SizedBox(height: 30),
                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxWidth: isDesktop ? 710 : width * 0.8,
                                        maxHeight: isDesktop
                                            ? 340
                                            : (isTablet ? 300 : 260),
                                      ),
                                      child: const CategoryBarChart(),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(width: 20),

                              // 🟢 Right Section (Sidebar)
                              Expanded(
                                flex: 3,
                                child: Column(
                                  children: [
                                    _buildCreateEventCard(),
                                    const SizedBox(height: 30),
                                    const CustomCalendar(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  /// 🎯 Create Event Card Widget
  Widget _buildCreateEventCard() {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(Appimage.dbBg),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  'Create Event',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 4),
                AppText(
                  'Create a new Event',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColor.ffc7c7c,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 50,
              width: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColor.whiteColor,
              ),
              child: Center(child: SvgPicture.asset(AppIcons.add)),
            ),
          ),
        ],
      ),
    );
  }
}
