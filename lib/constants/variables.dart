import 'package:get/get.dart';

class Variables {
  static String flavour = 'user';

  static RxString colorSelection = 'download'.obs;

  static RxString mode = 'download'.obs;
  static RxSet<int> selectedIndexes = <int>{}.obs;
}
