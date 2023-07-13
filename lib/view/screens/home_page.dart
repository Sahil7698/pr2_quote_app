import 'package:flutter/material.dart';
import 'package:quote_app/controllers/helpers/quote_helper.dart';

import '../../res/quote_list.dart';
import 'details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void insertAllRecord() async {
    for (int i = 0; i < Global.allQuotes.length; i++) {
      await DBHelper.dbHelper.insertRecord(
        quote: Global.allQuotes[i]['quote'],
        type: Global.allQuotes[i]['type'],
      );
    }
  }

  @override
  void initState() {
    super.initState();
    insertAllRecord();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quote App",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                'Quote App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
              ),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.history,
              ),
              title: const Text('History'),
              onTap: () {
                Navigator.pushNamed(context, "history_page");
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          title: "alone",
                          data: Global.allQuotes,
                        ),
                      ),
                    );
                  },
                  child: rowContainer(
                    title: "Alone",
                    icon: "😫",
                    color: Colors.red.shade300,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          title: "angry",
                          data: Global.allQuotes,
                        ),
                      ),
                    );
                  },
                  child: rowContainer(
                    title: "Angry",
                    icon: "😡",
                    color: Colors.blue.shade300,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          title: "happy",
                          data: Global.allQuotes,
                        ),
                      ),
                    );
                  },
                  child: rowContainer(
                    title: "Happy",
                    icon: "😊",
                    color: Colors.purple.shade300,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          title: "attitude",
                          data: Global.allQuotes,
                        ),
                      ),
                    );
                  },
                  child: rowContainer(
                    title: "Attitude",
                    icon: "🤨",
                    color: Colors.orange.shade300,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          title: "life",
                          data: Global.allQuotes,
                        ),
                      ),
                    );
                  },
                  child: rowContainer(
                    title: "Life",
                    icon: "♥",
                    color: Colors.teal.shade300,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          title: "time",
                          data: Global.allQuotes,
                        ),
                      ),
                    );
                  },
                  child: rowContainer(
                    title: "Time",
                    icon: "⌚",
                    color: Colors.brown.shade300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget rowContainer({
    required String title,
    required String icon,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        height: 180,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            Text(
              icon,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 70,
              ),
            )
          ],
        ),
      ),
    );
  }
}
