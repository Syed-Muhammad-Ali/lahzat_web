import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lahzat_web/constants/colors.dart';
import 'package:lahzat_web/constants/icons.dart';
import 'package:lahzat_web/constants/images.dart';
import 'package:lahzat_web/views/widgets/app_button.dart';
import 'package:lahzat_web/views/widgets/app_textfield.dart';
import 'package:lahzat_web/views/widgets/apptext_rubik.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: Row(
        children: [
          // 👇 Left side (Sign-in form area)
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(Appimage.appimg),
                AppTextRubik(
                  "Sign in",
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: AppColor.black,
                ),

                AppTextRubik(
                  'Please enter your details.',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
                SizedBox(height: Get.height * 0.02),
                SizedBox(
                  width: 440,
                  child: AppTextfield(
                    ctr: TextEditingController(),
                    title: 'E-mail or phone number',
                    titleColor: AppColor.primaryColor,
                    filledColor: AppColor.filledColor,
                  ),
                ),

                SizedBox(
                  width: 440,
                  child: AppTextfield(
                    ctr: TextEditingController(),
                    title: 'Password',
                    titleColor: AppColor.primaryColor,
                    filledColor: AppColor.filledColor,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: AppTextRubik(
                        'Forget Password?',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColor.secondaryColor,
                      ),
                    ),
                    SizedBox(width: Get.width * 0.07),
                  ],
                ),

                AppButton(label: 'Sign In', width: 440),
                AppButton(
                  width: 440,
                  bgColor: AppColor.whiteColor,
                  rowElements: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppIcons.google),
                      SizedBox(width: Get.width * 0.04),
                      AppTextRubik(
                        'Sign in with Google',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: AppColor.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 👇 Right side (Image)
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: Image.asset(Appimage.image, fit: BoxFit.cover),
            ),
          ),
        ],
      ).paddingSymmetric(vertical: 60, horizontal: 60),
    );
  }
}
