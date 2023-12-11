import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _cartRef =
          prefs.getStringList('ff_cartRef')?.map((path) => path.ref).toList() ??
              _cartRef;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<DocumentReference> _cartRef = [];
  List<DocumentReference> get cartRef => _cartRef;
  set cartRef(List<DocumentReference> value) {
    _cartRef = value;
    prefs.setStringList('ff_cartRef', value.map((x) => x.path).toList());
  }

  void addToCartRef(DocumentReference value) {
    _cartRef.add(value);
    prefs.setStringList('ff_cartRef', _cartRef.map((x) => x.path).toList());
  }

  void removeFromCartRef(DocumentReference value) {
    _cartRef.remove(value);
    prefs.setStringList('ff_cartRef', _cartRef.map((x) => x.path).toList());
  }

  void removeAtIndexFromCartRef(int index) {
    _cartRef.removeAt(index);
    prefs.setStringList('ff_cartRef', _cartRef.map((x) => x.path).toList());
  }

  void updateCartRefAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _cartRef[index] = updateFn(_cartRef[index]);
    prefs.setStringList('ff_cartRef', _cartRef.map((x) => x.path).toList());
  }

  void insertAtIndexInCartRef(int index, DocumentReference value) {
    _cartRef.insert(index, value);
    prefs.setStringList('ff_cartRef', _cartRef.map((x) => x.path).toList());
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
