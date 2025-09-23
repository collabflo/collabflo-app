import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProfilesRecord extends FirestoreRecord {
  ProfilesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "isVerified" field.
  String? _isVerified;
  String get isVerified => _isVerified ?? '';
  bool hasIsVerified() => _isVerified != null;

  // "userType" field.
  String? _userType;
  String get userType => _userType ?? '';
  bool hasUserType() => _userType != null;

  // "website" field.
  String? _website;
  String get website => _website ?? '';
  bool hasWebsite() => _website != null;

  // "profile_pic" field.
  String? _profilePic;
  String get profilePic => _profilePic ?? '';
  bool hasProfilePic() => _profilePic != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _category = snapshotData['category'] as String?;
    _location = snapshotData['location'] as String?;
    _bio = snapshotData['bio'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _username = snapshotData['username'] as String?;
    _isVerified = snapshotData['isVerified'] as String?;
    _userType = snapshotData['userType'] as String?;
    _website = snapshotData['website'] as String?;
    _profilePic = snapshotData['profile_pic'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('profiles');

  static Stream<ProfilesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProfilesRecord.fromSnapshot(s));

  static Future<ProfilesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProfilesRecord.fromSnapshot(s));

  static ProfilesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProfilesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProfilesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProfilesRecord._(reference, mapFromFirestore(data));

  static ProfilesRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ProfilesRecord.getDocumentFromData(
        {
          'user_id': snapshot.data['user_id'],
          'display_name': snapshot.data['display_name'],
          'category': snapshot.data['category'],
          'location': snapshot.data['location'],
          'bio': snapshot.data['bio'],
          'created_at': convertAlgoliaParam(
            snapshot.data['created_at'],
            ParamType.DateTime,
            false,
          ),
          'username': snapshot.data['username'],
          'isVerified': snapshot.data['isVerified'],
          'userType': snapshot.data['userType'],
          'website': snapshot.data['website'],
          'profile_pic': snapshot.data['profile_pic'],
        },
        ProfilesRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ProfilesRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'profiles',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'ProfilesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProfilesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProfilesRecordData({
  String? userId,
  String? displayName,
  String? category,
  String? location,
  String? bio,
  DateTime? createdAt,
  String? username,
  String? isVerified,
  String? userType,
  String? website,
  String? profilePic,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'display_name': displayName,
      'category': category,
      'location': location,
      'bio': bio,
      'created_at': createdAt,
      'username': username,
      'isVerified': isVerified,
      'userType': userType,
      'website': website,
      'profile_pic': profilePic,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProfilesRecordDocumentEquality implements Equality<ProfilesRecord> {
  const ProfilesRecordDocumentEquality();

  @override
  bool equals(ProfilesRecord? e1, ProfilesRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.displayName == e2?.displayName &&
        e1?.category == e2?.category &&
        e1?.location == e2?.location &&
        e1?.bio == e2?.bio &&
        e1?.createdAt == e2?.createdAt &&
        e1?.username == e2?.username &&
        e1?.isVerified == e2?.isVerified &&
        e1?.userType == e2?.userType &&
        e1?.website == e2?.website &&
        e1?.profilePic == e2?.profilePic;
  }

  @override
  int hash(ProfilesRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.displayName,
        e?.category,
        e?.location,
        e?.bio,
        e?.createdAt,
        e?.username,
        e?.isVerified,
        e?.userType,
        e?.website,
        e?.profilePic
      ]);

  @override
  bool isValidKey(Object? o) => o is ProfilesRecord;
}
