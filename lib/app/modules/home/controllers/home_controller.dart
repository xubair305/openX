import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:openx/app/core/base/index.dart';
import 'package:openx/app/core/hive_services/index.dart';
import 'package:openx/app/modules/home/model/choice_model.dart';
import 'package:openx/app/network/index.dart';
import 'package:openx/common_libs.dart';

import '../model/compilation_model.dart';

class HomeController extends BaseController {
  TextEditingController searchController = TextEditingController();
  ResponseModel? responseModel;
  RxList<Choices> choices = RxList();
  var dataBox = Hive.box<DataModel>('data');
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    dataBox.close();
    super.onClose();
    debugPrint("$runtimeType onClose called");
  }

  String get formattedDate {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('EEEE, MMM dd, yyyy');
    final String formatted = formatter.format(now);
    return formatted;
  }

  String get formattedTime {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('jm');
    final String formatted = formatter.format(now);
    return formatted;
  }

  sendCompilationRequest() async {
    isLoading.value = true;
    Map<String, dynamic> user = {
      "model": "text-davinci-002",
      "prompt": searchController.text.trim(),
      "temperature": 0.7,
      "max_tokens": 256,
      "top_p": 1,
      "frequency_penalty": 0,
      "presence_penalty": 0
    };
    var response =
        await BaseClient().post(Url.compilation, user).catchError((err) {
      debugPrint(err.toString());
    });
    if (response == null) return;
    debugPrint('successful:$response');
    responseModel = ResponseModel.fromJson(json.decode(response));
    choices.clear();
    choices.addAll(responseModel!.choices!);

    DataModel data = DataModel(
      title: searchController.text.trim(),
      description: choices[0].text,
      entryDate: formattedDate,
      entryTime: formattedTime,
    );
    await dataBox.add(data);
    isLoading.value = false;
  }
}
