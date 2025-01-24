import 'package:flutter/material.dart';
import 'dart:io';
import 'names.dart';

class UnlockedCapsuleScreen extends StatefulWidget {
  final dynamic capsule;
  const UnlockedCapsuleScreen({super.key, required this.capsule});

  @override
  State<UnlockedCapsuleScreen> createState() => _UnlockedCapsuleScreenState();
}

class _UnlockedCapsuleScreenState extends State<UnlockedCapsuleScreen> {
  @override
  Widget build(BuildContext context) {
    List<Image> mediaChildren = [];
    for (String mediaPath in widget.capsule["media"]) {
      if (mediaPath.endsWith(".jpg")) {
        mediaChildren.add(Image(
          image: FileImage(File(mediaPath)),
          width: 80,
          height: 80,
        ));
      }
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Align(
            alignment: Alignment.topLeft,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios, size: 25)
            ),
          ),
        ),
        Container(
          height: 650,
          width: double.infinity,
          margin: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 0),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Text(
                widget.capsule["title"],
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 20,
                children: [
                  Image(
                    image: AssetImage("assets/${widget.capsule["capsule_image"]}"),
                  ),
                  Image(
                    image: AssetImage("assets/map.png"),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text(widget.capsule["address"]),
              SizedBox(height: 25),
              Text(
                getName(widget.capsule["sender"]),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xFFFEF7A0),
                ),
                child: Text(
                  widget.capsule["message"],
                  style: TextStyle(
                      fontSize: 13,
                  ),
                ),
              ),
              Row(
               children: mediaChildren,
              ),
            ],
          ),
        ),
      ],
    );
  }
}