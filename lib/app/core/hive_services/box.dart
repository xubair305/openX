import 'package:hive_flutter/hive_flutter.dart';
import 'model/data_model.dart';

class Boxes {
  static Box<DataModel> getData() {
    return Hive.box<DataModel>('data');
  }
}
