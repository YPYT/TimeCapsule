import 'package:flutter/material.dart';
import 'create_screen_3.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';
import 'package:image_picker/image_picker.dart';
import 'buried_capsule.dart';
import 'dart:convert';

class CreateScreenFour extends StatefulWidget {
  final Map<String, dynamic> capsule;
  const CreateScreenFour({super.key, required this.capsule});

  @override
  State<CreateScreenFour> createState() => _CreateScreenFourState();
}

class _CreateScreenFourState extends State<CreateScreenFour> {

  @override
  Widget build(BuildContext context) {
    DateTime unlockedDate = DateTime.parse(widget.capsule["date"]);

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
                        Text(widget.capsule["title"]),
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
                        Text(widget.capsule["address"]),
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
                        Text("Emily"),
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
                        Text("${unlockedDate.day}/${unlockedDate.month}/${unlockedDate.year}"),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.calendar_today, size: 40)
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _onBuryPressed(context, widget.capsule);
                    },
                    child: Text("Bury!"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        )
    );
  }

  Future<void> _onBuryPressed(context, capsule) async {
    final prefs = await SharedPreferences.getInstance();

    widget.capsule["buried_date"] = DateTime.now().toString();
    widget.capsule["unlocked"] = 0;

    // Get capsules list
    final capsulesString = prefs.getString('capsules') ?? "[]";
    final capsules = jsonDecode(capsulesString) as List<dynamic>;

    capsules.add(widget.capsule);

    // Save media files
    List<String> mediaPaths = [];
    final String docDir = (await getApplicationDocumentsDirectory()).path;
    for (XFile mediaFile in widget.capsule["media"]) {
      final String savedFilePath = "$docDir/${mediaFile.name}";
      await mediaFile.saveTo(savedFilePath);
      mediaPaths.add(savedFilePath);
    }

    // Write back to storage
    final finalCapsulesString = jsonEncode(capsules);
    log('final capsules: $finalCapsulesString');
    await prefs.setString('capsules', finalCapsulesString);

    Navigator.push(context, MaterialPageRoute(builder: (context) => BuriedCapsuleScreen(capsule: capsule,)));
  }
}