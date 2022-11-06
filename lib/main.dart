import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:openx/app/core/hive_services/index.dart';
import 'package:openx/app/core/utils/index.dart';

import 'app.dart';

Future<void> initServices() async {
  ConnectivityUtil.configureConnectivityStream();

  debugPrint('Starting GetX Services...');
  await Future.wait(
    <Future<dynamic>>[
      StorageUtil.init(),
      Get.putAsync(() => GlobalVariablesService().init()),
    ],
  );
  debugPrint('All GetX Services Started...');
}

Future<void> main() async {
  debugPrint = (String? message, {int? wrapWidth}) {
    if (!kReleaseMode) {
      log(message.toString());
    }
  };

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(DataModelAdapter());
  await Hive.openBox<DataModel>('data');

  runZonedGuarded<Future<void>>(
    () async {
      await initServices();
      runApp(const OpenXApp());
    },
    (Object error, StackTrace stack) {
      debugPrint('ErrorAboutMovieApp: $error, $stack');
    },
  );
}
