import 'package:flutter/material.dart';
import 'package:lahzat_web/views/widgets/app_text.dart';

import '../../constants/colors.dart';

class AppButton extends StatelessWidget {
  final String? label;
  final VoidCallback? ontap;
  final Row? rowElements;
  final Color? bgColor;
  final Color? borderColor;
  final Color? txtClr;
  final double? height;
  final double? width;
  final double? txtSize;
  final double? radius;
  final bool useborder;
  final FontWeight? weight;
  final EdgeInsets? padding;
  final bool? isElevation;

  const AppButton({
    super.key,
    this.label,
    this.ontap,
    this.rowElements,
    this.bgColor,
    this.borderColor,
    this.txtClr,
    this.height,
    this.radius,
    this.width,
    this.txtSize,
    this.weight,
    this.padding,
    this.isElevation = true,
    this.useborder = true,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    // 🧩 Define responsive breakpoints
    final bool isMobile = screenWidth < 600;
    final bool isTablet = screenWidth >= 600 && screenWidth < 1100;
    final bool isDesktop = screenWidth >= 1100;

    // 🧮 Compute responsive sizing
    final double responsiveHeight =
        height ??
        (isMobile
            ? 48
            : isTablet
            ? 56
            : 60);
    final double responsiveFontSize =
        txtSize ??
        (isMobile
            ? 14
            : isTablet
            ? 15
            : 16);
    final double responsiveRadius =
        radius ??
        (isMobile
            ? 10
            : isTablet
            ? 12
            : 14);

    return Padding(
      padding:
          padding ??
          EdgeInsets.symmetric(
            vertical: isMobile ? 8 : 10,
            horizontal: isMobile ? 4 : 6,
          ),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(
            (isElevation ?? true) ? (isMobile ? 1 : 2) : 0,
          ),
          backgroundColor: WidgetStateProperty.all(
            bgColor ?? AppColor.primaryColor,
          ),
          side: WidgetStateProperty.all(
            useborder
                ? BorderSide(
                    color: borderColor ?? bgColor ?? AppColor.primaryColor,
                    width: 2,
                  )
                : BorderSide.none,
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(responsiveRadius),
            ),
          ),
          fixedSize: WidgetStateProperty.all(
            Size(
              width ??
                  (isDesktop
                      ? 220
                      : isTablet
                      ? 200
                      : double.infinity),
              responsiveHeight,
            ),
          ),
        ),
        onPressed: ontap,
        child:
            rowElements ??
            AppText(
              label ?? "",
              textAlign: TextAlign.center,
              textOverflow: TextOverflow.ellipsis,
              color: txtClr ?? Colors.white,
              fontSize: responsiveFontSize,
              fontWeight: weight ?? FontWeight.w600,
            ),
      ),
    );
  }
}
