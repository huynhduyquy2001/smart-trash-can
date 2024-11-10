// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http; // Import http package
import 'dart:convert'; // Import JSON encoding

Future<bool> addNewTrashcan(TrashcanStruct trashcan) async {
  // URL Firebase Database với serial làm khóa (777, 888, ...)
  final url = Uri.parse(
      'https://pikachu-uq2hjp-default-rtdb.firebaseio.com/trash_bins/${trashcan.serial}.json');

  // Chuyển đổi dữ liệu của TrashcanStruct thành JSON
  final Map<String, dynamic> trashcanData = {
    'cur': trashcan.cur,
    'owner': trashcan.owner,
    'serial': trashcan.serial,
    'usage': trashcan.usage,
  };

  try {
    // Gửi yêu cầu PUT tới Firebase
    final response = await http.put(
      url,
      body: jsonEncode(trashcanData),
      headers: {'Content-Type': 'application/json'},
    );

    // Kiểm tra nếu yêu cầu thành công
    if (response.statusCode == 200) {
      print('Thêm thùng rác ${trashcan.serial} thành công!');
      return true;
    } else {
      print('Lỗi khi thêm thùng rác: ${response.statusCode}');
      return false;
    }
  } catch (e) {
    // Xử lý lỗi nếu có vấn đề xảy ra
    print('Lỗi khi gửi yêu cầu: $e');
    return false;
  }
}
