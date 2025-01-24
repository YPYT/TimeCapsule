import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';
import 'create_screen_2.dart';
import 'preview.dart';

class MessageInputScreen extends StatefulWidget {
  final String title;
  final String message;
  const MessageInputScreen({super.key, required this.title, required this.message});

  @override
  State<MessageInputScreen> createState() => _MessageInputScreenState();
}

class _MessageInputScreenState extends State<MessageInputScreen> {
  String title = "";
  String message = "";

  @override
  Widget build(BuildContext context) {
    title = widget.title;
    message = widget.message;

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
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
              child: Column(
                children: [
                  Text("Title"),
                  TextField(
                    controller: TextEditingController()..text = widget.title,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),
                    onChanged: (newVal) {
                      title = newVal;
                    },
                  ),
                  SizedBox(height: 15),
                  Text("Message"),
                  TextField(
                    controller: TextEditingController()..text = widget.message,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),
                    onChanged: (newVal) {
                      message = newVal;
                    },
                    maxLines: 15,
                    minLines: 15,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, [title, message]);
              },
              child: Text("Save"),
            ),
          ],
        )
    );
  }
}