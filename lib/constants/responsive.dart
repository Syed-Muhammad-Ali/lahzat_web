import 'package:flutter/material.dart';
import 'package:lahzat_web/views/widgets/extension_sizebox.dart';


class Responsive {
  static bool isMobile(BuildContext context) => context.w < 600;

  static bool isTablet(BuildContext context) =>
      context.w >= 600 && context.w < 1024;

  static bool isDesktop(BuildContext context) => context.w >= 1024;
}
