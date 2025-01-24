import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';

class CreateScreenOld extends StatefulWidget {
  const CreateScreenOld({super.key});

  @override
  State<CreateScreenOld> createState() => _CreateScreenOldState();
}

class _CreateScreenOldState extends State<CreateScreenOld> {
  String _title = "";
  String _message = "";
  String _address = "";
  int _recipient = 0;
  final List<XFile> _media = [];
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
              _onPickImagePressed();
            },
            child: Text("Add Images/Videos"),
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
          //MapLocationPicker(
          //    apiKey: "AIzaSyBra6IL9KgvYrPwBLj4NCKu1Ly6OcTR1Oo",
          //),
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

    // Save media files
    List<String> mediaPaths = [];
    final String docDir = (await getApplicationDocumentsDirectory()).path;
    for (XFile mediaFile in _media) {
      final String savedFilePath = "$docDir/${mediaFile.name}";
      await mediaFile.saveTo(savedFilePath);
      mediaPaths.add(savedFilePath);
    }

    // Insert new capsule into list
    final capsuleData = {
      "title": _title,
      "message": _message,
      "date": _selectedDate.toString(),
      "address": _address,
      "recipient": _recipient,
      "media": mediaPaths,
      "sender": 0,
      "unlocked": 0,
      "buried_date": DateTime.now().toString(),
    };
    capsules.add(capsuleData);

    // Write back to storage
    final finalCapsulesString = jsonEncode(capsules);
    log('final capsules: $finalCapsulesString');
    await prefs.setString('capsules', finalCapsulesString);
  }

  Future<void> _onPickImagePressed() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> medias = await picker.pickMultipleMedia();
    for (XFile file in medias) {
      _media.add(file);
    }
  }

  // TEMP
  Future<void> _onDeleteAllDataPressed() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('capsules');
  }
}