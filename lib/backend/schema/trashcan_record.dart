import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TrashcanRecord extends FirestoreRecord {
  TrashcanRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "serial" field.
  String? _serial;
  String get serial => _serial ?? '';
  bool hasSerial() => _serial != null;

  // "owner" field.
  String? _owner;
  String get owner => _owner ?? '';
  bool hasOwner() => _owner != null;

  // "usage" field.
  String? _usage;
  String get usage => _usage ?? '';
  bool hasUsage() => _usage != null;

  // "cur" field.
  double? _cur;
  double get cur => _cur ?? 0.0;
  bool hasCur() => _cur != null;

  // "do_rac" field.
  int? _doRac;
  int get doRac => _doRac ?? 0;
  bool hasDoRac() => _doRac != null;

  void _initializeFields() {
    _serial = snapshotData['serial'] as String?;
    _owner = snapshotData['owner'] as String?;
    _usage = snapshotData['usage'] as String?;
    _cur = castToType<double>(snapshotData['cur']);
    _doRac = castToType<int>(snapshotData['do_rac']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('trashcan');

  static Stream<TrashcanRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TrashcanRecord.fromSnapshot(s));

  static Future<TrashcanRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TrashcanRecord.fromSnapshot(s));

  static TrashcanRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TrashcanRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TrashcanRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TrashcanRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TrashcanRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TrashcanRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTrashcanRecordData({
  String? serial,
  String? owner,
  String? usage,
  double? cur,
  int? doRac,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'serial': serial,
      'owner': owner,
      'usage': usage,
      'cur': cur,
      'do_rac': doRac,
    }.withoutNulls,
  );

  return firestoreData;
}

class TrashcanRecordDocumentEquality implements Equality<TrashcanRecord> {
  const TrashcanRecordDocumentEquality();

  @override
  bool equals(TrashcanRecord? e1, TrashcanRecord? e2) {
    return e1?.serial == e2?.serial &&
        e1?.owner == e2?.owner &&
        e1?.usage == e2?.usage &&
        e1?.cur == e2?.cur &&
        e1?.doRac == e2?.doRac;
  }

  @override
  int hash(TrashcanRecord? e) => const ListEquality()
      .hash([e?.serial, e?.owner, e?.usage, e?.cur, e?.doRac]);

  @override
  bool isValidKey(Object? o) => o is TrashcanRecord;
}
