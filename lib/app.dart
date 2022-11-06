import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:openx/app/core/theme/index.dart';
import 'package:openx/app/core/utils/index.dart';
import 'package:openx/app/routes/app_pages.dart';
import 'package:openx/app/ui/custom_widgets/index.dart';

class OpenXApp extends StatelessWidget {
  const OpenXApp({super.key});

  static GlobalKey movieAppKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => KeyboardUtil.hideKeyboard(context),
      child: GetMaterialApp(
        key: movieAppKey,
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        translations: TranslationsUtil(),
        locale: TranslationsUtil.locale,
        fallbackLocale: TranslationsUtil.fallbackLocale,
        theme: Style.lightTheme,
        darkTheme: Style.darkTheme,
        themeMode: ThemeService().theme,
        defaultTransition: Transition.native,
        getPages: AppPages.routes,
        initialRoute: AppPages.INITIAL,
        builder: (BuildContext context, Widget? widget) {
          ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
            return CustomErrorScreen(errorDetails: errorDetails);
          };
          final MediaQueryData mediaQueryData = MediaQuery.of(context);
          return MediaQuery(
            data: mediaQueryData.copyWith(textScaleFactor: 1),
            child: widget!,
          );
        },
        enableLog: kDebugMode,
        logWriterCallback: (String text, {bool isError = false}) {
          debugPrint("GetXLog: $text");
        },
        navigatorObservers: <NavigatorObserver>[GetObserver()],
      ),
    );
  }
}
