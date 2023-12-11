import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

double? coupon(
  String? couponvalue,
  List<double> cart,
) {
  // add the total cart cost from the list and if coupon for percent is applied provide discounted amount
  double totalCost = cart.reduce((value, element) => value + element);
  if (couponvalue != null && couponvalue.isNotEmpty) {
    double discountPercent = double.tryParse(couponvalue) ?? 0;
    if (discountPercent > 0 && discountPercent <= 100) {
      double discountAmount = (discountPercent / 100) * totalCost;
      return totalCost - discountAmount;
    }
  }
  return totalCost;
}

double quantityPricing(
  double price,
  int quantity,
) {
  // multipy to get price according to quantity
  return price * quantity;
}
