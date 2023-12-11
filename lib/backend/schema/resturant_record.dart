import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ResturantRecord extends FirestoreRecord {
  ResturantRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "products" field.
  List<DocumentReference>? _products;
  List<DocumentReference> get products => _products ?? const [];
  bool hasProducts() => _products != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _products = getDataList(snapshotData['products']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('resturant');

  static Stream<ResturantRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ResturantRecord.fromSnapshot(s));

  static Future<ResturantRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ResturantRecord.fromSnapshot(s));

  static ResturantRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ResturantRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ResturantRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ResturantRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ResturantRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ResturantRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createResturantRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class ResturantRecordDocumentEquality implements Equality<ResturantRecord> {
  const ResturantRecordDocumentEquality();

  @override
  bool equals(ResturantRecord? e1, ResturantRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        listEquality.equals(e1?.products, e2?.products);
  }

  @override
  int hash(ResturantRecord? e) =>
      const ListEquality().hash([e?.name, e?.products]);

  @override
  bool isValidKey(Object? o) => o is ResturantRecord;
}
