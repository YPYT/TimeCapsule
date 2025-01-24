import 'package:flutter/material.dart';
import 'package:time_machine/time_machine.dart';
import 'create_screen_3.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';
import 'package:image_picker/image_picker.dart';

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
    String dateDiffString = "years: ${dateDiff.years}; months: ${dateDiff.months}; days: ${dateDiff.days}";

    return Center(
        child: Column(
          children: [
            Text("Buried your time capsule!"),
            Text("Buried on ${buriedDate.day}/${buriedDate.month}/${buriedDate.year}"),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    Text("For"),
                    Text("Emily")
                  ]
                ),
                Image(
                  image: AssetImage("assets/${widget.capsule["capsule_image"]}"),
                ),
              ],
            ),
            Container(
              height: 250,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFD9D9D9), width: 1.5),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Text(widget.capsule["address"]),
            Text(dateDiffString),
            Text("Unlock: ${unlockDate.day}/${unlockDate.month}/${unlockDate.year}"),
          ],
        )
    );
  }
}