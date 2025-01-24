import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';
import 'create_screen_2.dart';

class PreviewScreen extends StatefulWidget {
  final Map<String, dynamic> capsule;
  const PreviewScreen({super.key, required this.capsule});

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
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
            Container(
              height: 500,
              width: double.infinity,
              margin: const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(widget.capsule["title"]),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 20,
                    children: [
                      Image(
                        image: AssetImage("assets/${widget.capsule["capsule_image"]}"),
                      ),
                    ],
                  ),
                  Text("Myself"),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFEF7A0),
                    ),
                    child: Text(widget.capsule["message"]),
                  ),
                  //Row(
                  //  children: mediaChildren,
                  //),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back"),
            ),
          ],
        )
    );
  }
}