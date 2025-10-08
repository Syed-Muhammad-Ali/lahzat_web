// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:lahzat_web/constants/colors.dart';
import 'package:lahzat_web/models/promo_code_model.dart';
import 'package:lahzat_web/views/widgets/app_text.dart';

class PromoTableRow extends StatelessWidget {
  final PromoCodeItem promo;
  final bool isEven;
  final VoidCallback? onMorePressed;
  final VoidCallback? onTap;

  const PromoTableRow({
    super.key,
    required this.promo,
    required this.isEven,
    this.onMorePressed,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final partsGen = promo.generationDate.split('\n');
    final partsValid = promo.validUntil.split('\n');
    final partsDiscount = promo.discount.split('\n');

    final statusColor = promo.status == "Active"
        ? AppColor.greenColor
        : AppColor.redColor;

    return Container(
      color: isEven ? Colors.white : AppColor.primaryColor.withOpacity(0.06),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: AppText(
              promo.title,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColor.black,
            ),
          ),
          Expanded(
            flex: 2,
            child: AppText(
              promo.code,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColor.primaryColor,
              textDecoration: TextDecoration.underline,
              decorationColor: AppColor.primaryColor,
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                AppText(
                  partsGen[0],
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColor.black,
                ),
                AppText(
                  partsGen[1],
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColor.black,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                AppText(
                  partsValid[0],
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColor.black,
                ),
                AppText(
                  partsValid[1],
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColor.black,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  partsDiscount[0],
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColor.black,
                ),
                AppText(
                  partsDiscount[1],
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColor.black,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: AppText(
                  promo.status,
                  color: AppColor.whiteColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.topCenter,
              child: PopupMenuButton<String>(
                icon: const Icon(
                  Icons.more_vert,
                  size: 20,
                  color: AppColor.black,
                ),
                color: AppColor.whiteColor,
                itemBuilder: (context) => const [
                  PopupMenuItem(value: 'edit', child: Text('Edit')),
                  PopupMenuItem(value: 'delete', child: Text('Delete')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
