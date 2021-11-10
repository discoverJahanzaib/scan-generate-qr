import 'dart:io';

import 'package:hive/hive.dart';

part 'db_model.g.dart';

@HiveType(typeId: 0)
class ScannedData extends HiveObject {
  ScannedData({required this.data});

  @HiveField(0)
  String data;
  //
  // @HiveField(1)
  // int age;
  //
  // @HiveField(2)
  // List<String> friends;
}