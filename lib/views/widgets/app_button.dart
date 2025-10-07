import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';

class AppButton extends StatelessWidget {
  final Function()? onPressed;
  final String? text;
  final FontWeight? weight;
  final double? height;
  final double? width;
  final double? borderradius;
  final Color? backgroundColor;
  final Color? bordercolor;
  final Color? textcolor;

  const AppButton({
    super.key,
    this.text,
    this.weight,
    this.onPressed,
    this.height,
    this.width,
    this.borderradius,
    this.backgroundColor,
    this.bordercolor,
    this.textcolor,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height ?? 48,
      minWidth: width ?? double.infinity,
      onPressed: onPressed,
      color: backgroundColor ?? AppColor.primaryColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: bordercolor ?? Colors.transparent),
        borderRadius: BorderRadius.circular(borderradius ?? 8),
      ),
      child: Text(
        text ?? '',
        style: GoogleFonts.poppins(
          fontSize: context.width * 0.035,
          fontWeight: weight ?? FontWeight.w400,
          color: textcolor ?? AppColor.whiteColor,
        ),
      ),
    );
  }
}
