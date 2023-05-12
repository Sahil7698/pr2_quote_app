import 'package:flutter/material.dart';
import 'package:pr2_quote_app/view/screens/details_page.dart';
import 'package:pr2_quote_app/view/screens/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        'detail_page': (context) => const DetailPage(
              title: '',
              data: [],
            ),
      },
    ),
  );
}
