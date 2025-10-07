import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lahzat_web/views/widgets/app_text.dart';
import '../../../constants/colors.dart';
import '../../../constants/icons.dart';

class CategoryBarChart extends StatelessWidget {
  const CategoryBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    final double fontSize = 14; // Fixed font size, you can adjust

    return Center(
      child: Container(
        width: 710, // fixed width
        height: 340, // fixed height
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ), // vertical padding only
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Header Row
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 0,
              ), // removed horizontal padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    'Categories',
                    fontSize: fontSize + 1,
                    fontWeight: FontWeight.w600,
                    color: AppColor.blackColor,
                  ),
                  Container(
                    height: 32,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.withOpacity(0.25),
                    ),
                    child: Row(
                      children: [
                        AppText(
                          'This week',
                          fontSize: fontSize,
                          fontWeight: FontWeight.w400,
                        ),
                        const SizedBox(width: 6),
                        SvgPicture.asset(AppIcons.downArrow, height: 14),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 🔹 Bar Chart
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 0,
                ), // removed horizontal padding
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    borderData: FlBorderData(show: false),
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      horizontalInterval: 5000,
                      getDrawingHorizontalLine: (value) => FlLine(
                        color: Colors.grey.withOpacity(0.3),
                        strokeWidth: 1,
                      ),
                    ),
                    titlesData: FlTitlesData(
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 35,
                          interval: 5000,
                          getTitlesWidget: (value, _) {
                            if (value % 5000 == 0 && value <= 20000) {
                              return Text(
                                '${(value / 1000).toInt()}k',
                                style: TextStyle(
                                  fontSize: fontSize - 1,
                                  color: Colors.grey[700],
                                ),
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, _) {
                            const labels = [
                              'Wedding',
                              'Engagement',
                              'Birthday',
                              'Baby shower',
                              'Anniversary',
                              'Others',
                            ];
                            if (value.toInt() < labels.length) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  labels[value.toInt()],
                                  style: TextStyle(
                                    fontSize: fontSize - 1,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                      ),
                    ),
                    barGroups: [
                      _makeGroup(0, 20000),
                      _makeGroup(1, 16000),
                      _makeGroup(2, 12000),
                      _makeGroup(3, 20000),
                      _makeGroup(4, 14000),
                      _makeGroup(5, 7000),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BarChartGroupData _makeGroup(int x, double value) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          color: AppColor.primaryColor,
          width: 28,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
        ),
      ],
    );
  }
}

// // import 'package:flutter_svg/flutter_svg.dart';
// // import 'package:get/get.dart';
// // import 'package:lahzat_web/constants/icons.dart';
// import 'package:lahzat_web/constants/images.dart';
// import 'package:lahzat_web/views/widgets/app_text.dart';
// import 'package:lahzat_web/views/widgets/app_textfield.dart';
// import 'package:lahzat_web/views/widgets/charts/category_bar_chart.dart';
// import '../../../constants/colors.dart';
// import '../../../controllers/dashboard_controller.dart';
// import '../../widgets/cards/stats_card.dart';
// import '../../widgets/charts/Event_Stats_Chart.dart';

