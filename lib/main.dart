import 'package:flutter/material.dart';
import 'package:pr2_quote_app/view/screens/details_page.dart';
import 'package:pr2_quote_app/view/screens/history_page.dart';
import 'package:pr2_quote_app/view/screens/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        'detail_page': (context) => const DetailPage(title: '', data: []),
        'history_page': (context) => const HistoryPage(),
      },
    ),
  );
}
