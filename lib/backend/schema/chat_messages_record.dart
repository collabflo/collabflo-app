import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatMessagesRecord extends FirestoreRecord {
  ChatMessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "senderUid" field.
  DocumentReference? _senderUid;
  DocumentReference? get senderUid => _senderUid;
  bool hasSenderUid() => _senderUid != null;

  // "senderUsername" field.
  String? _senderUsername;
  String get senderUsername => _senderUsername ?? '';
  bool hasSenderUsername() => _senderUsername != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _message = snapshotData['message'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _senderUid = snapshotData['senderUid'] as DocumentReference?;
    _senderUsername = snapshotData['senderUsername'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('chatMessages')
          : FirebaseFirestore.instance.collectionGroup('chatMessages');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('chatMessages').doc(id);

  static Stream<ChatMessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatMessagesRecord.fromSnapshot(s));

  static Future<ChatMessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatMessagesRecord.fromSnapshot(s));

  static ChatMessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatMessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatMessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatMessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatMessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatMessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatMessagesRecordData({
  String? message,
  DateTime? timestamp,
  DocumentReference? senderUid,
  String? senderUsername,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'message': message,
      'timestamp': timestamp,
      'senderUid': senderUid,
      'senderUsername': senderUsername,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatMessagesRecordDocumentEquality
    implements Equality<ChatMessagesRecord> {
  const ChatMessagesRecordDocumentEquality();

  @override
  bool equals(ChatMessagesRecord? e1, ChatMessagesRecord? e2) {
    return e1?.message == e2?.message &&
        e1?.timestamp == e2?.timestamp &&
        e1?.senderUid == e2?.senderUid &&
        e1?.senderUsername == e2?.senderUsername;
  }

  @override
  int hash(ChatMessagesRecord? e) => const ListEquality()
      .hash([e?.message, e?.timestamp, e?.senderUid, e?.senderUsername]);

  @override
  bool isValidKey(Object? o) => o is ChatMessagesRecord;
}
