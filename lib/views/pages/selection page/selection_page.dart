import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lahzat_web/constants/colors.dart';
import 'package:lahzat_web/constants/variables.dart';
import 'package:lahzat_web/views/pages/authentication/signin_page.dart';
import 'package:lahzat_web/views/widgets/app_button.dart';

class SelectionPage extends StatelessWidget {
  const SelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppButton(
                    label: 'admin',
                    ontap: () {
                      Variables.flavour = 'admin';
                      Get.to(() => SigninPage());
                    },
                  ),
                  AppButton(
                    label: 'user',
                    ontap: () {
                      Variables.flavour = 'user';
                      Get.to(() => SigninPage());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
