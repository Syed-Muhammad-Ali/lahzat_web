import 'package:flutter/material.dart';
import 'package:lahzat_web/constants/colors.dart';
import 'package:lahzat_web/models/manage_event_model.dart';
import 'package:lahzat_web/views/widgets/app_text.dart';

class EventTableRow extends StatelessWidget {
  final UserItem event;
  final int index;
  final VoidCallback? onMorePressed;
  final VoidCallback? onTap;

  const EventTableRow({
    super.key,
    required this.event,
    required this.index,
    this.onMorePressed,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isEven = index.isEven;
    final backgroundColor = isEven
        ? Colors.white
        : AppColor.primaryColor.withOpacity(0.15);

    Color paymentColor;
    String paymentLabel = event.paymentStatus;

    switch (paymentLabel) {
      case "Pending":
        paymentColor = AppColor.darkYellow;
        break;
      default:
        paymentColor = AppColor.greenColor;
    }

    // Status color
    Color statusColor;
    String statusLabel = event.eventStatus;

    switch (statusLabel) {
      case "Upcoming":
        statusColor = AppColor.darkYellow;
        break;
      case "Cancelled":
        statusColor = AppColor.redColor;
        break;
      default:
        statusColor = AppColor.greenColor;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      event.avatar,
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Flexible(
                    child: AppText(
                      event.name,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColor.black,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: AppText(
                event.phone,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColor.black,
              ),
            ),
            Expanded(
              flex: 2,
              child: AppText(
                event.date,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColor.black,
                // textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 2,
              child: AppText(
                event.category,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColor.black,
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  constraints: const BoxConstraints(
                    minWidth: 96,
                    maxWidth: 96,
                    minHeight: 32,
                  ),
                  // padding: const EdgeInsets.symmetric(horizontal: 6),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: paymentColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: AppText(
                      paymentLabel,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColor.whiteColor,
                    ),
                  ),
                ),
              ),
            ),

            // Status (Pill)
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  constraints: const BoxConstraints(
                    minWidth: 96,
                    maxWidth: 96,
                    minHeight: 32,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 6,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: AppText(
                    statusLabel,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColor.whiteColor,
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
      ),
    );
  }
}
