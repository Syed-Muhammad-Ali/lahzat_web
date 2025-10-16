import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lahzat_web/views/widgets/app_text.dart';
import '../../../constants/colors.dart';
import '../../../constants/icons.dart';

class EventStatsChart extends StatelessWidget {
  const EventStatsChart({super.key});

  @override
  Widget build(BuildContext context) {
    final double fontSize = 14; // default font size
    final double legendFontSize = 13;

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: 710, // fixed width
        height: 380, // fixed height
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  'Event Stats',
                  fontSize: fontSize,
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
                        'This Monthly',
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

            const SizedBox(height: 20),

            // 🔹 Chart
            Expanded(
              child: LineChart(
                LineChartData(
                  minX: 0,
                  maxX: 6,
                  minY: 0,
                  maxY: 20000,
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1,
                        getTitlesWidget: (value, _) {
                          const days = [
                            'Mon',
                            'Tue',
                            'Wed',
                            'Thu',
                            'Fri',
                            'Sat',
                            'Sun',
                          ];
                          if (value.toInt() >= 0 &&
                              value.toInt() < days.length) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 6, right: 20),
                              child: Text(
                                days[value.toInt()],
                                style: TextStyle(
                                  fontSize: fontSize - 1,
                                  color: Colors.grey[700],
                                ),
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 5000,
                        reservedSize: 40,
                        getTitlesWidget: (value, _) {
                          if (value % 5000 == 0) {
                            return Text(
                              value == 0
                                  ? '0'
                                  : '${(value / 1000).toStringAsFixed(0)}k',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: 5000,
                    getDrawingHorizontalLine: (value) => FlLine(
                      color: Colors.grey.withOpacity(0.3),
                      strokeWidth: 1,
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    _lineData(
                      color: AppColor.redColor,
                      points: const [
                        FlSpot(0, 12000),
                        FlSpot(1, 15000),
                        FlSpot(2, 10000),
                        FlSpot(3, 7000),
                        FlSpot(4, 13000),
                        FlSpot(5, 17000),
                        FlSpot(6, 16000),
                      ],
                    ),
                    _lineData(
                      color: AppColor.purpleColor,
                      points: const [
                        FlSpot(0, 9000),
                        FlSpot(1, 8000),
                        FlSpot(2, 7000),
                        FlSpot(3, 12000),
                        FlSpot(4, 15000),
                        FlSpot(5, 18000),
                        FlSpot(6, 20000),
                      ],
                    ),
                    _lineData(
                      color: AppColor.primaryColor,
                      points: const [
                        FlSpot(0, 10000),
                        FlSpot(1, 11000),
                        FlSpot(2, 9000),
                        FlSpot(3, 13000),
                        FlSpot(4, 17000),
                        FlSpot(5, 19000),
                        FlSpot(6, 18000),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Legend
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _legendItem('Created', AppColor.purpleColor, legendFontSize),
                SizedBox(width: Get.width * 0.04),
                _legendItem('Completed', AppColor.primaryColor, legendFontSize),
                SizedBox(width: Get.width * 0.04),
                _legendItem('Cancelled', AppColor.redColor, legendFontSize),
              ],
            ),
          ],
        ),
      ),
    );
  }

  LineChartBarData _lineData({
    required Color color,
    required List<FlSpot> points,
  }) {
    return LineChartBarData(
      spots: points,
      isCurved: true,
      color: color,
      barWidth: 3,
      dotData: const FlDotData(show: false),
    );
  }

  Widget _legendItem(String label, Color color, double fontSize) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        AppText(
          label,
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
          color: AppColor.blackColor,
        ),
      ],
    );
  }
}
