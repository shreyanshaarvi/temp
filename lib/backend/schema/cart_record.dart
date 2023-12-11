import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class CartRecord extends FirestoreRecord {
  CartRecord._(
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

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "productRef" field.
  DocumentReference? _productRef;
  DocumentReference? get productRef => _productRef;
  bool hasProductRef() => _productRef != null;

  // "quanity" field.
  int? _quanity;
  int get quanity => _quanity ?? 0;
  bool hasQuanity() => _quanity != null;

  // "orginalPrice" field.
  double? _orginalPrice;
  double get orginalPrice => _orginalPrice ?? 0.0;
  bool hasOrginalPrice() => _orginalPrice != null;

  // "product_name" field.
  String? _productName;
  String get productName => _productName ?? '';
  bool hasProductName() => _productName != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _pId = snapshotData['p_id'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _productRef = snapshotData['productRef'] as DocumentReference?;
    _quanity = castToType<int>(snapshotData['quanity']);
    _orginalPrice = castToType<double>(snapshotData['orginalPrice']);
    _productName = snapshotData['product_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cart');

  static Stream<CartRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CartRecord.fromSnapshot(s));

  static Future<CartRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CartRecord.fromSnapshot(s));

  static CartRecord fromSnapshot(DocumentSnapshot snapshot) => CartRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CartRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CartRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CartRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CartRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCartRecordData({
  DocumentReference? userRef,
  String? pId,
  double? price,
  DocumentReference? productRef,
  int? quanity,
  double? orginalPrice,
  String? productName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'p_id': pId,
      'price': price,
      'productRef': productRef,
      'quanity': quanity,
      'orginalPrice': orginalPrice,
      'product_name': productName,
    }.withoutNulls,
  );

  return firestoreData;
}

class CartRecordDocumentEquality implements Equality<CartRecord> {
  const CartRecordDocumentEquality();

  @override
  bool equals(CartRecord? e1, CartRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.pId == e2?.pId &&
        e1?.price == e2?.price &&
        e1?.productRef == e2?.productRef &&
        e1?.quanity == e2?.quanity &&
        e1?.orginalPrice == e2?.orginalPrice &&
        e1?.productName == e2?.productName;
  }

  @override
  int hash(CartRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.pId,
        e?.price,
        e?.productRef,
        e?.quanity,
        e?.orginalPrice,
        e?.productName
      ]);

  @override
  bool isValidKey(Object? o) => o is CartRecord;
}
