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

Future<bool> deleteTrashcan(int serial) async {
  // Construct the URL using the provided serial number
  final url = Uri.parse(
      'https://pikachu-uq2hjp-default-rtdb.firebaseio.com/trash_bins/$serial.json');

  try {
    // Send DELETE request to the Firebase Realtime Database
    final response = await http.delete(url);

    // Check if the response status is 200 or 204 (successful deletion)
    if (response.statusCode == 200 || response.statusCode == 204) {
      print('Trashcan $serial deleted successfully.');
      return true;
    } else {
      print(
          'Failed to delete trashcan: ${response.statusCode} - ${response.body}');
      return false;
    }
  } catch (e) {
    // Handle any errors that occur during the request
    print('Error deleting trashcan: $e');
    return false;
  }
}
