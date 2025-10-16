import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/utils.dart';
import 'package:lahzat_web/constants/colors.dart';
import 'package:lahzat_web/constants/icons.dart';
import 'package:lahzat_web/views/widgets/app_button.dart';
import 'package:lahzat_web/views/widgets/apptext_rubik.dart';
import 'package:lahzat_web/views/widgets/extension_sizebox.dart';

import '../../widgets/app_textfield.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: 1100,
          //  height: 500,
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Column(
              children: [
                AppTextRubik(
                  'Update Password',
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: AppColor.primaryColor,
                ),
                2.hSpace(context),
                AppTextRubik(
                  textAlign: TextAlign.center,
                  'Keep your account safe by updating your password often! This\nway, you can enjoy all our features without any worries.',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColor.secondryTextColor,
                ),
                4.hSpace(context),
                SizedBox(
                  width: 430,
                  child: AppTextfield(
                    ctr: TextEditingController(),
                    title: 'Current Password',
                    hint: 'Enter Password',
                    filledColor: AppColor.filledColor,
                    titleColor: AppColor.black,
                    suffixIcon: Center(
                      child: SvgPicture.asset(AppIcons.visibilityOff),
                    ),
                  ),
                ),

                SizedBox(
                  width: 430,
                  child: AppTextfield(
                    ctr: TextEditingController(),
                    title: 'New Password',
                    hint: '@Enter Password',
                    filledColor: AppColor.filledColor,
                    titleColor: AppColor.black,
                    suffixIcon: Center(
                      child: SvgPicture.asset(AppIcons.visibilityOff),
                    ),
                  ),
                ),

                SizedBox(
                  width: 430,
                  child: AppTextfield(
                    ctr: TextEditingController(),
                    title: 'Confirm Password',
                    hint: '@Enter Password',
                    filledColor: AppColor.filledColor,
                    titleColor: AppColor.black,
                    suffixIcon: Center(
                      child: SvgPicture.asset(AppIcons.visibilityOff),
                    ),
                  ),
                ),
                4.hSpace(context),
                AppButton(label: 'Update Profiles'),
              ],
            ).paddingSymmetric(vertical: 40, horizontal: 40),
          ),
        ).paddingSymmetric(vertical: 20),
      ),
    );
  }
}
