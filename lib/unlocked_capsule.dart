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
    return Center(
      child: Column(
        children: [
          Text('Unlocked!'),
          Text(widget.capsule["message"]),
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