import 'package:curd_opt_sqllite/database/databaseHelper.dart';
import 'package:curd_opt_sqllite/models/note.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NoteDetail extends StatefulWidget {
  final String appBarTitle;

  final Note note;

  NoteDetail(this.note, this.appBarTitle);

  @override
  _NoteDetailState createState() =>
      _NoteDetailState(this.note, this.appBarTitle);
}

class _NoteDetailState extends State<NoteDetail> {
  String appBarTitle;
  Note note;
  static var _priorities = ['High', 'Low'];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  _NoteDetailState(this.note, this.appBarTitle);

  DatabaseHelper helper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    titleController.text = note.title;
    descriptionController.text = note.description;

    return WillPopScope(
      onWillPop: () {
        movetoLastScreen();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              movetoLastScreen();
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: [
              ListTile(
                title: DropdownButton(
                  items: _priorities.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  style: textStyle,
                  value: getPriorityAsString(note.priority),
                  onChanged: (valueSelected) {
                    setState(() {
                      debugPrint('User Selecetd $valueSelected ');
                      updatePriority(valueSelected);
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: TextField(
                  controller: titleController,
                  style: textStyle,
                  onChanged: (value) {
                    setState(() {
                      debugPrint('something Changed in the Title field');
                      updateTitle();
                    });
                  },
                  decoration: InputDecoration(
                      labelText: 'TITLE',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: TextField(
                  controller: titleController,
                  style: textStyle,
                  onChanged: (value) {
                    setState(() {
                      debugPrint('something');
                      updateDescription();
                    });
                  },
                  decoration: InputDecoration(
                      labelText: 'Description',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: RaisedButton(
                          color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).primaryColorLight,
                          child: Text("Save", textScaleFactor: 1.5),
                          onPressed: () {
                            setState(() {
                              debugPrint("Save Button Click");
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: RaisedButton(
                          color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).primaryColorLight,
                          child: Text("Delete", textScaleFactor: 1.5),
                          onPressed: () {
                            setState(() {
                              debugPrint("Save Button Click");
                            });
                          },
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void movetoLastScreen() {
    Navigator.pop(context);
  }

  void updatePriority(String value) {
    switch (value) {
      case 'High':
        note.priority = 1;
        break;
      case 'Low':
        note.priority = 2;
        break;
    }
  }

  String getPriorityAsString(int value) {
    String priority;
    switch (value) {
      case 1:
        priority = _priorities[0];
        break;
      case 2:
        priority = _priorities[1];
        break;
    }
    return priority;
  }

  void updateTitle() {
    note.title = titleController.text;
  }

  void updateDescription() {
    note.description = descriptionController.text;
  }

  void _save() async {
    if (note.id != null) {
    } else {}
  }
}
