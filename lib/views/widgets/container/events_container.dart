// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:lahzat_web/constants/colors.dart';
import 'package:lahzat_web/constants/images.dart';

import '../../../models/event_model.dart';
import '../apptext_rubik.dart';

class EventContainer extends StatelessWidget {
  final EventModel? item;
  final BorderRadius? radius;
  final Function()? onTap;
  final double? height;
  const EventContainer({
    super.key,
    this.item,
    this.radius,
    this.onTap,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 176,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: radius ?? BorderRadius.circular(20),
          color: AppColor.whiteColor,
          image: DecorationImage(
            image: AssetImage(item?.image ?? Appimage.event1),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColor.blackColor.withOpacity(0.15),
              blurRadius: 4,
              spreadRadius: 0,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextRubik(
                item?.eventName ?? "Sarah & David’s wedding",
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: AppColor.whiteColor,
              ),
              AppTextRubik(
                item?.date ?? "12/02/2025",
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColor.whiteColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
