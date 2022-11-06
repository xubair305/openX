import 'package:get/get.dart';

import '../controllers/history_item_controller.dart';

class HistoryItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryItemController>(
      () => HistoryItemController(),
    );
  }
}
