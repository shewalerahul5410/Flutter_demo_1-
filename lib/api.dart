import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiWork extends StatefulWidget {
  State<ApiWork> createState() => AApiWork();
}

class AApiWork extends State<ApiWork> {
  List postList = [];
  bool isLoading = false;

  Future<void> fetchPosts() async {
    final responce = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
    );
    if (responce.statusCode == 200) {
      setState(() {
        postList = jsonDecode(responce.body);
        isLoading = true;
      });
    } else {
      print("Faild your Api check the data flow");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Working"),
        backgroundColor: Colors.deepPurple,
      ),
      body: isLoading
          ? SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,

                child: DataTable(
                  columns: [
                    DataColumn(label: Text("ID")),
                    DataColumn(label: Text("Titles")),
                    DataColumn(label: Text("Body")),
                  ],
                  rows: postList.map((post) {
                    return DataRow(
                      cells: [
                        DataCell(Text(post["id"].toString())),
                        DataCell(
                          Container(width: 200, child: Text(post["title"])),
                        ),
                        DataCell(
                          Container(width: 300, child: Text(post["body"])),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
