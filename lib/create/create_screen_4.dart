import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';
import 'package:image_picker/image_picker.dart';
import 'buried_capsule.dart';
import 'dart:convert';
import '../names.dart';

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
              spacing: 2,
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed:  () {},
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(15),
                    iconSize: 30,
                    backgroundColor: Color(0xFFF7D38E),
                  ),
                  child: Icon(Icons.window, color: Colors.white),
                ),
                Icon(Icons.arrow_right_alt, size: 30, color: Color(0xFF797979)),
                ElevatedButton(
                  onPressed:  () {},
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(15),
                    iconSize: 30,
                    backgroundColor: Color(0xFFF7D38E),
                  ),
                  child: Icon(Icons.location_on, color: Colors.white),
                ),
                Icon(Icons.arrow_right_alt, size: 30, color: Color(0xFF797979)),
                ElevatedButton(
                  onPressed:  () {},
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(15),
                    iconSize: 30,
                    backgroundColor: Color(0xFFF7D38E),
                  ),
                  child: Icon(Icons.outgoing_mail, color: Colors.white),
                ),
                Icon(Icons.arrow_right_alt, size: 30, color: Color(0xFF797979)),
                ElevatedButton(
                  onPressed:  () {},
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(15),
                    iconSize: 30,
                    backgroundColor: Color(0xFFBFA36F),
                  ),
                  child: Icon(Icons.mobile_friendly, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 50),
            Container(
              height: 550,
              width: double.infinity,
              margin: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFD9D9D9), width: 1.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Time Capsule",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 70,
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 15),
                    padding: EdgeInsets.only(left: 20),
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
                            icon: const Icon(Icons.find_in_page, size: 30, color: Color(0xFF797979))
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Location",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 70,
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 15),
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFFEF7A0)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 260,
                          child: Text(
                              widget.capsule["address"],
                              softWrap: true,
                              overflow: TextOverflow.fade,
                              maxLines: 2
                          )
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.map, size: 30, color: Color(0xFF797979))
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Who",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 70,
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 15),
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFFEF7A0)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: 20,
                          children: [
                            Image(
                              image: AssetImage("assets/friend${widget.capsule["recipient"]}.png"),
                              width: 50,
                              height: 50,
                            ),
                            Text(getName(widget.capsule["recipient"])),
                          ]
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.group_add, size: 30, color: Color(0xFF797979))
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Unlock Date",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 70,
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 25),
                    padding: EdgeInsets.only(left: 20),
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
                            icon: const Icon(Icons.calendar_today, size: 30, color: Color(0xFF797979))
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _onBuryPressed(context, widget.capsule);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF7D38E),
                      minimumSize: const Size(150, 40),
                    ),
                    child: Text("Bury!"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFD9D9D9),
                  ),
                  child: Text("Back"),
                ),
              ),
            ),
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
    for (XFile mediaFile in widget.capsule["tmp_media"]) {
      final String savedFilePath = "$docDir/${mediaFile.name}";
      await mediaFile.saveTo(savedFilePath);
      mediaPaths.add(savedFilePath);
      log(savedFilePath);
    }
    widget.capsule["media"] = mediaPaths;
    widget.capsule.remove("tmp_media");

    // Write back to storage
    final finalCapsulesString = jsonEncode(capsules);
    log('final capsules: $finalCapsulesString');
    await prefs.setString('capsules', finalCapsulesString);

    Navigator.push(context, MaterialPageRoute(builder: (context) => BuriedCapsuleScreen(capsule: capsule,)));
  }
}