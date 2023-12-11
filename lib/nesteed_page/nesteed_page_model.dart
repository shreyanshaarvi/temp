import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'nesteed_page_widget.dart' show NesteedPageWidget;
import 'package:flutter/material.dart';

class NesteedPageModel extends FlutterFlowModel<NesteedPageWidget> {
  ///  Local state fields for this page.

  String? coupon = '';

  String? confirmCoupon = '';

  double? price;

  List<int> quantity = [];
  void addToQuantity(int item) => quantity.add(item);
  void removeFromQuantity(int item) => quantity.remove(item);
  void removeAtIndexFromQuantity(int index) => quantity.removeAt(index);
  void insertAtIndexInQuantity(int index, int item) =>
      quantity.insert(index, item);
  void updateQuantityAtIndex(int index, Function(int) updateFn) =>
      quantity[index] = updateFn(quantity[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in NesteedPage widget.
  List<CartRecord>? costCalculation;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
