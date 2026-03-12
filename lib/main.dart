import 'package:flutter/material.dart';
import 'nextpage.dart'; // import to class here which is used to another page

void main()
{
  runApp(MyApp()); // start to run the application from here
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: FirstPage(), // rendering the first page on the screen
    );
  }
}

class FirstPage extends StatelessWidget
{
  const FirstPage({super.key});

  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        // when we want to multiple text and rows then use the column and inside take a children
        title: Column(
          // using cross is help to start the writing from the start line
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Upcoming Events",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 3,), // take the space of the two things as a height and width
            Text("आगामी कार्यक्रम",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),

          ],
        ),
      ),

      // strat the body UI from the center
      body: Center(

        // inside center i use the column and build the UI
        child: Column(
          children: [

            Expanded(
              // List view builder help to manage the dynamic data and access elements
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return EventCard();
                },
              ),
            ),
          ],
        ),
      ),
      // using this one we add the bottom navbar and apply the style.
       bottomNavigationBar: BottomNavigationBar(
         currentIndex: 0,

          type: BottomNavigationBarType.fixed,

        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.event),label: "Event"),
          BottomNavigationBarItem(icon: Icon(Icons.library_add), label: "Library"),
          BottomNavigationBarItem(icon: Icon(Icons.update), label: "Updates"),
        ],
      ),
    );
  }
}

// so using the separated class we can call the multiples times in the home page. that is main concept
class EventCard extends StatelessWidget
{
  const EventCard({super.key});

  Widget build(BuildContext context)
  {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NextPage()),
        );
      },

      child: Container(
        margin: EdgeInsets.all(12), // space between the outside of the container
        // design of the box using the decoration and inside use the box decoration and input decoration
        decoration: BoxDecoration(
          color: Colors.white, // back ground colour use here
          borderRadius: BorderRadius.circular(14), // crete the circle style using border radius

          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 3),
            )
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // this is take for the full width and change the only corner using the top right and left
            // border radius help to that moment
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
              ),

              child: Image.network(
                "assets/images/img.png",
                height: 210,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(18),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "Morning Sadhana Session",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  Row(
                    children: [
                      Icon(Icons.location_on, size: 20, color: Colors.grey),
                      SizedBox(width: 6),

                      Text(
                        "Ananddham, Ahilyanagar",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 8),

                  Row(
                    children: [
                      Icon(Icons.access_time, size: 18, color: Colors.grey),
                      SizedBox(width: 6),

                      Text(
                        "6:00 AM - 7:30 AM",
                        style: TextStyle(fontSize: 14),
                      ),

                      SizedBox(width: 20),

                      Icon(Icons.calendar_today, size: 18, color: Colors.grey),
                      SizedBox(width: 6),

                      Text(
                        "March 7, 2026",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}