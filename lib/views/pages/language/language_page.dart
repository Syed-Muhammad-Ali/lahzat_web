import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:lahzat_web/views/widgets/apptext_rubik.dart';
import 'package:lahzat_web/views/widgets/extension_sizebox.dart';

import '../../../constants/colors.dart';
import '../../widgets/app_button.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String selectedLang = "English";
  final List<String> languages = ["English", "Arabic", "Hebrew"];

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
          child: Column(
            children: [
              AppTextRubik(
                'Change Language',
                fontSize: 36,
                fontWeight: FontWeight.w700,
                color: AppColor.primaryColor,
              ),
              2.hSpace(context),
              Container(
                width: 580,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(languages.length, (index) {
                    String lang = languages[index];
                    bool isSelected = lang == selectedLang;

                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedLang = lang;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColor.primaryColor
                              : AppColor.whiteColor,
                          borderRadius: BorderRadius.vertical(
                            top: index == 0
                                ? const Radius.circular(12)
                                : Radius.zero,
                            bottom: index == languages.length - 1
                                ? const Radius.circular(12)
                                : Radius.zero,
                          ),
                        ),
                        child: Row(
                          children: [
                            AppTextRubik(
                              lang,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: isSelected
                                  ? AppColor.whiteColor
                                  : AppColor.secondryTextColor,
                            ),

                            const Spacer(),
                            if (isSelected)
                              const Icon(
                                Icons.check,
                                color: AppColor.whiteColor,
                                size: 25,
                              ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
              6.hSpace(context),
              AppButton(label: 'Update Profiles'),
            ],
          ).paddingSymmetric(vertical: 40, horizontal: 40),
        ).paddingSymmetric(vertical: 20),
      ),
    );
  }
}
