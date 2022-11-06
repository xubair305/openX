import 'package:openx/app/core/base/base_controller.dart';
import 'package:openx/app/modules/chat/views/chat_view.dart';
import 'package:openx/app/modules/history/views/history_view.dart';
import 'package:openx/app/modules/home/views/home_view.dart';
import 'package:openx/app/modules/settings/views/settings_view.dart';
import 'package:openx/common_libs.dart';

class DashboardController extends BaseController {
  RxInt tabsIndex = 0.obs;
  List<Widget> tabs = [
    HomeView(),
    ChatView(),
    HistoryView(),
    SettingsView(),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
