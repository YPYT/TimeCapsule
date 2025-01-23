import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';
import 'create_screen_2.dart';
import 'preview.dart';

class CreateScreenOne extends StatefulWidget {
  const CreateScreenOne({super.key});

  @override
  State<CreateScreenOne> createState() => _CreateScreenOneState();
}

class _CreateScreenOneState extends State<CreateScreenOne> {
  String _title = "";
  String _message = "";
  String _address = "";
  int _recipient = 0;
  List<XFile> _media = [];
  DateTime? _selectedDate;
  final TextEditingController _dateController = TextEditingController();

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
            SizedBox(height: 15),
            Container(
              height: 150,
              width: double.infinity,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 0),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      colors: [
                        Color(0xFFFFAD49),
                        Color(0xffffc890),
                      ]
                  )
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.image),
                    Text("Select photo/video")
                  ],
                ),
              ),
            ),
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white),
            ),
            Row(
              spacing: 22,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 150,
                  width: 170,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 20, right: 0, top: 20, bottom: 0),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFFFAD49),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.redeem),
                        Text("Select your capsule")
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  width: 170,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 0, right: 20, top: 20, bottom: 0),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffffc890),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.mail),
                        Text("Write message"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 100),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewScreen()));
                        },
                        icon: const Icon(Icons.find_in_page, size: 50)
                    ),
                    Text("Preview")
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CreateScreenTwo()));
                    },
                    child: Text("Next"),
                  ),
                )
              ],
            ),

          ],
        )
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2200)
    );

    if (picked != null) {
      _selectedDate = picked;
      setState(() {
        _dateController.text = picked.toString().split(" ")[0];
      });
    }
  }

  Future<void> _onBuryPressed() async {
    final prefs = await SharedPreferences.getInstance();

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
    }

    // Insert new capsule into list
    final capsuleData = {
      "title": _title,
      "message": _message,
      "date": _selectedDate.toString(),
      "address": _address,
      "recipient": _recipient,
      "media": mediaPaths,
      "sender": 0,
      "unlocked": 0,
      "buried_date": DateTime.now().toString(),
    };
    capsules.add(capsuleData);

    // Write back to storage
    final finalCapsulesString = jsonEncode(capsules);
    log('final capsules: $finalCapsulesString');
    await prefs.setString('capsules', finalCapsulesString);
  }

  Future<void> _onPickImagePressed() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> medias = await picker.pickMultipleMedia();
    for (XFile file in medias) {
      _media.add(file);
    }
  }

  // TEMP
  Future<void> _onDeleteAllDataPressed() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('capsules');
  }
}