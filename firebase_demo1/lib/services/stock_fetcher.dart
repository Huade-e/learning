import 'dart:ffi';
import 'package:firebase_demo1/models/stock_info.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class StockFetcher {
  List<StockInfo> fetchStocks(List<String> tickers) {
    List<StockInfo> returnValue = [];
    for (int i = 0; i < tickers.length; i++) {
      returnValue.add(StockInfo(ticker: tickers[i], price: 68.99, percentageChange: 7.68));
    }
    return returnValue;
  }

  static DataRow asDataRow(StockInfo stockInfo) {
    String percentageChange = '${stockInfo.percentageChange}%';
    late TextStyle style;

    if (stockInfo.percentageChange >= 0) {
      percentageChange = '+$percentageChange';
      style = const TextStyle(fontWeight: FontWeight.bold, color: Colors.green);
    }
    else {
      style = const TextStyle(fontWeight: FontWeight.bold, color: Colors.red);
    }

    return DataRow(cells: [
      DataCell(Text(stockInfo.ticker)),
      DataCell(Text('${stockInfo.price} USD')),
      DataCell(Text(percentageChange, style: style,)),
    ]);
  }

  static List<DataRow> buildTable(List<StockInfo> stocks) {
    List<DataRow> returnValue = [];

    for (int i = 0; i < stocks.length; i++) {
      StockInfo cur = stocks[i];
      returnValue.add(asDataRow(cur));
    }

    return returnValue;
  }
}