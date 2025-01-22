import 'package:flutter/material.dart';
import 'unlocked_capsule.dart';

class BuriedRow extends StatefulWidget {
  final dynamic capsule;
  final int index;

  const BuriedRow({super.key, required this.capsule, required this.index});

  @override
  State<BuriedRow> createState() => _BuriedRowState();
}

class _BuriedRowState extends State<BuriedRow> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => UnlockedCapsuleScreen(capsule: widget.capsule)));
      },
      child: Container(
        height: 130,
        width: double.infinity,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 0),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
            children: [
              Text("Title: ${widget.capsule["title"]}, Message: ${widget.capsule["message"]}, Date: ${widget.capsule["date"]}, Address: ${widget.capsule["address"]}"),
            ]
        ),
      ),
    );
  }
}