// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:lahzat_web/constants/colors.dart';
import 'package:lahzat_web/views/widgets/app_button.dart';
import 'package:lahzat_web/views/widgets/app_text.dart';

void DeleteConfirdationPopup(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(20),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double width = constraints.maxWidth;

            // Responsive breakpoints
            final bool isMobile = width < 600;
            final bool isTablet = width >= 600 && width < 1024;

            double dialogWidth = isMobile
                ? double.infinity
                : isTablet
                ? width * 0.6
                : 420;

            return Center(
              child: Container(
                width: dialogWidth,
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 16 : 24,
                  vertical: isMobile ? 20 : 28,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  children: [
                    // ✖ Close Button (Top Right)
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        icon: const Icon(Icons.close, color: Colors.black54),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),

                    // 💬 Dialog Content
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 12),

                          // --- Title ---
                          AppText(
                            "Delete the event?",
                            fontSize: isMobile ? 20 : 22,
                            fontWeight: FontWeight.w600,
                            color: AppColor.black,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),

                          // --- Description ---
                          const AppText(
                            "Are you sure you want to delete this event? This\naction cannot be undone. Please confirm your\nchoice.",
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                            textAlign: TextAlign.center,
                          ),

                          const SizedBox(height: 32),

                          // --- Action Buttons ---
                          Row(
                            children: [
                              Expanded(
                                child: AppButton(
                                  label: "Cancel",
                                  bgColor: Colors.grey.shade300,
                                  txtClr: AppColor.primaryColor,
                                  ontap: () => Navigator.pop(context),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: AppButton(
                                  label: "Delete",
                                  bgColor: AppColor.darkred,
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
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
