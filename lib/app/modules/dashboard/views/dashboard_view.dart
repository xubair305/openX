import 'package:openx/app/core/utils/index.dart';
import 'package:openx/common_libs.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: controller.tabs[controller.tabsIndex.value],
        bottomNavigationBar: Theme(
          data: ThemeData().copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            backgroundColor: context.theme.backgroundColor,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 4,
            enableFeedback: false,
            iconSize: 24,
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.tabsIndex.value,
            selectedIconTheme: const IconThemeData(size: 24),
            onTap: (value) {
              controller.tabsIndex.value = value;
            },
            unselectedItemColor: context.theme.unselectedWidgetColor,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
                label: "Home",
                tooltip: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(FluentSystemIcons.ic_fluent_chat_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_chat_filled),
                label: "History",
                tooltip: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(FluentSystemIcons.ic_fluent_history_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_history_filled),
                label: "Chat",
                tooltip: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(FluentSystemIcons.ic_fluent_settings_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_settings_filled),
                label: "Settings",
                tooltip: "",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
