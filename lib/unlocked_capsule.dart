import 'package:flutter/material.dart';

class UnlockedCapsuleScreen extends StatefulWidget {
  final dynamic capsule;
  const UnlockedCapsuleScreen({super.key, required this.capsule});

  @override
  State<UnlockedCapsuleScreen> createState() => _UnlockedCapsuleScreenState();
}

class _UnlockedCapsuleScreenState extends State<UnlockedCapsuleScreen> {
  @override
  Widget build(BuildContext context) {
    //List<Image> mediaChildren = [];
    //for (var mediaPath in widget.capsule["media"]) {
    //  mediaChildren.add(Image.asset(mediaPath, height: 50, width: 50));
    //}

    return Center(
      child: Column(
        children: [
          Text('Unlocked!'),
          Text(widget.capsule["message"]),
          //GridView(
          //  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          //  children: mediaChildren,
          //),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Go Back"))
        ],
      )
    );
  }
}