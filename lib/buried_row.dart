import 'package:flutter/material.dart';
import 'package:timecapsule/names.dart';
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
        padding: const EdgeInsets.only(top: 20, left: 20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage("assets/${widget.capsule["capsule_image"]}"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: Text(getName(widget.capsule["recipient"]), style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )),
                ),
              ],
            ),
            SizedBox(width: 50),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Title:", style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                    Text("Unlock:", style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                    Text("Buried:", style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                  ]
              ),
            ),
            SizedBox(width: 5),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${widget.capsule["title"]}"),
                    Text("${unlockDate.day}/${unlockDate.month}/${unlockDate.year}"),
                    Text("${buriedDate.day}/${buriedDate.month}/${buriedDate.year}"),
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}