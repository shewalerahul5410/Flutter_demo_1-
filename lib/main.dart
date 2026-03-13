import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    final String profileUrl =
        "https://mir-s3-cdn-cf.behance.net/project_modules/1400/cb5096159005471.6396ac062cdb9.jpg";

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(
          title: Text("Politician Details"),
          backgroundColor: Colors.blue,
          leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back)),
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(profileUrl),
                ),

                SizedBox(height: 4),

                Text(
                  "Name: Sharad Pawar",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 3),

                Text("Party: Ncp"),

                SizedBox(height: 3),

                Text("State: Maharashtra"),

                SizedBox(height: 5),

                Row(
                  children: [
                    TextButton(
                      onPressed: () {},

                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),

                      child: Text("Follow"),
                    ),

                    SizedBox(width: 8),

                    Text("Followers: 1000"),
                  ],
                ),

                SizedBox(height: 10),

                SizedBox(
                  height: 320,
                  child: GridView.builder(
                    itemCount: 9,

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 7,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.6,
                    ),

                    itemBuilder: (context, index) {
                      return ImagesData();
                    },
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ImagesData extends StatefulWidget {
  const ImagesData({super.key});

  @override
  State<ImagesData> createState() => _ImagesDataState();
}

class _ImagesDataState extends State<ImagesData> {

  bool isStar = false;

  final String pawarImage =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9vUSltXsxP4CxaFQ5uIcBdXf63w4kQkOFRA&s";

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [

        Image.network(
          pawarImage,
          height: 100,
          width: 160,
          fit: BoxFit.cover,
        ),

        Positioned(
          right: 4,
          top: 3,
          child: IconButton(
            onPressed: () {
    // method help to on click data show as a dynamic
              setState(() {
                isStar =!isStar; //here updated the value and store updated using the setState
              });

            },

            icon: Icon(
              isStar ? Icons.star : Icons.star_border,
              color: isStar ? Colors.yellow : Colors.white,
              size: 30,
            ),
          ),
        )
      ],
    );
  }
}