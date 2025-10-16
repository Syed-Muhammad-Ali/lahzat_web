import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lahzat_web/controllers/event_controller.dart';
import 'package:lahzat_web/views/pages/manage_events/event_details/event_details_page.dart';

import '../../../widgets/container/events_container.dart';

class AttendedEventPage extends StatelessWidget {
  final controller = Get.put(EventController());
  AttendedEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 👇 GridView Builder
          Expanded(
            child: GridView.builder(
              itemCount: controller.events.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // ✅ 3 images per row
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 2, // Adjust for perfect proportions
              ),
              itemBuilder: (context, index) {
                final item = controller.events[index];
                return EventContainer(
                  item: item,
                  onTap: () {
                    Get.to(() => EventDetailsPage());
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
