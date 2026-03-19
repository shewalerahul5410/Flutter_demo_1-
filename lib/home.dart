import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  State<HomePage> createState() => MyHomePage();
}

class MyHomePage extends State<HomePage> {
  String myEmails = "";

  @override
  void initState() {
    super.initState();
    uploadData();
  }

  void uploadData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? email2 = pref.getString("myEmail");

    setState(() {
      myEmails = email2 ?? "not found";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HomePage"), backgroundColor: Colors.orange),

      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage("assets/images/man.png"),
                  ),
                  SizedBox(height: 2),
                  Text("Rahul Anna"),
                  SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Email: "),
                      Text("rahul.accucia@gmail.com"),
                    ],
                  ),
                ],
              ),
            ),

            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pushNamed(context, "/home");
              },
            ),

            Divider(thickness: 2),

            ExpansionTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              children: [
                ListTile(title: Text("Account")),
                ListTile(title: Text("Privacy")),
              ],
            ),

            ListTile(
              leading: Icon(Icons.person),
              title: Text("Persons"),
              onTap: () {},
            ),

            ListTile(
              leading: Icon(Icons.email),
              title: Text("Emails"),
              onTap: () {},
            ),

            ListTile(
              leading: Icon(Icons.logout),
              title: Text("LogOut"),
              onTap: () {
                Navigator.pushNamed(context, "/");
              },
            ),
            ListTile(
              leading: Icon(Icons.skip_next),
              title: Text("Key Task"),
              onTap: () {
                Navigator.pushNamed(context, "/key");
              },
            ),
            ListTile(
              leading: Icon(Icons.data_array),
              title: Text("check save data"),
              onTap: () {
                Navigator.pushNamed(context, "/data");
              },
            ),
            ListTile(
              leading: Icon(Icons.api),
              title: Text("Company DATA"),
              onTap: () {
                Navigator.pushNamed(context, "api");
              },
            ),
            ListTile(
              leading: Icon(Icons.task),
              title: Text("Today18"),
              onTap: () {
                Navigator.pushNamed(context, "/task18");
              },
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text("Add Event"),
              onTap: () {
                Navigator.pushNamed(context, "/form");
              },
            ),
          ],
        ),
      ),

      body: Container(
        decoration: BoxDecoration(
          // this is used for the all page gives the color in different part
          gradient: LinearGradient(
            colors: [Colors.blue.shade400, Colors.purple.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                child: Icon(Icons.business, size: 50, color: Colors.blue),
              ),
              SizedBox(height: 6),
              Text(
                "Welcome to Accucia",
                style: TextStyle(fontSize: 22, color: Colors.orange),
              ),
              SizedBox(height: 5),
              Text(
                "$myEmails",
                style: TextStyle(fontSize: 16, color: Colors.greenAccent),
              ),
              Divider(),

              /// 🔹 Title
              Text(
                "Accucia Software",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 6),

              /// 🔹 Subtitle
              Text(
                "Building Android & Web Applications",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),

              SizedBox(height: 10),

              // Card Section
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 8,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        "Our Services",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(),

                      ListTile(
                        leading: Icon(Icons.phone_android, color: Colors.blue),
                        title: Text("Android Development"),
                      ),

                      ListTile(
                        leading: Icon(Icons.web, color: Colors.green),
                        title: Text("Web Development"),
                      ),

                      ListTile(
                        leading: Icon(Icons.cloud, color: Colors.orange),
                        title: Text("Cloud Solutions"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,

        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, "/");
          }

          if (index == 1) {
            Navigator.pushNamed(context, "/register");
          }
        },

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
