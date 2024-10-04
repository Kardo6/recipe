import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage storage = new FlutterSecureStorage();

  void writeSecureStringData(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  void writeSecureListData(String key, List value) async {
    await storage.write(key: key, value: jsonEncode(value));
  }

  void readSecureDataData(String key) async {
    String value = await storage.read(key: key) ?? 'No Data found!';
  }
}
