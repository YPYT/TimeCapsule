import 'package:flutter/material.dart';
import 'create_screen_3.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';
import 'package:image_picker/image_picker.dart';

class BuriedCapsuleScreen extends StatefulWidget {
  const BuriedCapsuleScreen({super.key});

  @override
  State<BuriedCapsuleScreen> createState() => _BuriedCapsuleScreenState();
}

class _BuriedCapsuleScreenState extends State<BuriedCapsuleScreen> {

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            Text("Buried your time capsule!"),
            Text("Buried on X"),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    Text("For"),
                    Text("PLACEHOLDER")
                  ]
                ),
                Image(
                  image: AssetImage("assets/rabbit.png"),
                ),
              ],
            ),
            Container(
              height: 250,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFD9D9D9), width: 1.5),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Text("LOCATION"),
            Text("REMAINING TIME"),
            Text("UNLOCK DATE"),
          ],
        )
    );
  }

  Future<void> _onBuryPressed() async {
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
  }
}