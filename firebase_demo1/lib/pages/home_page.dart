import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/stock_info.dart';
import '../services/stock_fetcher.dart';

StockFetcher stockFetcher = StockFetcher();
List<String> tickers = [
  "GOOGL",
  "TSLA",
  "AAPL",
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Watch List",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),

      body: Center(
        child: Column(
          children: [
            DataTable(columns: const [
              DataColumn(label: Text("Symbol")),
              DataColumn(label: Text("Price")),
              DataColumn(label: Text("Change")),
            ], rows: StockFetcher.buildTable(stockFetcher.fetchStocks(tickers)))
          ],
        ),
      ),
    );
  }
}

// child: ElevatedButton(
//   onPressed: () {
//     FirebaseAuth.instance.signOut().then((value) {
//       print("Signed out");
//       Navigator.pushNamed(context, '/');
//     });
//   },
//   child: const Text('Logout'),
// ),


//Sign Out Button
// body: Center(
// child: ElevatedButton(
//   onPressed: () {
//     FirebaseAuth.instance.signOut().then((value) {
//       print("Signed out");
//       Navigator.pushNamed(context, '/');
//     });
//   },
//   style: ButtonStyle(
//     backgroundColor: MaterialStateProperty.resolveWith((states) {
//       if (states.contains(MaterialState.pressed)) {
//         return Colors.black26;
//       }
//       return Colors.white;
//     }),
//     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//       RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(30),
//       ),
//     ),
//   ),
//   child: const Text('Log Out',
//     style: TextStyle(
//         color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
//   ),
// ),
// child: ,