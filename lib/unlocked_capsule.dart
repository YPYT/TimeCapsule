import 'package:flutter/material.dart';
import 'dart:io';

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
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Go Back")
        ),
        Container(
          height: 650,
          width: double.infinity,
          margin: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
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
                    image: AssetImage("assets/rabbit.png"),
                  ),
                  Image(
                    image: AssetImage("assets/smiley.png"),
                  ),
                ],
              ),
              Text(widget.capsule["address"]),
              Text("Myself"),
              Container(
                decoration: BoxDecoration(
                  color: Colors.yellow,
                ),
                child: Text(widget.capsule["message"]),
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