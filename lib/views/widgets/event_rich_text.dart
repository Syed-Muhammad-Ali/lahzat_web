import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class EventRichText extends StatelessWidget {
  final String label; // e.g. "Event:"
  final String title; // e.g. "Sara & Amir’s Wedding"
  final Color? color;
  final double fontSize;
  final String? leadingIcon; // ✅ inline icon path
  final double iconSize;

  const EventRichText({
    Key? key,
    required this.label,
    required this.title,
    this.color,
    this.fontSize = 14,
    this.leadingIcon,
    this.iconSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final baseColor = color ?? Colors.black;

    return Text.rich(
      TextSpan(
        children: [
          if (leadingIcon != null)
            WidgetSpan(
              alignment: PlaceholderAlignment.bottom, // ✅ baseline alignment
              baseline: TextBaseline.alphabetic, // ✅ align with text baseline
              child: Padding(
                padding: const EdgeInsets.only(right: 4),
                child: SvgPicture.asset(
                  leadingIcon!,
                  height: iconSize,
                  width: iconSize,
                ),
              ),
            ),
          TextSpan(
            text: '$label ',
            style: GoogleFonts.rubik(
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
              color: baseColor,
            ),
          ),
          TextSpan(
            text: title,
            style: GoogleFonts.rubik(
              fontSize: fontSize,
              fontWeight: FontWeight.w400,
              color: baseColor,
            ),
          ),
        ],
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
