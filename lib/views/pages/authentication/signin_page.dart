// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lahzat_web/constants/colors.dart';
import 'package:lahzat_web/constants/icons.dart';
import 'package:lahzat_web/constants/images.dart';
import 'package:lahzat_web/constants/variables.dart';
import 'package:lahzat_web/views/pages/event%20_list/event_list_page.dart';
import 'package:lahzat_web/views/pages/forget_password/forget_password_page.dart';
import 'package:lahzat_web/views/pages/sideBar/sideBar_page.dart';
import 'package:lahzat_web/views/widgets/app_button.dart';
import 'package:lahzat_web/views/widgets/app_textfield.dart';
import 'package:lahzat_web/views/widgets/apptext_rubik.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    final isDesktop = screenWidth >= 1024;

    // Adaptive widths
    double formWidth = isDesktop
        ? 440
        : isTablet
        ? screenWidth * 0.5
        : screenWidth * 0.9;

    // Adaptive text scaling
    double titleSize = isDesktop
        ? 30
        : isTablet
        ? 26
        : 24;
    double subtitleSize = isDesktop
        ? 18
        : isTablet
        ? 16
        : 15;

    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // 🖥 Desktop & 💻 Tablet: Row layout (same design but compressed for tab)
            if (isDesktop || isTablet) {
              return Row(
                children: [
                  // 👈 Left Section (Sign-in Form)
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
                          AppTextRubik(
                            "Sign in",
                            fontSize: titleSize,
                            fontWeight: FontWeight.w600,
                            color: AppColor.black,
                          ),
                          SizedBox(height: 8),
                          AppTextRubik(
                            'Please enter your details.',
                            fontSize: subtitleSize,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                          ),
                          SizedBox(height: isTablet ? 20 : 40),

                          // Email
                          SizedBox(
                            width: formWidth,
                            child: AppTextfield(
                              ctr: TextEditingController(),
                              title: 'E-mail or phone number',
                              titleColor: AppColor.primaryColor,
                              filledColor: AppColor.filledColor,
                            ),
                          ),
                          SizedBox(height: isTablet ? 12 : 16),

                          // Password
                          SizedBox(
                            width: formWidth,
                            child: AppTextfield(
                              ctr: TextEditingController(),
                              title: 'Password',
                              titleColor: AppColor.primaryColor,
                              filledColor: AppColor.filledColor,
                            ),
                          ),
                          SizedBox(height: 8),
                          SizedBox(
                            width: formWidth,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => ForgetPasswordPage());
                                  },
                                  child: AppTextRubik(
                                    'Forget Password?',
                                    fontSize: isTablet ? 13 : 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.secondaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: isTablet ? 20 : 30),

                          // Sign In Button
                          AppButton(
                            label: 'Sign In',
                            width: formWidth,
                            height: isTablet ? 44 : 50,
                            ontap: () {
                              if (Variables.flavour == 'user') {
                                Get.to(() => SidebarPage());
                              } else {
                                Get.to(() => EventListPage());
                              }
                            },
                          ),
                          SizedBox(height: isTablet ? 12 : 20),

                          // Google Sign In
                          AppButton(
                            width: formWidth,
                            height: isTablet ? 44 : 50,
                            bgColor: AppColor.whiteColor,
                            rowElements: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  AppIcons.google,
                                  width: isTablet ? 18 : 22,
                                ),
                                SizedBox(width: isTablet ? 10 : 12),
                                AppTextRubik(
                                  'Sign in with Google',
                                  fontSize: isTablet ? 16 : 18,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.black,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // 👉 Right Section (Image)
                  Expanded(
                    flex: isTablet ? 1 : 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: Image.asset(
                        Appimage.image,
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
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
                    Image.asset(Appimage.appimg, height: 70),
                    const SizedBox(height: 20),
                    AppTextRubik(
                      "Sign in",
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: AppColor.black,
                    ),
                    const SizedBox(height: 6),
                    AppTextRubik(
                      'Please enter your details.',
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                    ),
                    const SizedBox(height: 24),

                    // Email Field
                    AppTextfield(
                      ctr: TextEditingController(),
                      title: 'E-mail or phone number',
                      titleColor: AppColor.primaryColor,
                      filledColor: AppColor.filledColor,
                    ),
                    const SizedBox(height: 16),

                    // Password Field
                    AppTextfield(
                      ctr: TextEditingController(),
                      title: 'Password',
                      titleColor: AppColor.primaryColor,
                      filledColor: AppColor.filledColor,
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {},
                        child: AppTextRubik(
                          'Forget Password?',
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: AppColor.secondaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Sign In Button
                    AppButton(
                      label: 'Sign In',
                      width: double.infinity,
                      height: 48,
                      ontap: () {
                        if (Variables.flavour == 'user') {
                          Get.to(() => SidebarPage());
                        } else {
                          Get.to(() => EventListPage());
                        }
                      },
                    ),
                    const SizedBox(height: 16),

                    // Google Button
                    AppButton(
                      width: double.infinity,
                      height: 48,
                      bgColor: AppColor.whiteColor,
                      rowElements: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppIcons.google, width: 18),
                          const SizedBox(width: 10),
                          AppTextRubik(
                            'Sign in with Google',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColor.black,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Optional image at bottom
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
