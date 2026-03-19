import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataPage extends StatefulWidget {
  State<DataPage> createState() => _DataFlow();
}

class _DataFlow extends State<DataPage> {
  // this is take the user input and store inside the nameController from the TextFiled
  TextEditingController nameController = TextEditingController();

  // use this variable for accept the data and store inside this variable
  String saveName = "";

  // built in this method used for the save data
  // this method help to loading the page then show the last one store data in the local storage
  // no write this method then loss the data and we write then latest data store and show
  @override
  void initState() {
    super.initState();
    loadData(); // Load saved data when app starts
  }

  void saveData() async {
    // this is write for access the local storage from the browser
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // using this one we can store the name in key value pair
    await prefs.setString("myName", nameController.text);

    // after refresh the page then show the updated value using the setState
    // means change the value then store the new value inside the saveName
    setState(() {
      saveName = nameController.text;
    });
  }

  // this method used in the initState because after rendering the page then show the updated value and last one
  void loadData() async {
    // this is used to help store the data in local storage
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? data = prefs.getString("myName");

    // inside that use the default value means first time show this one then show your data.
    setState(() {
      saveName = data ?? "No Data Found";
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Save Data in Local Storage"),
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 25),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Name",
                hintText: "Enter your Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: saveData,
              child: Text("Save Data"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.yellow,
              ),
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Your Name is: ",
                  style: TextStyle(color: Colors.orange, fontSize: 20),
                ),
                SizedBox(width: 10),
                Text(" $saveName", style: TextStyle(fontSize: 18)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
