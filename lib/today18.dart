import 'package:flutter/material.dart';

class TodayTask extends StatefulWidget {
  State<TodayTask> createState() => MainToday();
}

class MainToday extends State<TodayTask> {
  TextEditingController nameController = TextEditingController();
  String name = "";

  // this method used for the show the dialog message
  // this is a custom dialog created
  void showMyDialog() {
    // Create controllers for dialog input fields
    TextEditingController dialogNameController = TextEditingController();
    TextEditingController dialogPassController = TextEditingController();
    name = nameController.text;
    showDialog(
      // it is mandtory to write context for open the dailog box
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Login"),

          content: Column(
            mainAxisSize: MainAxisSize.min, // important to avoid overflow
            children: [
              Text("Hello $name"),
              SizedBox(height: 7),
              // Name Field
              TextField(
                controller: dialogNameController,
                decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 10),

              // Password Field
              TextField(
                controller: dialogPassController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),

          actions: [
            // Cancel Button
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),

            // Submit Button
            ElevatedButton(
              onPressed: () {
                String name = dialogNameController.text;
                String pass = dialogPassController.text;

                print("Name: $name");
                print("Password: $pass");

                Navigator.pop(context); // close dialog
              },
              child: Text("Submit"),
            ),
          ],
        );
      },
    );
  }

  // using this method we can dispose the object which is not needed after working the task
  // because working background task and can be leak the data that why last one dispose the object
  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("MediaQuery , Dispose and Dialog"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: height * 0.2,
              width: width * 0.82,
              color: Colors.orange,
              child: Center(
                child: Text(
                  "Responsive Page",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Enter your name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                showMyDialog();
              },
              child: Text("show dialog"),
            ),
          ],
        ),
      ),
    );
  }
}
