import 'package:flutter/material.dart';
import 'package:lahzat_web/views/widgets/app_text.dart';

import '../../constants/colors.dart';

class LanguageToggle extends StatefulWidget {
  const LanguageToggle({super.key});

  @override
  _LanguageToggleState createState() => _LanguageToggleState();
}

class _LanguageToggleState extends State<LanguageToggle> {
  String selectedLang = "English"; // default selected

  final List<String> languages = ["English", "Arabic", "Hebrew"];

  @override
  Widget build(BuildContext context) {
    return 
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: languages.map((lang) {
        final bool isSelected = lang == selectedLang;

        return Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedLang = lang;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: isSelected ? AppColor.primaryColor : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected
                      ? AppColor.primaryColor
                      : Colors.grey.shade400,
                ),
              ),
              child: AppText(
                lang,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : Colors.grey.shade600,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
