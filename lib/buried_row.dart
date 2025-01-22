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
    DateTime buriedDate = DateTime.parse(widget.capsule["buried_date"]);
    DateTime unlockDate = DateTime.parse(widget.capsule["date"]);

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
                  image: AssetImage("assets/rabbit.png"),
                ),
                Text("Myself"),
              ],
            ),
            Column(
                children: [
                  Text("Title: ${widget.capsule["title"]}"),
                  Text("Unlock: ${unlockDate.day}/${unlockDate.month}/${unlockDate.year}"),
                  Text("Buried: ${buriedDate.day}/${buriedDate.month}/${buriedDate.year}"),
                ]
            ),
          ],
        ),
      ),
    );
  }
}