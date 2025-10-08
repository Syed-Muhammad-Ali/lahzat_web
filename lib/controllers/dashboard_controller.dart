import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../constants/colors.dart';
import '../constants/icons.dart';
import '../models/stats_model.dart';

class DashboardController extends GetxController {
  final statslist = <StatModel>[
    StatModel(
      title: "Total Events",
      value: "40,689",
      percentage: "8.5%",
      trendText: "Up from yesterday",
      iconPath: AppIcons.product,
      color: AppColor.yellowColor,
      trendTextColor: AppColor.greenColor,
    ),
    StatModel(
      title: "Completed Events",
      value: "12,304",
      percentage: "8.5%",
      trendText: "Up from last week",
      iconPath: AppIcons.check,
      color: AppColor.greenColor,
      trendTextColor: AppColor.greenColor,
    ),
    StatModel(
      title: "Upcoming Events",
      value: "1,203",
      percentage: "8.5%",
      trendText: "Up from last Month",
      iconPath: AppIcons.eventUC,
      color: AppColor.purpleColor,
      trendTextColor: AppColor.greenColor,
    ),
    StatModel(
      title: "Revenue",
      value: "\$94,230",
      percentage: "8.5%",
      trendText: "Down from last week",
      iconPath: AppIcons.cancel,
      color: AppColor.redColor,
      trendTextColor: AppColor.redColor,
    ),
  ].obs;
}
