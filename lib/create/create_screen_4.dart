import 'package:flutter/material.dart';
import 'create_screen_3.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';
import 'package:image_picker/image_picker.dart';
import 'buried_capsule.dart';

class CreateScreenFour extends StatefulWidget {
  const CreateScreenFour({super.key});

  @override
  State<CreateScreenFour> createState() => _CreateScreenFourState();
}

class _CreateScreenFourState extends State<CreateScreenFour> {

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            Row(
              spacing: 5,
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed:  () {},
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(15),
                    iconSize: 35,
                  ),
                  child: Icon(Icons.window, color: Colors.black),
                ),
                Icon(Icons.arrow_right_alt, size: 30),
                ElevatedButton(
                  onPressed:  () {},
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(15),
                    iconSize: 35,
                  ),
                  child: Icon(Icons.location_on, color: Colors.black),
                ),
                Icon(Icons.arrow_right_alt, size: 30),
                ElevatedButton(
                  onPressed:  () {},
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(15),
                    iconSize: 35,
                  ),
                  child: Icon(Icons.outgoing_mail, color: Colors.black),
                ),
                Icon(Icons.arrow_right_alt, size: 30),
                ElevatedButton(
                  onPressed:  () {},
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(15),
                    iconSize: 35,
                  ),
                  child: Icon(Icons.mobile_friendly, color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 50),
            Container(
              height: 500,
              width: double.infinity,
              margin: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFD9D9D9), width: 1.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text("Time Capsule"),
                  Container(
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFFEF7A0)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("For Emily in 3 years"),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.find_in_page, size: 40)
                        ),
                      ],
                    ),
                  ),
                  Text("Location"),
                  Container(
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFFEF7A0)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("For Emily in 3 years"),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.map, size: 40)
                        ),
                      ],
                    ),
                  ),
                  Text("Who"),
                  Container(
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFFEF7A0)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("For Emily in 3 years"),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.group_add, size: 40)
                        ),
                      ],
                    ),
                  ),
                  Text("When to unlock"),
                  Container(
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFFEF7A0)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("For Emily in 3 years"),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.calendar_today, size: 40)
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _onBuryPressed(context);
                    },
                    child: Text("Bury!"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
                spacing: 170,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Back"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CreateScreenThree()));
                    },
                    child: Text("Next"),
                  ),
                ]
            )
          ],
        )
    );
  }

  Future<void> _onBuryPressed(context) async {
    final prefs = await SharedPreferences.getInstance();
/*
    // Get capsules list
    final capsulesString = prefs.getString('capsules') ?? "[]";
    final capsules = jsonDecode(capsulesString) as List<dynamic>;

    if (_title.isEmpty || _message.isEmpty || _address.isEmpty || _selectedDate == null) {
      return;
    }

    // Save media files
    List<String> mediaPaths = [];
    final String docDir = (await getApplicationDocumentsDirectory()).path;
    for (XFile mediaFile in _media) {
      final String savedFilePath = "$docDir/${mediaFile.name}";
      await mediaFile.saveTo(savedFilePath);
      mediaPaths.add(savedFilePath);
    }*/
    Navigator.push(context, MaterialPageRoute(builder: (context) => BuriedCapsuleScreen()));
  }
}