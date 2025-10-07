// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// //common text widget

// class AppText extends StatelessWidget {
//   const AppText(this.text,
//       {super.key,
//       this.fontSize,
//       this.fontFamily,
//       this.lineSpacing,
//       this.letterSpacing,
//       this.textOverflow,
//       this.maxLines,
//       this.textDecoration,
//       this.color,
//       this.fontWeight,
//       this.textAlign = TextAlign.start});
//   final String text;
//   final String? fontFamily;
//   final TextOverflow? textOverflow;
//   final TextDecoration? textDecoration;
//   final double? fontSize;
//   final double? letterSpacing;
//   final double? lineSpacing;
//   final TextAlign textAlign;
//   final Color? color;
//   final int? maxLines;
//   final FontWeight? fontWeight;

//   @override
//   Widget build(BuildContext context) {
//     return Text(text,
//         textAlign: textAlign,
//         maxLines: maxLines,
//         style: GoogleFonts.poppins().copyWith(
//             height: lineSpacing,
//             letterSpacing: letterSpacing,
//             decoration: textDecoration,
//             overflow: textOverflow ?? TextOverflow.visible,
//             fontWeight: fontWeight,
//             fontSize:
//                 fontSize ?? Theme.of(context).textTheme.bodyMedium!.fontSize,
//             color: color ?? Colors.white));
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  const AppText(
    this.text, {
    super.key,
    this.fontSize,
    this.fontFamily,
    this.lineSpacing,
    this.letterSpacing,
    this.textOverflow,
    this.maxLines,
    this.textDecoration,
    this.color,
    this.fontWeight,
    this.textAlign = TextAlign.start,
  });

  final String text;
  final String? fontFamily;
  final TextOverflow? textOverflow;
  final TextDecoration? textDecoration;
  final double? fontSize;
  final double? letterSpacing;
  final double? lineSpacing;
  final TextAlign textAlign;
  final Color? color;
  final int? maxLines;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Use width or height to determine scaling
        double responsiveFontSize;

        if (constraints.maxWidth < 400) {
          responsiveFontSize = (fontSize ?? 14) * 0.8; // Mobile
        } else if (constraints.maxWidth < 800) {
          responsiveFontSize = (fontSize ?? 14); // Tablet
        } else {
          responsiveFontSize = (fontSize ?? 14) * 1.2; // Desktop
        }

        return Text(
          text,
          textAlign: textAlign,
          maxLines: maxLines,
          style: GoogleFonts.poppins().copyWith(
            height: lineSpacing,
            letterSpacing: letterSpacing,
            decoration: textDecoration,
            overflow: textOverflow ?? TextOverflow.visible,
            fontWeight: fontWeight,
            fontSize: responsiveFontSize,
            color: color ?? Colors.white,
          ),
        );
      },
    );
  }
}
