import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String title;
  final List data;
  const DetailPage({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int q = 0;

  void changeTime() {
    for (int i = 0; i < widget.data.length; i++) {
      Future.delayed(const Duration(seconds: 10), () {
        setState(() {
          q = i;
        });
        //Global.history = widget.data[i]['quote'];
        changeTime();
      });
    }
  }

  @override
  void initState() {
    super.initState();

    changeTime();
  }

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
                    "${widget.data[q]['quote']}",
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
