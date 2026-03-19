import 'package:flutter/material.dart';

class KeyPage extends StatefulWidget {
  State<KeyPage> createState() => PageKey();
}

class PageKey extends State<KeyPage> {
  List<String> items = ["A", "B", "C", "D", "E", "E"];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Keys Point here"),
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        // used for the scroll the page
        children: items.map((item) {
          return ListTile(
            key: UniqueKey(), // use the key here like UniqueKey ,ValueKey
            title: Text(
              item,
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            items.shuffle();
          });
        },
        child: Icon(Icons.share_outlined),
      ),
    );
  }
}
