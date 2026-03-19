import 'package:flutter/material.dart';
import 'package:sample_project/api.dart';
import 'package:sample_project/datasave.dart';
import 'package:sample_project/form.dart';
import 'package:sample_project/home.dart'; // this is import file which is call from this page
import 'package:sample_project/keypage.dart';
import 'package:sample_project/register.dart';
import 'package:sample_project/showform.dart';
import 'package:sample_project/today18.dart';
import 'package:shared_preferences/shared_preferences.dart';

// start the execution from the main method
void main() {
  runApp(MyApp());
}

// in class store the all dart file path because we use whenever we need to calling
class MyRoutes {
  static String homeRoute = "/home";
  static String register = "/register";
  static String keypoint = "/key";
  static String datasave = "/data";
  static String apiwork = "api";
  static String today18 = "/task18";
  static String today19 = "/form";
  static String today219 = "show";
}

// main class that has the main page calling and this class call first one because i use inside the main method
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// build method is help to rendering the UI
class _MyAppState extends State<MyApp> {
  bool isDark = false;

  void toggleTheme() {
    setState(() {
      isDark = !isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(toggleTheme: toggleTheme),
      debugShowCheckedModeBanner: false,

      // cut the debug Symbol on the page
      // here we add the routing means dart file which is we created in the project and call when we need
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark,
        ),
      ),
      // initial routs means which is used to landing page
      initialRoute: "/",
      routes: {
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.register: (context) => RegisterPage(),
        MyRoutes.keypoint: (context) => KeyPage(),
        MyRoutes.datasave: (context) => DataPage(),
        MyRoutes.apiwork: (context) => ApiWork(),
        MyRoutes.today18: (context) => TodayTask(),
        MyRoutes.today19: (context) => FormTask(),
        "/show": (context) => ShowForm(),
      },
    );
  }
}

// first login page open on the web
// and this is a dynamic means doing the action performance
class LoginPage extends StatefulWidget {
  final VoidCallback toggleTheme;

  const LoginPage({super.key, required this.toggleTheme});

  // should be override first one this statement means
  @override
  State<LoginPage> createState() => _LoginPageState();
  // State<our className> createState() => newClassName();
}

class _LoginPageState extends State<LoginPage> {
  // variables
  bool isOpen = false;

  // it is used for the user input value and store in the variable like email controller
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // store the data in local storage using the emails
  String emails = "";

  @override
  void initState() {
    super.initState();
  }

  void saveData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    await pref.setString("myEmail", emailController.text);
    setState(() {
      emails = emailController.text;
    });
  }

  // this function used to handle the validation and data and then open the nest page
  void handle_Login() {
    // crete the two local variable and inside store the user input data and
    // then apply the condition on that
    String email = emailController.text;
    String password = passwordController.text;

    // here i apply the condition based on the email and password
    // using the if else condition for validation and security
    if (email.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please enter email")));
    } else if (!email.contains("@")) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Email must contain @")));
    } else if (!email.endsWith(".com")) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Email must end with .com")));
    } else if (password.length < 8) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("password must be 8 character")));
    } else if (!RegExp(
      r'^(?=.*[A-Z])(?=.*[!@#$%^&*(),.?":{}|<>])',
    ).hasMatch(password)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Password must contain one capital letter and one symbol",
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Login Successful",
            style: TextStyle(color: Colors.green),
          ),
        ),
      );
      saveData(); // save your email in the local storage
      // after all condition satisfied and true then it is gone to the next page
      // Navigator.pushNamed(context, "/home");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }

  // start the UI of the login page from this method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login page"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,

        actions: [
          IconButton(
            onPressed: widget.toggleTheme,
            icon: Icon(Icons.brightness_6),
          ),
        ],
      ),
      // in body first one use the padding because take space of the all page
      body: Padding(
        padding: EdgeInsets.all(16),
        // gives the side for the all page gap from the body
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),

              Container(
                height: 140,
                width: 100,
                child: Image.network("assets/images/man.png"),
              ),

              SizedBox(height: 40),

              // this is used for the user input for fill up the form
              TextField(
                // controller store the text from the user in the emailController variable
                controller: emailController,
                // this is used for the crete the design of the input
                decoration: InputDecoration(
                  labelText: "Mail",
                  hintText: "Enter your Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),

              SizedBox(height: 10),

              // same as the user input for the email
              TextField(
                // here i use the bool value for the password show or not onclick icon
                obscureText: !isOpen, // here use the bool value
                // controller use for the store the text from the user
                controller: passwordController,
                textAlign: TextAlign.start,
                // decoration used for the apply the style i the input box
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter your password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),

                  // here is use the button because on click show the password otherwise not show the pass
                  suffixIcon: IconButton(
                    onPressed: () {
                      // setState help to that is store the updated value and used dynamic
                      setState(() {
                        isOpen = !isOpen;
                      });
                    },
                    // here we use the icon symbol
                    icon: Icon(
                      isOpen ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              // here i use the button for login as a Elavated Button
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  minimumSize: Size(double.infinity, 50),
                ),
                onPressed: () {
                  handle_Login();
                },
                // inside use the text and UI for login button
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),

              //
              SizedBox(height: 20),
              // this is all downstairs data for the sign up and understand
              Text(
                "Already Have Account?",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 8),

              // for on click show the another page then use the Gesture Button and inside
              // apply the condition on click
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/register");
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
