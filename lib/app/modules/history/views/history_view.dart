import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:openx/app/core/hive_services/index.dart';
import 'package:openx/app/core/utils/app_text.dart';
import 'package:openx/app/core/utils/axis_config.dart';
import 'package:openx/app/routes/app_pages.dart';

import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("History")),
      body: ValueListenableBuilder(
        builder: (BuildContext context, items, Widget? child) {
          List<int> keys = items.keys.cast<int>().toList();
          return ListView.builder(
            shrinkWrap: true,
            itemCount: keys.length,
            itemBuilder: (context, index) {
              final int key = keys[index];
              final DataModel? data = items.get(key);
              return _buildaj(context, data);
            },
          );
        },
        valueListenable: Hive.box<DataModel>('data').listenable(),
      ),
    );
  }

  Widget _buildaj(BuildContext context, DataModel? dataModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          const Gap(24),
          AppText.heading4(dataModel?.entryDate ?? "Null"),
          const Gap(40),
          GestureDetector(
            onTap: () {
              Get.toNamed(
                Routes.HISTORY_ITEM,
                arguments: HistoryViewArg(
                  title: dataModel?.title,
                  description: dataModel?.description,
                  date: dataModel?.entryDate,
                  time: dataModel?.entryTime,
                ),
              );
            },
            child: Row(
              children: [
                AppText.paragraph(dataModel?.entryTime ?? "null"),
                const Gap(8),
                Column(
                  children: [
                    SizedBox(
                        height: 16,
                        child: VerticalDivider(
                          endIndent: 4,
                          indent: 4,
                          color: context.theme.indicatorColor,
                        )),
                    const Icon(
                      Icons.fiber_manual_record_outlined,
                      size: 8,
                    ),
                    SizedBox(
                        height: 16,
                        child: VerticalDivider(
                          endIndent: 4,
                          indent: 4,
                          color: context.theme.indicatorColor,
                        )),
                  ],
                ),
                const Gap(8),
                Expanded(child: AppText.smallParagraph(dataModel?.title ?? ""))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HistoryViewArg {
  String? title;
  String? description;
  String? date;
  String? time;

  HistoryViewArg({this.title, this.description, this.date, this.time});
}
