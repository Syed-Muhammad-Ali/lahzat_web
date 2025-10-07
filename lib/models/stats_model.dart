import 'package:flutter/material.dart';

class StatModel {
  final String title;
  final String value;
  final String percentage;
  final String trendText;
  final String iconPath;
  final Color color;
  final Color trendTextColor;

  StatModel({
    required this.title,
    required this.value,
    required this.percentage,
    required this.trendText,
    required this.iconPath,
    required this.color,
    required this.trendTextColor,
  });
}
