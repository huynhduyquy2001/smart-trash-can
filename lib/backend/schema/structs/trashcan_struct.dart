// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TrashcanStruct extends FFFirebaseStruct {
  TrashcanStruct({
    int? serial,
    String? owner,
    String? usage,
    int? cur,
    int? doRac,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _serial = serial,
        _owner = owner,
        _usage = usage,
        _cur = cur,
        _doRac = doRac,
        super(firestoreUtilData);

  // "serial" field.
  int? _serial;
  int get serial => _serial ?? 0;
  set serial(int? val) => _serial = val;

  void incrementSerial(int amount) => serial = serial + amount;

  bool hasSerial() => _serial != null;

  // "owner" field.
  String? _owner;
  String get owner => _owner ?? '';
  set owner(String? val) => _owner = val;

  bool hasOwner() => _owner != null;

  // "usage" field.
  String? _usage;
  String get usage => _usage ?? '';
  set usage(String? val) => _usage = val;

  bool hasUsage() => _usage != null;

  // "cur" field.
  int? _cur;
  int get cur => _cur ?? 0;
  set cur(int? val) => _cur = val;

  void incrementCur(int amount) => cur = cur + amount;

  bool hasCur() => _cur != null;

  // "do_rac" field.
  int? _doRac;
  int get doRac => _doRac ?? 0;
  set doRac(int? val) => _doRac = val;

  void incrementDoRac(int amount) => doRac = doRac + amount;

  bool hasDoRac() => _doRac != null;

  static TrashcanStruct fromMap(Map<String, dynamic> data) => TrashcanStruct(
        serial: castToType<int>(data['serial']),
        owner: data['owner'] as String?,
        usage: data['usage'] as String?,
        cur: castToType<int>(data['cur']),
        doRac: castToType<int>(data['do_rac']),
      );

  static TrashcanStruct? maybeFromMap(dynamic data) =>
      data is Map ? TrashcanStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'serial': _serial,
        'owner': _owner,
        'usage': _usage,
        'cur': _cur,
        'do_rac': _doRac,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'serial': serializeParam(
          _serial,
          ParamType.int,
        ),
        'owner': serializeParam(
          _owner,
          ParamType.String,
        ),
        'usage': serializeParam(
          _usage,
          ParamType.String,
        ),
        'cur': serializeParam(
          _cur,
          ParamType.int,
        ),
        'do_rac': serializeParam(
          _doRac,
          ParamType.int,
        ),
      }.withoutNulls;

  static TrashcanStruct fromSerializableMap(Map<String, dynamic> data) =>
      TrashcanStruct(
        serial: deserializeParam(
          data['serial'],
          ParamType.int,
          false,
        ),
        owner: deserializeParam(
          data['owner'],
          ParamType.String,
          false,
        ),
        usage: deserializeParam(
          data['usage'],
          ParamType.String,
          false,
        ),
        cur: deserializeParam(
          data['cur'],
          ParamType.int,
          false,
        ),
        doRac: deserializeParam(
          data['do_rac'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'TrashcanStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TrashcanStruct &&
        serial == other.serial &&
        owner == other.owner &&
        usage == other.usage &&
        cur == other.cur &&
        doRac == other.doRac;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([serial, owner, usage, cur, doRac]);
}

TrashcanStruct createTrashcanStruct({
  int? serial,
  String? owner,
  String? usage,
  int? cur,
  int? doRac,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TrashcanStruct(
      serial: serial,
      owner: owner,
      usage: usage,
      cur: cur,
      doRac: doRac,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TrashcanStruct? updateTrashcanStruct(
  TrashcanStruct? trashcan, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    trashcan
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTrashcanStructData(
  Map<String, dynamic> firestoreData,
  TrashcanStruct? trashcan,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (trashcan == null) {
    return;
  }
  if (trashcan.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && trashcan.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final trashcanData = getTrashcanFirestoreData(trashcan, forFieldValue);
  final nestedData = trashcanData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = trashcan.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTrashcanFirestoreData(
  TrashcanStruct? trashcan, [
  bool forFieldValue = false,
]) {
  if (trashcan == null) {
    return {};
  }
  final firestoreData = mapToFirestore(trashcan.toMap());

  // Add any Firestore field values
  trashcan.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTrashcanListFirestoreData(
  List<TrashcanStruct>? trashcans,
) =>
    trashcans?.map((e) => getTrashcanFirestoreData(e, true)).toList() ?? [];
