import 'package:flutter/material.dart';
import 'package:yaari_app/widgets/header.dart';
// import 'package:yaari_app/widgets/progress.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yaari_app/widgets/progress.dart';

final usersRef = Firestore.instance.collection('users');

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  List<dynamic> users = [];
  @override
  void initState() {
    
    super.initState();
  }

  

  @override
  Widget build(context) {
    return Scaffold(
        appBar: header(context, isAppTitle: true),
        body: FutureBuilder<QuerySnapshot>(
            future: usersRef.getDocuments(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return circularProgress();
              } else {
                final List<Text> children = snapshot.data.documents
                    .map((doc) => Text(doc['username']))
                    .toList();
                return Container(
                  child: ListView(children: children),
                );
              }
            }
        )
    );
  }
}
