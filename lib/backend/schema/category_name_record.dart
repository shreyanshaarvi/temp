import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class CategoryNameRecord extends FirestoreRecord {
  CategoryNameRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('CategoryName');

  static Stream<CategoryNameRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoryNameRecord.fromSnapshot(s));

  static Future<CategoryNameRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoryNameRecord.fromSnapshot(s));

  static CategoryNameRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoryNameRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoryNameRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoryNameRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoryNameRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoryNameRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoryNameRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoryNameRecordDocumentEquality
    implements Equality<CategoryNameRecord> {
  const CategoryNameRecordDocumentEquality();

  @override
  bool equals(CategoryNameRecord? e1, CategoryNameRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(CategoryNameRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is CategoryNameRecord;
}
