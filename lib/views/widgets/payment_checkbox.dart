import 'package:flutter/material.dart';
import 'package:lahzat_web/constants/colors.dart';
import 'package:lahzat_web/views/widgets/apptext_rubik.dart';
import 'package:lahzat_web/views/widgets/extension_sizebox.dart';

class PaymentCheckboxSection extends StatefulWidget {
  final VoidCallback onContinue;

  const PaymentCheckboxSection({super.key, required this.onContinue});

  @override
  State<PaymentCheckboxSection> createState() => _PaymentCheckboxSectionState();
}

class _PaymentCheckboxSectionState extends State<PaymentCheckboxSection> {
  bool saveCard = false;
  bool agreeTerms = false;

  bool get canContinue => saveCard && agreeTerms;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔹 Save card checkbox
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
              value: saveCard,
              activeColor: AppColor.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              onChanged: (value) {
                setState(() => saveCard = value ?? false);
              },
            ),
            const SizedBox(width: 8),
            const AppTextRubik(
              "Save this card for future payments",
              fontSize: 16,
              color: AppColor.blackColor,
            ),
          ],
        ),

        const SizedBox(height: 12),

        // 🔹 Terms & Conditions checkbox
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
              value: agreeTerms,
              activeColor: AppColor.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              onChanged: (value) {
                setState(() => agreeTerms = value ?? false);
              },
            ),
            const SizedBox(width: 8),
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "I agree to the ",
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 16,
                        color: AppColor.blackColor,
                      ),
                    ),
                    TextSpan(
                      text: "Terms & Conditions",
                      style: const TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 16,
                        color: AppColor.primaryColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const TextSpan(
                      text: " and ",
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 16,
                        color: AppColor.blackColor,
                      ),
                    ),
                    TextSpan(
                      text: "Privacy Policy",
                      style: const TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 16,
                        color: AppColor.primaryColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        // 🔹 Continue button — only active if both are checked
        SizedBox(
          width: 502,
          height: 50,
          child: ElevatedButton(
            onPressed: canContinue ? widget.onContinue : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: canContinue
                  ? AppColor.primaryColor
                  : Colors.grey.shade400,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const AppTextRubik(
              "Pay 1500₪",
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        2.hSpace(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppTextRubik(
              'One-time Payment',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColor.black,
            ),
          ],
        ),
      ],
    );
  }
}
