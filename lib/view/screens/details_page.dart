import 'package:flutter/material.dart';

import '../../controllers/helpers/quote_helper.dart';
import '../../model/quote_model.dart';

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
  int q = 1;

  void changeTime() {
    for (int i = 1; i < 6; i++) {
      Future.delayed(const Duration(seconds: 10), () {
        setState(() {
          q = i;
        });

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
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new)),
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder(
          future: DBHelper.dbHelper.getAllRecords(type: widget.title),
          builder: (context, snapShot) {
            if (snapShot.hasError) {
              return Text(
                "${snapShot.hasError}",
              );
            } else if (snapShot.hasData) {
              List<Quote> data = snapShot.data as List<Quote>;
              return (data == null || data.isEmpty)
                  ? const Center(
                      child: Text(
                        "No Data Available...",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    )
                  : Padding(
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
                              children: [
                                Text(
                                  data[q].quote,
                                  style: const TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
