import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:openx/app/core/utils/index.dart';
import 'package:openx/common_libs.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SettingsView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text("Theme Mode"),
            leading:
                const Icon(FluentSystemIcons.ic_fluent_weather_moon_regular),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            onTap: () {
              showBarModalBottomSheet(
                context: context,
                expand: false,
                backgroundColor: context.theme.backgroundColor,
                builder: (context) => Column(
                  mainAxisSize: mainSizeMin,
                  children: [
                    ListTile(
                      title: const Text("Dark"),
                      leading: const Icon(
                          FluentSystemIcons.ic_fluent_weather_moon_regular),
                      onTap: () {
                        Get.changeThemeMode(ThemeMode.dark);
                        StorageUtil.write("themeMode", "dark");
                        Get.close(1);
                      },
                    ),
                    ListTile(
                      title: const Text("Light"),
                      leading: const Icon(
                          FluentSystemIcons.ic_fluent_lightbulb_circle_regular),
                      onTap: () {
                        Get.changeThemeMode(ThemeMode.light);
                        StorageUtil.write("themeMode", "light");
                        Get.close(1);
                      },
                    ),
                    ListTile(
                      title: const Text("System"),
                      leading: const Icon(
                          FluentSystemIcons.ic_fluent_device_eq_regular),
                      onTap: () {
                        Get.changeThemeMode(ThemeMode.system);
                        StorageUtil.write("themeMode", "system");
                        Get.close(1);
                      },
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
