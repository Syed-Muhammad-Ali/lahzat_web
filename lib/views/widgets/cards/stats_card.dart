import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lahzat_web/constants/icons.dart';
import 'package:lahzat_web/views/widgets/app_text.dart';
import '../../../constants/colors.dart';
import '../../../models/stats_model.dart';

class StatsCard extends StatelessWidget {
  final StatModel item;
  const StatsCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🧩 Title + Icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                item.title,
                fontSize: 14,
                color: AppColor.blackColor,
                fontWeight: FontWeight.w500,
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: item.color.withOpacity(0.20),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    item.iconPath,
                    height: 24,
                    color: item.color,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // 🧮 Number
          AppText(
            item.value,
            fontSize: 32,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),

          const SizedBox(height: 8),

          // 📈 Percentage info
          Row(
            children: [
              SvgPicture.asset(AppIcons.tup, color: item.trendTextColor),
              const SizedBox(width: 4),
              AppText(
                item.percentage,
                color: item.trendTextColor,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(width: 6),
              AppText(
                item.trendText,
                color: AppColor.darkBrownColor,
                fontSize: 13,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
