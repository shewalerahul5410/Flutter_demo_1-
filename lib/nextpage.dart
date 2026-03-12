import 'package:flutter/material.dart';

class SimilarCard extends StatelessWidget {
  const SimilarCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(6),
      child: Container(
        height: 190,
        width: 260,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),

              child: Image.network(
                "assets/images/img.png",
                height: 90,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "Morning Sadhana Session",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  // Location Row
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 14, color: Colors.grey),
                      SizedBox(width: 6),

                      Expanded(
                        child: Text(
                          "Ananddham, Ahilyanagar",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 8),

                  // Time + Date Row
                  Row(
                    children: [

                      Icon(Icons.access_time, size: 14, color: Colors.grey),
                      SizedBox(width: 5),

                      Text(
                        "6:00 AM - 7:30 AM",
                        style: TextStyle(fontSize: 12),
                      ),

                      SizedBox(width: 12),

                      Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                      SizedBox(width: 5),

                      Text(
                        "March 7, 2026",
                        style: TextStyle(fontSize: 12),
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

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Event Details", style: TextStyle(fontWeight: FontWeight.bold),),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Image.network("assets/images/img_1.png"),
                  ],
                ),
              ),

              SizedBox(height: 10),

              Row(
                children: [

                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.calendar_today,
                      size: 18,
                      color: Colors.orange,
                    ),
                  ),

                  SizedBox(width: 10),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "March 10, 2026",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )
                ],
              ),

              SizedBox(height: 10),

             // use the row and take a gap and write the another function using the style
              Row(
                children: [

                  // if want to small circle and inside the icon them use the container and box decoration
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.access_time, size: 18, color: Colors.orange,
                    ),
                  ),

                  SizedBox(width: 10),

                  Column(
                    // start the design from the left side means accurate first position
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Time",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "3:00 PM - 4:30 PM",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )
                ],
              ),

              SizedBox(height: 10),

              Row(
                children: [

                 Container(
                   padding: EdgeInsets.all(10),
                   decoration: BoxDecoration(
                     color: Colors.orange.shade100,
                     shape: BoxShape.circle,
                   ),
                   child:  Icon(Icons.location_on, size: 22, color: Colors.orange),
                 ),

                  SizedBox(width: 10),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Location",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "Ananddham, Ahilyanagar",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )
                ],
              ),
             SizedBox(height: 5,),
        // is used to horizantal line on the page and add the color and thickness
              Divider(
                color: Colors.black,
                thickness: 0.6,
              ),

              SizedBox(height: 14),

              Text(
                "About This Event",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 10),

              Text(
                  "Morning Sadhana is a dedicated, daily spiritual discipline practiced in the early"
                      " hours—often during Brahma Muhurta (pre-dawn, roughly 4–6 AM)—designed to cultivate"
                      " self-awareness, inner peace, and spiritual growth. By waking before the sun to engage"
                      " in practices such as meditation, breathwork (pranayama), yoga asanas, and mantra "
                      "chanting, practitioners aim to connect with their true self and set a conscious,"
                      " grounded tone for the entire day. This sacred routine acts as a tool for cleansing"
                      " the mind of daily stressors, fostering self-discipline, and fostering a deep, intimate"
                      " relationship with the Divine or one's own higher nature.", style: TextStyle(fontSize: 12),
              ),

              SizedBox(height: 20),

              Text(
                "Similar Events",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 10),

              // list view builder used for the dynamic data access and show the UI multiple times
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index)
                  {
                    return SimilarCard();
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}