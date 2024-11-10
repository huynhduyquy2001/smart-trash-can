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

import 'dart:convert'; // For JSON decoding
import 'package:http/http.dart' as http; // For API requests

Future<List<TrashcanStruct>> getTrashcanList() async {
  const String apiUrl =
      'https://pikachu-uq2hjp-default-rtdb.firebaseio.com/trash_bins.json';

  try {
    // Gọi API và lấy dữ liệu từ Firebase
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Giải mã JSON thành Map<String, dynamic>
      final data = jsonDecode(response.body) as Map<String, dynamic>;

      // Chuyển đổi Map thành danh sách TrashcanStruct
      List<TrashcanStruct> trashcanList = data.entries.map((entry) {
        final value = entry.value;
        return TrashcanStruct(
          cur: value['cur'] ?? 0,
          owner: value['owner'] ?? 'Unknown',
          serial: value['serial'] ?? 0,
          usage: value['usage'] ?? 'No information',
        );
      }).toList();

      return trashcanList;
    } else {
      throw Exception('Failed to load trash bins');
    }
  } catch (e) {
    print('Error fetching trash bins: $e');
    return [];
  }
}
