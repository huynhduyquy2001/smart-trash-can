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

Future<TrashcanRecord?> getTrashcan(String serial) async {
  // Fetch the trashcan record with the matching serial from the database
  final querySnapshot = await FirebaseFirestore.instance
      .collection('trashcan') // Replace with your actual collection name
      .where('serial', isEqualTo: serial)
      .limit(1) // We only need the first match
      .get();

  // Check if we found a matching document
  if (querySnapshot.docs.isNotEmpty) {
    // Return the first matching TrashcanRecord
    return TrashcanRecord.fromSnapshot(querySnapshot.docs.first);
  } else {
    // Return null if no matching record was found
    return null;
  }
}
