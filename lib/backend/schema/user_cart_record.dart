import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class UserCartRecord extends FirestoreRecord {
  UserCartRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "p_id" field.
  String? _pId;
  String get pId => _pId ?? '';
  bool hasPId() => _pId != null;

  // "p_price" field.
  double? _pPrice;
  double get pPrice => _pPrice ?? 0.0;
  bool hasPPrice() => _pPrice != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _pId = snapshotData['p_id'] as String?;
    _pPrice = castToType<double>(snapshotData['p_price']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('User_cart')
          : FirebaseFirestore.instance.collectionGroup('User_cart');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('User_cart').doc();

  static Stream<UserCartRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserCartRecord.fromSnapshot(s));

  static Future<UserCartRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserCartRecord.fromSnapshot(s));

  static UserCartRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserCartRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserCartRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserCartRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserCartRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserCartRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserCartRecordData({
  DocumentReference? userRef,
  String? pId,
  double? pPrice,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'p_id': pId,
      'p_price': pPrice,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserCartRecordDocumentEquality implements Equality<UserCartRecord> {
  const UserCartRecordDocumentEquality();

  @override
  bool equals(UserCartRecord? e1, UserCartRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.pId == e2?.pId &&
        e1?.pPrice == e2?.pPrice;
  }

  @override
  int hash(UserCartRecord? e) =>
      const ListEquality().hash([e?.userRef, e?.pId, e?.pPrice]);

  @override
  bool isValidKey(Object? o) => o is UserCartRecord;
}
