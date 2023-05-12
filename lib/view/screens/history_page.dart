import 'package:flutter/material.dart';

import '../../res/quote_list.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History Page"),
      ),
      body: Column(
        children: List.generate(
          Global.history.length,
          (index) => Card(
            child: ListTile(
              leading: Text("${index + 1}"),
              title: Text("${Global.history[index]['quote']}"),
            ),
          ),
        ).toList(),
      ),
    );
  }
}
