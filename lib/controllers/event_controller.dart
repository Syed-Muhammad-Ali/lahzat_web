import 'package:get/get.dart';

import '../constants/images.dart';
import '../models/event_model.dart';

class EventController extends GetxController {
  final List<EventModel> events = [
    EventModel(
      eventName: "Sarah & David’s Wedding",
      date: "12/02/2025",
      image: Appimage.event1,
    ),
    EventModel(
      eventName: "Corporate Gala Night",
      date: "28/03/2025",
      image: Appimage.event2,
    ),
    EventModel(
      eventName: "Birthday Bash",
      date: "05/04/2025",
      image: Appimage.event2,
    ),
    EventModel(
      eventName: "Music Concert",
      date: "10/04/2025",
      image: Appimage.event1,
    ),
    EventModel(
      eventName: "Tech Conference",
      date: "20/04/2025",
      image: Appimage.event2,
    ),
    EventModel(
      eventName: "Food Festival",
      date: "30/04/2025",
      image: Appimage.event1,
    ),
  ];
}
