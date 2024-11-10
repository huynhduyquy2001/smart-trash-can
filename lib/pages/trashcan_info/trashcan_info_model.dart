import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component/notification/notification_widget.dart';
import '/component/remove_trashcan/remove_trashcan_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:math' as math;
import 'trashcan_info_widget.dart' show TrashcanInfoWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TrashcanInfoModel extends FlutterFlowModel<TrashcanInfoWidget> {
  ///  Local state fields for this page.

  TrashcanStruct? trashcan;
  void updateTrashcanStruct(Function(TrashcanStruct) updateFn) {
    updateFn(trashcan ??= TrashcanStruct());
  }

  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - API (findTrashbin)] action in TrashcanInfo widget.
  ApiCallResponse? apiResultq2v;
  InstantTimer? instantTimer60;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
    instantTimer60?.cancel();
  }
}
