import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:lahzat_web/views/widgets/apptext_rubik.dart';

import '../../constants/colors.dart';

class SwapeButton extends StatelessWidget {
  final String title;
  final Color? color;
  final Function()? onSwape;

  SwapeButton({super.key, required this.title, this.color, this.onSwape});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background Image
          Container(
            height: 107,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.filledColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: AppTextRubik(
                'Promo Code',
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: AppColor.primaryColor,
              ),
            ),
          ),

          // Swipe Button on top
          SwipeButton(
            borderRadius: BorderRadius.circular(12),
            activeTrackColor: color ?? Colors.transparent, // Important!
            height: 107,
            thumb: Container(
              width: 53,
              height: 46,
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: AppTextRubik(
                  'Apply',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            onSwipe: onSwape ?? () {},
            child: AppTextRubik(
              title,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColor.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
