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

Future<bool> emptyTrash(int serial) async {
  // Construct the URL using the provided serial number
  final url = Uri.parse(
      'https://pikachu-uq2hjp-default-rtdb.firebaseio.com/trash_bins/$serial.json');

  try {
    // Create the updated data with 'cur' set to 0
    final updatedData = jsonEncode({"do_rac": 1});

    // Send PATCH request to update the 'cur' value
    final response = await http.patch(
      url,
      body: updatedData,
      headers: {"Content-Type": "application/json"},
    );

    // Check if the response status is 200 (successful update)
    if (response.statusCode == 200) {
      print('Trashcan $serial emptied successfully.');
      return true;
    } else {
      print(
          'Failed to empty trashcan: ${response.statusCode} - ${response.body}');
      return false;
    }
  } catch (e) {
    // Handle any errors that occur during the request
    print('Error emptying trashcan: $e');
    return false;
  }
}