// class DashboardPage extends StatelessWidget {
//   final controller = Get.put(DashboardController());
//   DashboardPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: AppColor.bgColor,
//       child: Column(
//         children: [
//           // 🔹 HEADER BAR
//           Container(
//             height: 89,
//             width: double.infinity,
//             alignment: Alignment.center,
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               border: Border(
//                 bottom: BorderSide(color: AppColor.primaryColor, width: 1),
//               ),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Row(
//                 children: [
//                   const Spacer(flex: 2),
//                   Expanded(
//                     flex: 5,
//                     child: Align(
//                       alignment: Alignment.center,
//                       child: AppTextfield(
//                         ctr: TextEditingController(),
//                         hint: 'Search',
//                         suffixIcon: Padding(
//                           padding: const EdgeInsets.all(10),
//                           child: SvgPicture.asset(
//                             AppIcons.search,
//                             color: Colors.black,
//                             height: 20,
//                             width: 20,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const Spacer(flex: 3),
//                   Container(
//                     height: 50,
//                     width: 50,
//                     decoration: const BoxDecoration(shape: BoxShape.circle),
//                     clipBehavior: Clip.antiAlias,
//                     child: Image.asset(Appimage.p1, fit: BoxFit.cover),
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           // 🔹 MAIN BODY
//           Expanded(
//             child: LayoutBuilder(
//               builder: (context, constraints) {
//                 double width = constraints.maxWidth;

//                 int crossAxisCount = 1; // Default: mobile
//                 if (width > 1200) {
//                   crossAxisCount = 4; // Desktop
//                 } else if (width > 800) {
//                   crossAxisCount = 2; // Tablet
//                 }

//                 return SingleChildScrollView(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 20,
//                     vertical: 20,
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // 🧮 STATS CARDS GRID
//                       GetBuilder<DashboardController>(
//                         builder: (_) {
//                           return GridView.builder(
//                             shrinkWrap: true,
//                             physics: const NeverScrollableScrollPhysics(),
//                             gridDelegate:
//                                 SliverGridDelegateWithFixedCrossAxisCount(
//                                   crossAxisCount: crossAxisCount,
//                                   crossAxisSpacing: 20,
//                                   mainAxisSpacing: 20,
//                                   childAspectRatio: 1.7,
//                                 ),
//                             itemCount: controller.statslist.length,
//                             itemBuilder: (context, index) {
//                               final item = controller.statslist[index];
//                               return StatsCard(item: item);
//                             },
//                           );
//                         },
//                       ),

//                       const SizedBox(height: 10),

//                       // 📊 EVENT STATS CHART + RIGHT CONTAINER
//                       // Row(
//                       //   crossAxisAlignment: CrossAxisAlignment.start,
//                       //   mainAxisAlignment: MainAxisAlignment.center,
//                       //   children: [
//                       //     // 🔹 Event Stats Chart (Left)
//                       //     ConstrainedBox(
//                       //       constraints: BoxConstraints(
//                       //         maxWidth: width > 1200
//                       //             ? 710
//                       //             : width > 800
//                       //             ? width * 0.85
//                       //             : width * 0.95,
//                       //         maxHeight: width > 1100
//                       //             ? 340
//                       //             : width > 800
//                       //             ? 300
//                       //             : 260,
//                       //       ),
//                       //       child: const EventStatsChart(),
//                       //     ),

//                       //     const SizedBox(width: 20),

//                       //     // 🔹 Right Side Container
//                       //     Container(
//                       //       width: 412,
//                       //       height: 96,
//                       //       decoration: BoxDecoration(
//                       //         color: AppColor.whiteColor,
//                       //         borderRadius: BorderRadius.circular(12),
//                       //         image: DecorationImage(
//                       //           image: AssetImage(Appimage.dbBg),
//                       //         ),
//                       //         boxShadow: [
//                       //           BoxShadow(
//                       //             color: Colors.black.withOpacity(0.05),
//                       //             blurRadius: 8,
//                       //             offset: const Offset(0, 4),
//                       //           ),
//                       //         ],
//                       //       ),
//                       //       padding: const EdgeInsets.all(16),
//                       //       child: Row(
//                       //         children: [
//                       //           const SizedBox(width: 12),
//                       //           Expanded(
//                       //             child: Column(
//                       //               crossAxisAlignment:
//                       //                   CrossAxisAlignment.start,
//                       //               mainAxisAlignment: MainAxisAlignment.center,
//                       //               children: [
//                       //                 AppText(
//                       //                   'Create Event',
//                       //                   fontSize: 18,
//                       //                   fontWeight: FontWeight.w600,
//                       //                 ),
//                       //                 SizedBox(height: Get.height * 0.01),
//                       //                 AppText(
//                       //                   'Create a new Event',
//                       //                   fontSize: 14,
//                       //                   fontWeight: FontWeight.w400,
//                       //                   color: AppColor.ffc7c7c,
//                       //                 ),
//                       //               ],
//                       //             ),
//                       //           ),
//                       //           GestureDetector(
//                       //             child: Container(
//                       //               height: 52,
//                       //               width: 45,
//                       //               decoration: BoxDecoration(
//                       //                 borderRadius: BorderRadius.circular(12),
//                       //                 color: AppColor.whiteColor,
//                       //               ),
//                       //               child: Center(
//                       //                 child: SvgPicture.asset(AppIcons.add),
//                       //               ),
//                       //             ),
//                       //           ),
//                       //         ],
//                       //       ),
//                       //     ),
//                       //   ],
//                       // ),
//                       // 📊 EVENT STATS CHART + RIGHT CONTAINER
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           // 🔹 Event Stats Chart (Left)
//                           ConstrainedBox(
//                             constraints: BoxConstraints(
//                               maxWidth: width > 1200
//                                   ? 710
//                                   : width > 800
//                                   ? width * 0.85
//                                   : width * 0.95,
//                               maxHeight: width > 1100
//                                   ? 340
//                                   : width > 800
//                                   ? 300
//                                   : 260,
//                             ),
//                             child: const EventStatsChart(),
//                           ),

//                           const SizedBox(width: 20),

//                           // 🔹 Right Side Container + Calendar
//                           Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               // 🟢 Create Event Box
//                               Container(
//                                 width: 412,
//                                 height: 96,
//                                 decoration: BoxDecoration(
//                                   color: AppColor.whiteColor,
//                                   borderRadius: BorderRadius.circular(12),
//                                   image: DecorationImage(
//                                     image: AssetImage(Appimage.dbBg),
//                                   ),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.black.withOpacity(0.05),
//                                       blurRadius: 8,
//                                       offset: const Offset(0, 4),
//                                     ),
//                                   ],
//                                 ),
//                                 padding: const EdgeInsets.all(16),
//                                 child: Row(
//                                   children: [
//                                     const SizedBox(width: 12),
//                                     Expanded(
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           AppText(
//                                             'Create Event',
//                                             fontSize: 18,
//                                             fontWeight: FontWeight.w600,
//                                           ),
//                                           SizedBox(height: Get.height * 0.01),
//                                           AppText(
//                                             'Create a new Event',
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w400,
//                                             color: AppColor.ffc7c7c,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     GestureDetector(
//                                       child: Container(
//                                         height: 52,
//                                         width: 45,
//                                         decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(
//                                             12,
//                                           ),
//                                           color: AppColor.whiteColor,
//                                         ),
//                                         child: Center(
//                                           child: SvgPicture.asset(AppIcons.add),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),

//                               const SizedBox(height: 16),

//                               // 🟣 Custom Calendar directly below
//                               SizedBox(width: 412, child: CustomCalendar()),
//                             ],
//                           ),
//                         ],
//                       ),

//                       // 📊 CATEGORY BAR CHART + CALENDAR SIDE BY SIDE
//                       ConstrainedBox(
//                         constraints: BoxConstraints(
//                           maxWidth: width > 1200
//                               ? 710
//                               : width > 800
//                               ? width * 0.85
//                               : width * 0.95,
//                           maxHeight: width > 1100
//                               ? 340
//                               : width > 800
//                               ? 300
//                               : 260,
//                         ),
//                         child: const CategoryBarChart(),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // 🔹 CUSTOM CALENDAR WIDGET
// class CustomCalendar extends StatelessWidget {
//   const CustomCalendar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final double width = constraints.maxWidth;
//         final bool isMobile = width < 700;
//         final bool isTablet = width >= 700 && width < 1100;

//         final double fontSize = isMobile ? 12 : 15;
//         final double titleFontSize = isMobile ? 18 : 24;
//         final double dateFontSize = isMobile ? 14 : 16;

//         return Container(
//           padding: EdgeInsets.symmetric(
//             horizontal: isMobile ? 10 : 16,
//             vertical: isMobile ? 8 : 12,
//           ),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(16),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.05),
//                 blurRadius: 8,
//                 offset: const Offset(0, 4),
//               ),
//             ],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               // 🔹 Date + Today Row
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "April 11, 2021",
//                     style: TextStyle(
//                       color: Colors.grey[700],
//                       fontSize: dateFontSize,
//                       decoration: TextDecoration.underline,
//                       decorationColor: Colors.blueAccent,
//                     ),
//                   ),
//                   Text(
//                     "Today",
//                     style: TextStyle(
//                       fontSize: titleFontSize,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),

//               // 🔹 Arrow buttons
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   _arrowButton(Icons.chevron_left, isMobile),
//                   const SizedBox(width: 4),
//                   _arrowButton(Icons.chevron_right, isMobile),
//                 ],
//               ),
//               const SizedBox(height: 8),

//               // 🔹 Weekday headers
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: const [
//                   _WeekDayText("Sun"),
//                   _WeekDayText("Mon"),
//                   _WeekDayText("Tue"),
//                   _WeekDayText("Wed"),
//                   _WeekDayText("Thu"),
//                   _WeekDayText("Fri", isBold: true),
//                   _WeekDayText("Sat"),
//                 ],
//               ),
//               const SizedBox(height: 8),

//               // 🔹 Calendar grid
//               Flexible(
//                 child: GridView.count(
//                   crossAxisCount: 7,
//                   shrinkWrap: true,
//                   padding: EdgeInsets.zero,
//                   mainAxisSpacing: 6,
//                   crossAxisSpacing: 4,
//                   children: List.generate(42, (index) {
//                     final days = [
//                       "",
//                       "",
//                       "",
//                       "",
//                       "",
//                       "",
//                       "",
//                       "30",
//                       "31",
//                       "1",
//                       "2",
//                       "3",
//                       "4",
//                       "5",
//                       "6",
//                       "7",
//                       "8",
//                       "9",
//                       "10",
//                       "11",
//                       "12",
//                       "13",
//                     ];

//                     final dayText = index < days.length ? days[index] : '';
//                     final isSelected = dayText == "11";

//                     return Container(
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         color: isSelected
//                             ? const Color(0xFF1D4D4F)
//                             : Colors.transparent,
//                         borderRadius: BorderRadius.circular(6),
//                       ),
//                       child: Text(
//                         dayText,
//                         style: TextStyle(
//                           fontSize: fontSize,
//                           color: dayText.isEmpty
//                               ? Colors.transparent
//                               : isSelected
//                               ? Colors.white
//                               : (dayText == "30" || dayText == "31")
//                               ? Colors.grey
//                               : Colors.black,
//                         ),
//                       ),
//                     );
//                   }),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _arrowButton(IconData icon, bool isMobile) {
//     return Container(
//       width: isMobile ? 26 : 32,
//       height: isMobile ? 26 : 32,
//       decoration: BoxDecoration(
//         color: Colors.black87,
//         borderRadius: BorderRadius.circular(6),
//       ),
//       child: Icon(icon, color: Colors.white, size: isMobile ? 16 : 18),
//     );
//   }
// }

// class _WeekDayText extends StatelessWidget {
//   final String label;
//   final bool isBold;

//   const _WeekDayText(this.label, {this.isBold = false});

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       label,
//       style: TextStyle(
//         fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
//         fontSize: 14,
//       ),
//     );
//   }
// }
