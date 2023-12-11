// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SaleStruct extends FFFirebaseStruct {
  SaleStruct({
    List<String>? month,
    List<double>? sale,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _month = month,
        _sale = sale,
        super(firestoreUtilData);

  // "month" field.
  List<String>? _month;
  List<String> get month => _month ?? const [];
  set month(List<String>? val) => _month = val;
  void updateMonth(Function(List<String>) updateFn) => updateFn(_month ??= []);
  bool hasMonth() => _month != null;

  // "sale" field.
  List<double>? _sale;
  List<double> get sale => _sale ?? const [];
  set sale(List<double>? val) => _sale = val;
  void updateSale(Function(List<double>) updateFn) => updateFn(_sale ??= []);
  bool hasSale() => _sale != null;

  static SaleStruct fromMap(Map<String, dynamic> data) => SaleStruct(
        month: getDataList(data['month']),
        sale: getDataList(data['sale']),
      );

  static SaleStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? SaleStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'month': _month,
        'sale': _sale,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'month': serializeParam(
          _month,
          ParamType.String,
          true,
        ),
        'sale': serializeParam(
          _sale,
          ParamType.double,
          true,
        ),
      }.withoutNulls;

  static SaleStruct fromSerializableMap(Map<String, dynamic> data) =>
      SaleStruct(
        month: deserializeParam<String>(
          data['month'],
          ParamType.String,
          true,
        ),
        sale: deserializeParam<double>(
          data['sale'],
          ParamType.double,
          true,
        ),
      );

  @override
  String toString() => 'SaleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SaleStruct &&
        listEquality.equals(month, other.month) &&
        listEquality.equals(sale, other.sale);
  }

  @override
  int get hashCode => const ListEquality().hash([month, sale]);
}

SaleStruct createSaleStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SaleStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SaleStruct? updateSaleStruct(
  SaleStruct? saleStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    saleStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSaleStructData(
  Map<String, dynamic> firestoreData,
  SaleStruct? saleStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (saleStruct == null) {
    return;
  }
  if (saleStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && saleStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final saleStructData = getSaleFirestoreData(saleStruct, forFieldValue);
  final nestedData = saleStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = saleStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSaleFirestoreData(
  SaleStruct? saleStruct, [
  bool forFieldValue = false,
]) {
  if (saleStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(saleStruct.toMap());

  // Add any Firestore field values
  saleStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSaleListFirestoreData(
  List<SaleStruct>? saleStructs,
) =>
    saleStructs?.map((e) => getSaleFirestoreData(e, true)).toList() ?? [];
