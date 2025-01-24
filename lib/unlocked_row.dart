import 'package:flutter/material.dart';
import 'unlocked_capsule.dart';

class UnlockedRow extends StatefulWidget {
  final dynamic capsule;
  final int index;

  const UnlockedRow({super.key, required this.capsule, required this.index});

  @override
  State<UnlockedRow> createState() => _UnlockedRowState();
}

class _UnlockedRowState extends State<UnlockedRow> {
  @override
  Widget build(BuildContext context) {
    DateTime buriedDate = DateTime.parse(widget.capsule["buried_date"]);
    DateTime unlockedDate = DateTime.parse(widget.capsule["unlocked_date"]);

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
        child: Row(
          spacing: 50,
          children: [
            Column(
              children: [
                Image(
                  image: AssetImage("assets/${widget.capsule["capsule_image"]}"),
                ),
                Text("Myself"),
              ],
            ),
            Column(
                children: [
                  Text("Title: ${widget.capsule["title"]}"),
                  Text("Unlocked: ${unlockedDate.day}/${unlockedDate.month}/${unlockedDate.year}"),
                  Text("Buried: ${buriedDate.day}/${buriedDate.month}/${buriedDate.year}"),
                ]
            ),
          ],
        ),
      ),
    );
  }
}