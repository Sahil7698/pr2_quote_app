import 'package:flutter/material.dart';

import '../../res/quote_list.dart';

class DetailPage extends StatefulWidget {
  final String title;
  const DetailPage({Key? key, required this.title}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          alignment: Alignment.center,
          height: 700,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.red.shade300,
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: List.generate(
                  1,
                  (index) => Text(
                    "${Global.alone[1]['quote']}",
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
