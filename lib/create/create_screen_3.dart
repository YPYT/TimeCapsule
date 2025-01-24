import 'package:flutter/material.dart';
import 'create_screen_4.dart';

class CreateScreenThree extends StatefulWidget {
  final Map<String, dynamic> capsule;
  const CreateScreenThree({super.key, required this.capsule});

  @override
  State<CreateScreenThree> createState() => _CreateScreenThreeState();
}

class _CreateScreenThreeState extends State<CreateScreenThree> {
  int _tabIndex = 0;
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget personPicker = SizedBox(height: 30);
    if (_tabIndex == 1) {
      List<Widget> personPickerTickWidgets = [
        SizedBox(),
        SizedBox(),
        SizedBox(),
        SizedBox(),
        SizedBox(),
        SizedBox(),
        SizedBox(),
        SizedBox(),
      ];
      if (widget.capsule["recipient"] != 0) {
        personPickerTickWidgets[widget.capsule["recipient"]-1] = Container(
            padding: const EdgeInsets.only(left: 35, top: 35),
            child: Icon(Icons.check_circle, color: Color(0xFF0066FF))
        );
      }

      personPicker = Container(
        height: 200,
        width: double.infinity,
        margin: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFD9D9D9), width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {setState(() {widget.capsule["recipient"] = 1;});},
                    child: Stack(children: [
                      Image(image: AssetImage("assets/friend1.png")),
                      personPickerTickWidgets[0]
                    ])
                ),
                GestureDetector(
                    onTap: () {setState(() {widget.capsule["recipient"] = 2;});},
                    child: Stack(children: [
                      Image(image: AssetImage("assets/friend2.png")),
                      personPickerTickWidgets[1]
                    ])
                ),
                GestureDetector(
                    onTap: () {setState(() {widget.capsule["recipient"] = 3;});},
                    child: Stack(children: [
                      Image(image: AssetImage("assets/friend3.png")),
                      personPickerTickWidgets[2]
                    ])
                ),
                GestureDetector(
                    onTap: () {setState(() {widget.capsule["recipient"] = 4;});},
                    child: Stack(children: [
                      Image(image: AssetImage("assets/friend4.png")),
                      personPickerTickWidgets[3]
                    ])
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {setState(() {widget.capsule["recipient"] = 5;});},
                    child: Stack(children: [
                      Image(image: AssetImage("assets/friend5.png")),
                      personPickerTickWidgets[4]
                    ])
                ),
                GestureDetector(
                    onTap: () {setState(() {widget.capsule["recipient"] = 6;});},
                    child: Stack(children: [
                      Image(image: AssetImage("assets/friend6.png")),
                      personPickerTickWidgets[5]
                    ])
                ),
                GestureDetector(
                    onTap: () {setState(() {widget.capsule["recipient"] = 7;});},
                    child: Stack(children: [
                      Image(image: AssetImage("assets/friend7.png")),
                      personPickerTickWidgets[6]
                    ])
                ),
                GestureDetector(
                    onTap: () {setState(() {widget.capsule["recipient"] = 8;});},
                    child: Stack(children: [
                      Image(image: AssetImage("assets/friend8.png")),
                      personPickerTickWidgets[7]
                    ])
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Center(
        child: Column(
          children: [
            Row(
              spacing: 2,
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed:  () {},
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(15),
                    iconSize: 30,
                    backgroundColor: Color(0xFFF7D38E),
                  ),
                  child: Icon(Icons.window, color: Colors.white),
                ),
                Icon(Icons.arrow_right_alt, size: 30, color: Color(0xFF797979)),
                ElevatedButton(
                  onPressed:  () {},
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(15),
                    iconSize: 30,
                    backgroundColor: Color(0xFFF7D38E),
                  ),
                  child: Icon(Icons.location_on, color: Colors.white),
                ),
                Icon(Icons.arrow_right_alt, size: 30, color: Color(0xFF797979)),
                ElevatedButton(
                  onPressed:  () {},
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(15),
                    iconSize: 30,
                    backgroundColor: Color(0xFFBFA36F),
                  ),
                  child: Icon(Icons.outgoing_mail, color: Colors.white),
                ),
                Icon(Icons.arrow_right_alt, size: 30, color: Color(0xFF797979)),
                ElevatedButton(
                  onPressed:  () {},
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(15),
                    iconSize: 30,
                    backgroundColor: Color(0xFFF7D38E),
                  ),
                  child: Icon(Icons.mobile_friendly, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              spacing: 40,
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                    onPressed:  () {
                      setState(() {
                        _tabIndex = 0;
                        widget.capsule["recipient"] = 0;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(160, 30),
                      //shape:
                    ),
                    child: const Text('For myself')
                ),
                ElevatedButton(
                    onPressed:  () {
                      setState(() {
                        _tabIndex = 1;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(160, 30),
                      //shape:
                    ),
                    child: const Text("With friends")
                ),
              ],
            ),
            SizedBox(height: 20),
            personPicker,
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'Pick a date',
                  prefixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100)
                  )
                ),
                readOnly: true,
                onTap: (){
                  _selectDate(context);
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
                spacing: 170,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Back"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (widget.capsule.containsKey("date")) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CreateScreenFour(capsule: widget.capsule)));
                      }
                    },
                    child: Text("Next"),
                  ),
                ]
            )
          ],
        )
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2200)
    );

    if (picked != null) {
      widget.capsule["date"] = picked.toString();
      setState(() {
        _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }
}