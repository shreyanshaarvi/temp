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
import '/backend/schema/structs/index.dart';
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

List<String> listofmonth(
  List<DateTime> dates,
  String? filterMonth,
) {
  // create list of month according to given date and filter it to the given instruction l
  List<String> months =
      dates.map((date) => DateFormat('MMMM').format(date)).toList();
  if (filterMonth != null && filterMonth.isNotEmpty) {
    months = months
        .where(
            (month) => month.toLowerCase().contains(filterMonth.toLowerCase()))
        .toList();
  }
  return months;
}

double add(
  List<DateTime> date,
  List<double> price,
) {
  // create a map to store the total price for each month
// create a map to store the total price for each month
  Map<String, double> monthlyTotal = {};

  // loop through the dates and prices and add them to the monthlyTotal map
  for (int i = 0; i < date.length; i++) {
    String month = DateFormat('MMMM yyyy').format(date[i]);
    if (monthlyTotal.containsKey(month)) {
      monthlyTotal[month] = monthlyTotal[month]! + price[i];
    } else {
      monthlyTotal[month] = price[i];
    }
  }

  // calculate the overall total and return it
  double overallTotal = monthlyTotal.values.reduce((a, b) => a + b);
  return overallTotal;
}
