import 'package:flutter/material.dart';
import 'package:time_machine/time_machine.dart';
import 'package:intl/intl.dart';

class BuriedCapsuleScreen extends StatefulWidget {
  final Map<String, dynamic> capsule;
  const BuriedCapsuleScreen({super.key, required this.capsule});

  @override
  State<BuriedCapsuleScreen> createState() => _BuriedCapsuleScreenState();
}

class _BuriedCapsuleScreenState extends State<BuriedCapsuleScreen> {

  @override
  Widget build(BuildContext context) {
    DateTime unlockDate = DateTime.parse(widget.capsule["date"]);
    LocalDate localUnlockDate = LocalDate.dateTime(unlockDate);
    DateTime buriedDate = DateTime.parse(widget.capsule["buried_date"]);
    Period dateDiff = localUnlockDate.periodSince(LocalDate.today());

    NumberFormat formatter = new NumberFormat("00");

    return Center(
        child: Column(
          children: [
            Text("Buried your time capsule!", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            )),
            SizedBox(height: 10),
            Text(
              "Buried on ${buriedDate.day}/${buriedDate.month}/${buriedDate.year}",
              style: TextStyle(
                fontSize: 20,
              )
            ),
            SizedBox(height: 20),
            Row(
              spacing: 30,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    Text("For", style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    )),
                    Image(
                      image: AssetImage("assets/friend${widget.capsule["recipient"]}.png"),
                      width: 60,
                      height: 60,
                    ),
                  ]
                ),
                Image(
                  image: AssetImage("assets/${widget.capsule["capsule_image"]}"),
                ),
              ],
            ),
            Image(
              image: AssetImage("assets/map_big.png"),
              height: 250,
              width: 200,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: Text(widget.capsule["address"]),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 20,
              children: [
                Column(
                  children: [
                    Text(formatter.format(dateDiff.years), style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                    )),
                    Text("Years")
                  ],
                ),
                Column(
                  children: [
                    Text(formatter.format(dateDiff.months), style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                    )),
                    Text("Months")
                  ],
                ),
                Column(
                  children: [
                    Text(formatter.format(dateDiff.days), style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                    )),
                    Text("Days")
                  ],
                )
              ],
            ),
            SizedBox(height: 40),
            Text("Unlock: ${unlockDate.day}/${unlockDate.month}/${unlockDate.year}",
              style: TextStyle(
                fontSize: 20,
              )
            ),
          ],
        )
    );
  }
}