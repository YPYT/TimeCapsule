import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  String _title = "";
  String _message = "";
  String _address = "";
  int _recipient = 0;
  DateTime? _selectedDate;
  final TextEditingController _dateController = TextEditingController();

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
              labelText: 'Title',
            ),
            onChanged: (newVal) {
              _title = newVal;
            },
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Message',
            ),
            onChanged: (newVal) {
              _message = newVal;
            },
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Address',
            ),
            onChanged: (newVal) {
              _address = newVal;
            },
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Recipient',
            ),
            keyboardType: TextInputType.number,
            onChanged: (newVal) {
              _recipient = int.parse(newVal);
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
            ),
            onPressed: () {
              _onBuryPressed();
            },
            child: Text("Bury!"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
            ),
            onPressed: () {
              _onDeleteAllDataPressed();
            },
            child: Text("Delete All Data"),
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

  Future<void> _onBuryPressed() async {
    final prefs = await SharedPreferences.getInstance();

    // Get capsules list
    final capsulesString = prefs.getString('capsules') ?? "[]";
    final capsules = jsonDecode(capsulesString) as List<dynamic>;

    if (_title.isEmpty || _message.isEmpty || _address.isEmpty || _selectedDate == null) {
      return;
    }

    // Insert new capsule into list
    final capsuleData = {
      "title": _title,
      "message": _message,
      "date": _selectedDate.toString(),
      "address": _address,
      "recipient": _recipient,
      "sender": 0,
      "unlocked": 0,
    };
    capsules.add(capsuleData);

    // Write back to storage
    final finalCapsulesString = jsonEncode(capsules);
    log('final capsules: $finalCapsulesString');
    await prefs.setString('capsules', finalCapsulesString);
  }

  // TEMP
  Future<void> _onDeleteAllDataPressed() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('capsules');
    await prefs.remove('unlocked_capsules');
  }
}