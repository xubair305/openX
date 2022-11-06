import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:openx/app/core/utils/index.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OpenX'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            TextField(
              decoration: const InputDecoration(hintText: "Enter anything"),
              controller: controller.searchController,
            ),
            Center(
              child: TextButton(
                onPressed: controller.sendCompilationRequest,
                child: const Text("Submit"),
              ),
            ),
            Obx(
              () => controller.isLoading.isTrue
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.choices.length,
                      itemBuilder: (_, index) {
                        return SelectableText(
                            controller.choices[index].text ?? "");
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
