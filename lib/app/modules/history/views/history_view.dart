import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:openx/app/core/hive_services/index.dart';

import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search History'),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<DataModel>('data').listenable(),
        builder: (context, Box<DataModel> items, _) {
          List<int> keys = items.keys.cast<int>().toList();
          return ListView.separated(
            separatorBuilder: (_, index) => const Divider(),
            itemCount: keys.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            // physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              final int key = keys[index];
              final DataModel? data = items.get(key);
              return ListTile(
                title: SelectableText(
                  data!.title ?? "",
                  style: const TextStyle(fontSize: 16),
                ),
                subtitle: SelectableText(data.description ?? "",
                    style: const TextStyle(fontSize: 12)),
                leading: Text(
                  "${key + 1}",
                  style: const TextStyle(fontSize: 18),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
