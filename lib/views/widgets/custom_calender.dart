// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lahzat_web/views/widgets/cards/wedding_card.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({super.key});

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // 🧮 Returns list of visible days in the month (only first 14 days for 2 rows)
  List<DateTime> _getDaysInMonth(DateTime month) {
    final firstDayOfMonth = DateTime(month.year, month.month, 1);
    final totalDaysInMonth = DateTime(month.year, month.month + 1, 0).day;

    // Just take first 14 days
    final List<DateTime> days = [];
    for (int i = 1; i <= totalDaysInMonth && days.length < 14; i++) {
      days.add(DateTime(month.year, month.month, i));
    }
    return days;
  }

  @override
  Widget build(BuildContext context) {
    final List<DateTime> days = _getDaysInMonth(_focusedDay);
    final String monthTitle = DateFormat('MMMM yyyy').format(_focusedDay);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 🔹 Month Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                monthTitle,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  _arrowButton(Icons.chevron_left, () {
                    setState(() {
                      _focusedDay = DateTime(
                        _focusedDay.year,
                        _focusedDay.month - 1,
                      );
                    });
                  }),
                  const SizedBox(width: 8),
                  _arrowButton(Icons.chevron_right, () {
                    setState(() {
                      _focusedDay = DateTime(
                        _focusedDay.year,
                        _focusedDay.month + 1,
                      );
                    });
                  }),
                ],
              ),
            ],
          ),

          const SizedBox(height: 12),

          // 🔹 Weekday Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _WeekDayLabel("Sun"),
              _WeekDayLabel("Mon"),
              _WeekDayLabel("Tue"),
              _WeekDayLabel("Wed"),
              _WeekDayLabel("Thu"),
              _WeekDayLabel("Fri"),
              _WeekDayLabel("Sat"),
            ],
          ),

          const SizedBox(height: 8),

          // 🔹 Calendar Grid (only 2 rows)
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: days.length, // only 14 days
            itemBuilder: (context, index) {
              final day = days[index];
              bool isToday = DateUtils.isSameDay(day, DateTime.now());
              bool isSelected =
                  _selectedDay != null &&
                  DateUtils.isSameDay(day, _selectedDay);

              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedDay = day;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFF1D4D4F)
                        : isToday
                        ? Colors.blueAccent.withOpacity(0.2)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "${day.day}",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: isSelected
                          ? Colors.white
                          : isToday
                          ? Colors.blueAccent
                          : Colors.black87,
                    ),
                  ),
                ),
              );
            },
          ),

          //   SizedBox(height: Get.height * 0.02),
          WeddingCard(
            title: '"Sara & Ali’s Wedding"',
            desc:
                "Picture a cozy garden wedding adorned with wildflowers, wooden details, and sparkling fairy lights, perfect for celebrating love.",
            time: "9:00 AM",
            img: 'assets/images/img1.png',
          ),
          SizedBox(height: Get.height * 0.01),

          WeddingCard(
            title: "Maddie's Birthday",
            desc:
                'Imagine a vibrant birthday bash filled with rainbow balloons, a custom cake, and lively music, creating unforgettable memories.',
            time: "9:00 AM",
            img: 'assets/images/img2.png',
          ),
          //        SizedBox(height: Get.height * 0.02),
        ],
      ),
    );
  }

  Widget _arrowButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }
}

class _WeekDayLabel extends StatelessWidget {
  final String text;
  const _WeekDayLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
