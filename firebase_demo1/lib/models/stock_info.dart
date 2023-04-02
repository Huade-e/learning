import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class StockInfo {
  late String ticker;
  late double price = 103.73;
  late double percentageChange = 2.81;
  // late String urlApi;
  // late Map data;

  StockInfo({required this.ticker, required this.price, required this.percentageChange});
}