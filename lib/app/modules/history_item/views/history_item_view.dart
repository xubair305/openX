import 'package:openx/app/core/utils/app_text.dart';
import 'package:openx/app/core/utils/axis_config.dart';
import 'package:openx/common_libs.dart';

import '../controllers/history_item_controller.dart';

class HistoryItemView extends GetView<HistoryItemController> {
  const HistoryItemView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History Item'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            const Gap(24),
            AppText.heading4(controller.argument.title ?? ""),
            AppText.paragraph(
              controller.argument.description ?? "",
              isSelectable: true,
            ),
            const Gap(40),
            Container(
              alignment: Alignment.center,
              width: context.width,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: context.theme.primaryColor.withOpacity(0.15),
              ),
              child: Row(
                mainAxisAlignment: mainCenter,
                children: [
                  Icon(
                    FluentSystemIcons.ic_fluent_history_filled,
                    size: 24.0,
                  ),
                  Gap(8),
                  AppText.smallParagraph(
                    "Viewing ${controller.argument.date}, ${controller.argument.time}",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
