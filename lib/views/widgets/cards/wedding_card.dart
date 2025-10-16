import 'package:flutter/material.dart';

import '../app_text.dart';

class WeddingCard extends StatelessWidget {
  final String title;
  final String desc;
  final String time;
  final String img;
  const WeddingCard({
    super.key,
    required this.title,
    required this.desc,
    required this.time,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // 🟢 Added
      borderRadius: BorderRadius.circular(16), // 🟢 Same radius as container
      child: Container(
        width: 370,
        height: 180,
        decoration: BoxDecoration(
          color: const Color(0xFF2E6456),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          clipBehavior: Clip.hardEdge, // 🟢 Keeps everything inside
          children: [
            // 🟢 Left Text Content
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 140, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(title, fontWeight: FontWeight.w700, fontSize: 20),
                  const SizedBox(height: 8),
                  AppText(desc, fontSize: 12, fontWeight: FontWeight.w400),
                  const Spacer(),
                  AppText(time, fontWeight: FontWeight.w400, fontSize: 16),
                ],
              ),
            ),

            // 🟣 Circular Image (Right Side)
            Positioned(
              right: -30, // keep same positioning
              top: 15,
              bottom: 15,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withOpacity(0.4),
                    width: 3,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x66FFFFFF),
                      blurRadius: 9.38,
                      offset: Offset(0, -3.75),
                      blurStyle: BlurStyle.inner,
                    ),
                  ],

                  image: DecorationImage(
                    image: AssetImage(img), // ✅ use named parameter
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
