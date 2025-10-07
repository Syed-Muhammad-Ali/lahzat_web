import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lahzat_web/constants/icons.dart';
import 'package:lahzat_web/constants/images.dart';
import 'package:lahzat_web/views/widgets/app_textfield.dart';
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
          Container(
            height: 89,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(color: AppColor.primaryColor, width: 1),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Spacer(flex: 2),
                  Expanded(
                    flex: 5,
                    child: Align(
                      alignment: Alignment.center,
                      child: AppTextfield(
                        ctr: TextEditingController(),
                        hint: 'Search',
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
                    ),
                  ),
                  const Spacer(flex: 3),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(Appimage.p1, fit: BoxFit.cover),
                  ),
                ],
              ),
            ),
          ),

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
