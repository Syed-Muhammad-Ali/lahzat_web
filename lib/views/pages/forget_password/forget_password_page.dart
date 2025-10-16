// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:lahzat_web/constants/colors.dart';
import 'package:lahzat_web/constants/images.dart';
import 'package:lahzat_web/views/widgets/app_button.dart';
import 'package:lahzat_web/views/widgets/app_textfield.dart';
import 'package:lahzat_web/views/widgets/apptext_rubik.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    final isDesktop = screenWidth >= 1024;

    double formWidth = isDesktop
        ? 440
        : isTablet
        ? screenWidth * 0.5
        : screenWidth * 0.9;

    double titleSize = isDesktop
        ? 28
        : isTablet
        ? 26
        : 24;
    double subtitleSize = isDesktop
        ? 16
        : isTablet
        ? 15
        : 14;

    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // 💻 Desktop & Tablet Layout
            if (isDesktop || isTablet) {
              return Row(
                children: [
                  // 👈 Left Side — Forgot Password Form
                  Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(
                        horizontal: isTablet ? 40 : 80,
                        vertical: isTablet ? 20 : 60,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            Appimage.appimg2,
                            height: isTablet ? 80 : 100,
                          ),
                          SizedBox(height: isTablet ? 20 : 40),

                          // 🔹 Title
                          AppTextRubik(
                            "Forgot Password?",
                            fontSize: titleSize,
                            fontWeight: FontWeight.w700,
                            color: AppColor.black,
                          ),
                          SizedBox(height: 12),

                          // 🔹 Subtitle
                          AppTextRubik(
                            "No worries, we’ll send you reset instructions.",
                            fontSize: subtitleSize,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: isTablet ? 24 : 40),

                          // 🔹 Email / Phone Field
                          SizedBox(
                            width: formWidth,
                            child: AppTextfield(
                              ctr: TextEditingController(),
                              title: "E-mail or phone number",
                              hint: 'Type your e-mail or phone number',
                              titleColor: AppColor.primaryColor,
                              filledColor: AppColor.filledColor,
                            ),
                          ),
                          SizedBox(height: isTablet ? 24 : 40),

                          // 🔹 Reset Password Button
                          AppButton(
                            label: "Reset Password",
                            width: formWidth,
                            height: isTablet ? 44 : 50,
                            bgColor: AppColor.primaryColor,
                            ontap: () {
                              // TODO: Add reset logic
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  // 👉 Right Side — Image
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: Image.asset(
                        Appimage.image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),
                ],
              );
            }
            // 📱 Mobile Layout
            else {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 40,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 🔹 App Logo
                    Image.asset(Appimage.appimg, height: 70),
                    const SizedBox(height: 20),

                    // 🔹 Title
                    AppTextRubik(
                      "Forgot Password?",
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColor.black,
                    ),
                    const SizedBox(height: 8),

                    // 🔹 Subtitle
                    AppTextRubik(
                      "No worries, we’ll send you reset instructions.",
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),

                    // 🔹 Text Field
                    AppTextfield(
                      ctr: TextEditingController(),
                      title: "E-mail or phone number",
                      titleColor: AppColor.primaryColor,
                      filledColor: AppColor.filledColor,
                    ),
                    const SizedBox(height: 24),

                    // 🔹 Reset Password Button
                    AppButton(
                      label: "Reset Password",
                      width: double.infinity,
                      height: 48,
                      ontap: () {
                        // TODO: Add reset logic
                      },
                    ),
                    const SizedBox(height: 40),

                    // 🔹 Optional bottom image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        Appimage.image,
                        fit: BoxFit.cover,
                        height: 160,
                        width: double.infinity,
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
