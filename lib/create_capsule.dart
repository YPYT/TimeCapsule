import 'package:flutter/material.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  DateTime? _selectedDate = null;
  TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextField(
            controller: _dateController,
            decoration: InputDecoration(
              labelText: 'DATE',
              filled: true,
              prefixIcon: Icon(Icons.calendar_today),
            ),
            readOnly: true,
            onTap: (){
              _selectDate(context);
            },
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Message',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Address',
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
            ),
            onPressed: () {},
            child: Text("Bury!"),
          ),
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
      _selectedDate = picked;
      setState(() {
        _dateController.text = picked.toString().split(" ")[0];
      });
    }
  }
}