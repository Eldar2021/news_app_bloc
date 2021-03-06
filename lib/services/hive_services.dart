import 'package:hive/hive.dart';

class HiveService {
  Future<bool> isExists({required String boxName}) async {
    final openBox = await Hive.openBox(boxName);
    int length = openBox.length;
    return length != 0;
  }

  Future<void> addBoxes(List<dynamic> items, String boxName) async {
    final openBox = await Hive.openBox(boxName);
    for (var item in items) {
      openBox.add(item);
    }
  }

  Future<List<dynamic>> getBoxes(String boxName) async {
    List<dynamic> boxList = <dynamic>[];
    final openBox = await Hive.openBox(boxName);
    int length = openBox.length;
    for (int i = 0; i < length; i++) {
      boxList.add(openBox.getAt(i));
    }
    return boxList;
  }

  Future<void> clearBoxes(String boxName) async {
    final openBox = await Hive.openBox(boxName);
    await openBox.clear();
  }
}
