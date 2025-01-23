import 'package:flutter/material.dart';

class CreateScreenThree extends StatefulWidget {
  const CreateScreenThree({super.key});

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
      personPicker = Container(
        height: 200,
        width: double.infinity,
        margin: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFD9D9D9), width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
      );
    }

    return Center(
        child: Column(
          children: [
            Row(
              spacing: 5,
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed:  () {},
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(15),
                    iconSize: 35,
                  ),
                  child: Icon(Icons.window, color: Colors.black),
                ),
                Icon(Icons.arrow_right_alt, size: 30),
                ElevatedButton(
                  onPressed:  () {},
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(15),
                    iconSize: 35,
                  ),
                  child: Icon(Icons.location_on, color: Colors.black),
                ),
                Icon(Icons.arrow_right_alt, size: 30),
                ElevatedButton(
                  onPressed:  () {},
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(15),
                    iconSize: 35,
                  ),
                  child: Icon(Icons.outgoing_mail, color: Colors.black),
                ),
                Icon(Icons.arrow_right_alt, size: 30),
                ElevatedButton(
                  onPressed:  () {},
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(15),
                    iconSize: 35,
                  ),
                  child: Icon(Icons.mobile_friendly, color: Colors.black),
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
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => CreateScreenTwo()));
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
      //_selectedDate = picked;
      setState(() {
        _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }
}