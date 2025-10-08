import 'package:flutter/material.dart';
import 'package:lahzat_web/constants/colors.dart';
import 'package:lahzat_web/views/widgets/app_button.dart';
import 'package:lahzat_web/views/widgets/app_text.dart';
import 'package:lahzat_web/views/widgets/app_textfield.dart';

void CustomDialogBox(BuildContext context) {
  final TextEditingController titleCtr = TextEditingController();
  final TextEditingController promoCtr = TextEditingController();
  final TextEditingController amountCtr = TextEditingController();
  final TextEditingController dateCtr = TextEditingController(
    text: "Aug 24, 2025",
  );

  String discountType = "Fixed";

  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(20),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double screenWidth = constraints.maxWidth;

            final bool isMobile = screenWidth < 600;
            final bool isTablet = screenWidth >= 600 && screenWidth < 1024;

            double dialogWidth = isMobile
                ? double.infinity
                : isTablet
                ? screenWidth * 0.7
                : 500;

            return Center(
              child: Container(
                width: dialogWidth,
                padding: EdgeInsets.all(isMobile ? 16 : 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: StatefulBuilder(
                  builder: (context, setState) {
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // --- Header ---
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                "Add New Promo Code",
                                fontSize: isMobile ? 20 : 24,
                                fontWeight: FontWeight.w600,
                                color: AppColor.black,
                              ),
                              IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),

                          // --- Title Field ---
                          AppTextfield(
                            ctr: titleCtr,
                            title: "Title",
                            showStar: true,
                            hint: "Valentine's Day Special",
                            filledColor: Colors.grey.shade200,
                          ),

                          // --- Promo Code Field ---
                          AppTextfield(
                            ctr: promoCtr,
                            title: "Promo Code",
                            showStar: true,
                            hint: "VDAY15",
                            filledColor: Colors.grey.shade200,
                          ),

                          const SizedBox(height: 8),

                          // --- Discount & Amount (Responsive Row / Column) ---
                          isMobile
                              ? Column(
                                  children: [
                                    _DiscountTypeSection(
                                      discountType: discountType,
                                      onChanged: (value) =>
                                          setState(() => discountType = value),
                                    ),
                                    const SizedBox(height: 16),
                                    AppTextfield(
                                      ctr: amountCtr,
                                      title: "Enter Amount",
                                      hint: "\$ 0.00",
                                      filledColor: Colors.grey.shade200,
                                    ),
                                  ],
                                )
                              : Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: _DiscountTypeSection(
                                        discountType: discountType,
                                        onChanged: (value) => setState(
                                          () => discountType = value,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 22),
                                        child: AppTextfield(
                                          ctr: amountCtr,
                                          title: "Enter Amount",
                                          hint: "\$ 0.00",
                                          filledColor: Colors.grey.shade200,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                          const SizedBox(height: 16),

                          // --- Expiry Date Field ---
                          AppTextfield(
                            ctr: dateCtr,
                            title: "Expiry Date",
                            filledColor: Colors.grey.shade200,
                            suffixIcon: const Icon(
                              Icons.calendar_today,
                              color: Colors.black54,
                              size: 20,
                            ),
                          ),

                          const SizedBox(height: 32),

                          // --- Buttons ---
                          Row(
                            children: [
                              Expanded(
                                child: AppButton(
                                  label: "Cancel",
                                  bgColor: Colors.grey.shade400,
                                  ontap: () => Navigator.pop(context),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: AppButton(
                                  label: "Add Code",
                                  bgColor: AppColor.primaryColor,
                                  ontap: () {
                                    // TODO: handle save logic
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      );
    },
  );
}

/// 🔹 Discount Type Section (extract for cleaner responsive layout)
class _DiscountTypeSection extends StatelessWidget {
  final String discountType;
  final ValueChanged<String> onChanged;

  const _DiscountTypeSection({
    required this.discountType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            AppText(
              "Discount Type",
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xff999999),
            ),
            SizedBox(width: 2),
            Text('*', style: TextStyle(color: Colors.red)),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _discountButton(
                label: "Fixed",
                selected: discountType == "Fixed",
                onTap: () => onChanged("Fixed"),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _discountButton(
                label: "Percentage",
                selected: discountType == "Percentage",
                onTap: () => onChanged("Percentage"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// 🔹 Reusable discount button
Widget _discountButton({
  required String label,
  required bool selected,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: selected ? AppColor.primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: selected ? AppColor.primaryColor : Colors.grey.shade400,
        ),
      ),
      child: AppText(
        label,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: selected ? Colors.white : Colors.grey.shade700,
      ),
    ),
  );
}
