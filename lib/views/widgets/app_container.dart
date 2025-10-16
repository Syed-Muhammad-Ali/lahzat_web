// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:lahzat_web/constants/colors.dart';

class AppContainer extends StatelessWidget {
  AppContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.onTap,
    this.padding,
    this.margin,
    this.color,
    this.radius,
    this.boxShadow,
  });
  final Widget child;
  double? width;
  double? height;
  VoidCallback? onTap;
  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? margin;
  final Color? color;
  double? radius;
  final List<BoxShadow>? boxShadow;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: color ?? AppColor.whiteColor,
          borderRadius: BorderRadius.circular(radius ?? 14),
          boxShadow: boxShadow,
        ),
        child: child,
      ),
    );
  }
}
