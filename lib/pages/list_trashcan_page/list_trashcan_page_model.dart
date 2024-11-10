import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import 'list_trashcan_page_widget.dart' show ListTrashcanPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListTrashcanPageModel extends FlutterFlowModel<ListTrashcanPageWidget> {
  ///  Local state fields for this page.

  List<int> trashcan = [];
  void addToTrashcan(int item) => trashcan.add(item);
  void removeFromTrashcan(int item) => trashcan.remove(item);
  void removeAtIndexFromTrashcan(int index) => trashcan.removeAt(index);
  void insertAtIndexInTrashcan(int index, int item) =>
      trashcan.insert(index, item);
  void updateTrashcanAtIndex(int index, Function(int) updateFn) =>
      trashcan[index] = updateFn(trashcan[index]);

  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  // Stores action output result for [Custom Action - getTrashcanNumberList] action in ListTrashcanPage widget.
  List<int>? list;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
