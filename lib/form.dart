import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormTask extends StatefulWidget {
  @override
  State<FormTask> createState() => MyFormTask();
}

class MyFormTask extends State<FormTask> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController desController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  XFile? imageFile;

  // this method used for the selected data and store inside the dateController and show the UI.
  pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );
    if (pickedDate != null) {
      dateController.text = DateFormat('dd-MM-yyyy').format(pickedDate);
      setState(() {});
    }
  }

  pickImg() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (picked != null) {
      imageFile = picked;
      setState(() {});
    }
  }

  saveData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> eventList = pref.getStringList("events") ?? [];

    Map<String, dynamic> evenDate = {
      "name": nameController.text,
      "desc": desController.text,
      "date": dateController.text,
      "image": imageFile!.path,
    };

    String jsonData = jsonEncode(evenDate);
    eventList.add(jsonData);
    await pref.setStringList("events", eventList);
  }

  @override
  void dispose() {
    nameController.dispose();
    desController.dispose();
    dateController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Event Details"),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 10),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "Enter Event name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) return "Enter event name";
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  maxLines: 3,
                  controller: desController,

                  decoration: InputDecoration(
                    labelText: "Enter Event Description",
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) return "please enter discription";
                    return null;
                  },
                ),

                SizedBox(height: 20),

                TextFormField(
                  controller: dateController,
                  readOnly: true,
                  onTap: pickDate,
                  decoration: InputDecoration(
                    labelText: "Enter Event Date",
                    suffixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) return "please select date";
                    return null;
                  },
                ),
                SizedBox(height: 20),

                ElevatedButton.icon(
                  onPressed: pickImg,
                  icon: Icon(Icons.image),
                  label: Text("Select Image"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                ),
                SizedBox(height: 10),
                imageFile != null
                    ? Image.network(imageFile!.path, height: 140)
                    : Text("no image selected"),
                SizedBox(height: 18),

                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate() &&
                        imageFile != null) {
                      await saveData();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Data Save Successfully")),
                      );

                      Navigator.pushNamed(context, "/show");
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Fill all filed and image")),
                      );
                    }
                  },
                  child: Text("Submit"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(40, 50),
                    backgroundColor: Colors.orange,
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
