import 'package:flutter/material.dart';
import 'package:time_machine/time_machine.dart';

class ListRow extends StatefulWidget {
  final dynamic capsule;
  final int index;

  const ListRow({super.key, required this.capsule, required this.index});

  @override
  State<ListRow> createState() => _ListRowState();
}

class _ListRowState extends State<ListRow> {
  @override
  Widget build(BuildContext context) {
    LocalDate unlockDate = LocalDate.dateTime(DateTime.parse(widget.capsule["date"]));
    Period dateDiff = unlockDate.periodSince(LocalDate.today());
    String dateDiffString = "years: ${dateDiff.years}; months: ${dateDiff.months}; days: ${dateDiff.days}";
    DateTime buriedDate = DateTime.parse(widget.capsule["buried_date"]);

    return Container(
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
            Row(
              children: [
                Image(
                  image: AssetImage("assets/${widget.capsule["capsule_image"]}"),
                ),
                Text(dateDiffString),
              ],
            ),
            Row(
              spacing: 20,
              children: [
                Text("Myself"),
                Text("Buried: ${buriedDate.day}/${buriedDate.month}/${buriedDate.year}"),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    backgroundColor: Colors.yellow,
                    foregroundColor: Colors.red,
                  ),
                  child: Icon(Icons.place, color: Colors.black),
                ),
              ],
            ),
          ]
      ),
    );
  }
}