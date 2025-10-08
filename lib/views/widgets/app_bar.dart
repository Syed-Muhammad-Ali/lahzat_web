import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lahzat_web/constants/icons.dart';
import 'package:lahzat_web/constants/images.dart';
import 'package:lahzat_web/views/widgets/app_textfield.dart';

import '../../../constants/colors.dart';

class AppBarWidgets extends StatelessWidget {
  const AppBarWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 89,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: AppColor.primaryColor, width: 1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            const Spacer(flex: 2),
            Expanded(
              flex: 5,
              child: Align(
                alignment: Alignment.center,
                child: AppTextfield(
                  ctr: TextEditingController(),
                  hint: 'Search',
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset(
                      AppIcons.search,
                      color: Colors.black,
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(flex: 3),
            Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(Appimage.p1, fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }
}
