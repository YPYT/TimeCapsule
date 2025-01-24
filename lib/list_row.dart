import 'package:flutter/material.dart';
import 'package:time_machine/time_machine.dart';
import 'package:intl/intl.dart';
import 'names.dart';

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
    DateTime buriedDate = DateTime.parse(widget.capsule["buried_date"]);

    NumberFormat formatter = NumberFormat("00");

    return Container(
      height: 130,
      width: double.infinity,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 0),
      padding: const EdgeInsets.only(top: 20, left: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
          children: [
            Row(
              spacing: 30,
              children: [
                Image(
                  image: AssetImage("assets/${widget.capsule["capsule_image"]}"),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 30,
                  children: [
                    Column(
                      children: [
                        Text(formatter.format(dateDiff.years), style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        )),
                        Text("Years")
                      ],
                    ),
                    Column(
                      children: [
                        Text(formatter.format(dateDiff.months), style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        )),
                        Text("Months")
                      ],
                    ),
                    Column(
                      children: [
                        Text(formatter.format(dateDiff.days), style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        )),
                        Text("Days")
                      ],
                    )
                  ],
                ),
              ],
            ),
            Row(
              spacing: 50,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: Text(getName(widget.capsule["sender"]), style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )),
                ),
                Text("Buried: ${buriedDate.day}/${buriedDate.month}/${buriedDate.year}"),
              ],
            ),
          ]
      ),
    );
  }
}