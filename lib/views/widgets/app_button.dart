import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lahzat_web/views/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  Color? txtClr;
  String? label;
  VoidCallback? ontap;
  Row? rowElements;
  double? height;
  double? width;
  double? txtSize;
  double? radius;
  FontWeight? weight;
  EdgeInsets? padding;
  final Color? backgroundColor;
  final Gradient? gradient;
  bool loading;
  final Border? border;
  final List<BoxShadow>? boxShadow;

  AppButton({
    super.key,
    this.label,
    this.ontap,
    this.rowElements,
    this.txtClr,
    this.height,
    this.radius,
    this.width,
    this.txtSize = 18,
    this.weight,
    this.padding,
    this.backgroundColor,
    this.gradient,
    this.loading = false,
    this.border,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: height ?? 46,
        width: width ?? Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 12),
          color: backgroundColor,
          gradient: gradient,
          border: border,
          boxShadow: boxShadow,
        ),
        child: Center(
          child:
              // loading
              //     ? Center(
              //         child: SleekCircularSlider(
              //           appearance: CircularSliderAppearance(
              //             spinnerMode: true,
              //             customColors: CustomSliderColors(
              //               trackColor: AppColors.grey,
              //               progressBarColor: AppColors.white,
              //               shadowColor: AppColors.white,
              //               shadowMaxOpacity: 0.5,
              //             ),
              //             size: 30,
              //           ),
              //         ),
              //       )
              //     :
              rowElements ??
              AppText(
                label ?? "",
                textAlign: TextAlign.center,
                textOverflow: TextOverflow.ellipsis,
                color: txtClr ?? Colors.white,
                fontSize: txtSize,
                fontWeight: weight ?? FontWeight.w500,
              ),
        ),
      ),
    );
  }
}
