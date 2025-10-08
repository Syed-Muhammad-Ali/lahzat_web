import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lahzat_web/views/widgets/app_bar.dart';
import 'package:lahzat_web/views/widgets/charts/category_bar_chart.dart';

import '../../../constants/colors.dart';
import '../../../controllers/dashboard_controller.dart';
import '../../widgets/cards/stats_card.dart';
import '../../widgets/charts/Event_Stats_Chart.dart';

class DashboardPage extends StatelessWidget {
  final controller = Get.put(DashboardController());
  DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.bgColor,
      child: Column(
        children: [
          // 🔹 HEADER BAR
          AppBarWidgets(),

          // 🔹 MAIN BODY
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                double width = constraints.maxWidth;

                // 🧩 Define number of columns based on screen width
                int crossAxisCount = 1; // Mobile default
                if (width > 1200) {
                  crossAxisCount = 4; // Desktop
                } else if (width > 800) {
                  crossAxisCount = 2; // Tablet
                }

                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 🧮 STATS CARDS GRID
                      GetBuilder<DashboardController>(
                        builder: (_) {
                          return GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: crossAxisCount,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20,
                                  childAspectRatio: 1.7,
                                ),
                            itemCount: controller.statslist.length,
                            itemBuilder: (context, index) {
                              final item = controller.statslist[index];
                              return StatsCard(item: item);
                            },
                          );
                        },
                      ),

                      const SizedBox(height: 10),

                      // 📊 EVENT STATS CHART
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: width > 1200
                              ? 710
                              : width > 800
                              ? width * 0.85
                              : width * 0.95,
                          maxHeight: width > 1100
                              ? 340
                              : width > 800
                              ? 300
                              : 260,
                        ),
                        child: const EventStatsChart(),
                      ),
                      SizedBox(height: Get.height * 0.04),
                      // 📊 CATEGORY BAR CHART
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: width > 1200
                              ? 710
                              : width > 800
                              ? width * 0.85
                              : width * 0.95,
                          maxHeight: width > 1100
                              ? 340
                              : width > 800
                              ? 300
                              : 260,
                        ),
                        child: const CategoryBarChart(),
                      ),
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
