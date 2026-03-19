import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowForm extends StatefulWidget {
  @override
  State<ShowForm> createState() => MyShowFrom();
}

class MyShowFrom extends State<ShowForm> {
  List<Map<String, dynamic>> eventList = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    List<String> storedList = pref.getStringList("events") ?? [];

    setState(() {
      eventList = storedList
          .map((e) => jsonDecode(e) as Map<String, dynamic>)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Show Event Details"), centerTitle: true),

      body: eventList.isEmpty
          ? Center(child: Text("data is not found"))
          : ListView.builder(
              itemBuilder: (context, index) {
                // if (index >= eventList.length) {
                //   return SizedBox(); // safety
                // }
                final data = eventList[index];

                return Card(
                  margin: EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 6,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: kIsWeb
                              ? Image.network(data['image'], height: 150)
                              : Image.file(
                                  File(data['image']),
                                  height: 150,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          data['name'] ?? "",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 5),
                        Text(data['desc'] ?? ""),

                        SizedBox(height: 5),
                        Text(
                          data['date'] ?? "",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
