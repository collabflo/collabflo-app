import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotifyRecord extends FirestoreRecord {
  NotifyRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notify');

  static Stream<NotifyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotifyRecord.fromSnapshot(s));

  static Future<NotifyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotifyRecord.fromSnapshot(s));

  static NotifyRecord fromSnapshot(DocumentSnapshot snapshot) => NotifyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotifyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotifyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotifyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotifyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotifyRecordData({
  String? email,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotifyRecordDocumentEquality implements Equality<NotifyRecord> {
  const NotifyRecordDocumentEquality();

  @override
  bool equals(NotifyRecord? e1, NotifyRecord? e2) {
    return e1?.email == e2?.email;
  }

  @override
  int hash(NotifyRecord? e) => const ListEquality().hash([e?.email]);

  @override
  bool isValidKey(Object? o) => o is NotifyRecord;
}
