import 'package:flutter/material.dart';
import 'package:lahzat_web/constants/colors.dart';
import 'package:lahzat_web/views/widgets/app_text.dart';

class AppPagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final int totalItems;
  final int pageSize;
  final ValueChanged<int> onPageChanged;

  const AppPagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.totalItems,
    required this.pageSize,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final start = ((currentPage - 1) * pageSize) + 1;
    final end = (currentPage * pageSize).clamp(0, totalItems);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            "$start-$end of $totalItems items",
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColor.blackColor,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: currentPage > 1
                    ? () => onPageChanged(currentPage - 1)
                    : null,
                child: AppText(
                  '< Prev',
                  fontSize: 14,
                  fontWeight: currentPage > 1
                      ? FontWeight.w500
                      : FontWeight.w400,
                  color: currentPage > 1
                      ? AppColor.primaryColor
                      : AppColor.blackColor,
                ),
              ),
              const SizedBox(width: 8),
              for (int i = 1; i <= totalPages.clamp(1, 5); i++)
                GestureDetector(
                  onTap: () => onPageChanged(i),
                  child: Container(
                    width: 32,
                    height: 32,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      color: i == currentPage
                          ? AppColor.primaryColor
                          : AppColor.whiteColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: AppText(
                        "$i",
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: i == currentPage
                            ? Colors.white
                            : AppColor.blackColor,
                      ),
                    ),
                  ),
                ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: currentPage < totalPages
                    ? () => onPageChanged(currentPage + 1)
                    : null,
                child: AppText(
                  'Next >',
                  fontSize: 14,
                  fontWeight: currentPage < totalPages
                      ? FontWeight.w500
                      : FontWeight.w400,
                  color: currentPage < totalPages
                      ? AppColor.primaryColor
                      : AppColor.blackColor,
                ),
              ),
            ],
          ),

          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<int>(
                    value: 10,
                    dropdownColor: AppColor.primaryColor,
                    iconEnabledColor: Colors.white,
                    items: [10, 25, 50].map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: AppText(
                          '$value',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {},
                  ),
                ),
              ),
              const SizedBox(width: 8),
              AppText(
                'items per page',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColor.black,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
