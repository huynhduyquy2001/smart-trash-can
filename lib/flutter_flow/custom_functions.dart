import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';

double? getCapacity(double cur) {
  return 100 - cur;
}

int numberFormat(String? string) {
  if (string == null) {
    return 0;
  }

  // Try parsing the string to an integer, with a fallback of 0 if parsing fails
  return int.tryParse(string) ?? 0;
}
