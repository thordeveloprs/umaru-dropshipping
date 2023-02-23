import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';

List<dynamic> getProductsList(
  List<dynamic> productList,
  int pageIndex,
) {
  List<dynamic> newList = [];
  int init = pageIndex * 4;
  int end = init + 4;
  return productList.sublist(init, end);
}

List<int> getpagenumbers(List<dynamic> productList) {
  List<int> sample = [];
  // double l = 0;
  // if (productList.length % 4 == 0) {
  //   l = productList.length / 4;
  // } else {
  //   l = productList.length / 4 + 1;
  // }
  for (int i = 0; i < (productList.length / 4).ceil(); i++) {
    sample.add(1);
  }
  return sample;
}

List<dynamic> getproduct(
  List<dynamic> productList,
  int pageIndex,
) {
  List<dynamic> newList = [];
  int init = pageIndex * 4;
  int end = init + 4;
  return productList.sublist(init, end);
}
