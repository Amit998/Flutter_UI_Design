import 'package:async/async.dart';
import 'package:brew_crew_app/shared/constants.dart';
import 'package:flutter/material.dart';

class SettingForm extends StatefulWidget {
  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];
  String _currentName;
  String _currentSugars;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            'Update Your Brew Settings',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            
            decoration: textInputDecoration,
            validator: (val) => val.isEmpty ? 'Enter An Name' : null,
            onChanged: (val) => setState(() => _currentName = val),
          ),
          SizedBox(
            height: 20.0,
          ),
          // dropdown
          DropdownButtonFormField(
            value: _currentSugars ?? '0',
            items: sugars.map((sugar) {
              return DropdownMenuItem(
                value: sugar,
                child: Text('$sugar Sugars'),
              );
            }).toList(),
            
          ),
          // slider
          Slider(
            value: (_currentStrength ?? 100).toDouble(),
            min: 100.0,
            max: 900.0,
            activeColor: Colors.brown[_currentStrength ?? 100],
            inactiveColor: Colors.brown[_currentStrength ?? 100],
            divisions: 8,
          
            onChanged: (value) => setState(() => _currentStrength = value.round()),

            
            
          ),
          RaisedButton(
            color: Colors.brown[400],
            child: Text(
              'Update',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              print(_currentName);
              print(_currentSugars);
              print(_currentStrength);
            },
          ),
        ],
      ),
    );
  }
}
