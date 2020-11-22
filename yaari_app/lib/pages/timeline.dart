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
    // createUser();
    getUser();
    // updateUser();
    // deleteUser();
    super.initState();
  }

  getUser() {
    usersRef.document().get();
  }

  createUser() async {
    usersRef
        .document("ahjvjhgvjgh")
        .setData({"username": "Rajni Kant", "postsCount": 1, "isAdmin": false});
  }

  updateUser() async {
    final doc = await usersRef.document("ahjvjhgvjgh").get();
    if (doc.exists) {
      doc.reference.updateData(
          {"username": "Rajni Kant Singh", "postsCount": 10, "isAdmin": false});
    }
    // .updateData({"username": "Rajni Kant Singh", "postsCount": 10, "isAdmin": false});
  }

  deleteUser() async {
    final doc = await usersRef.document("ahjvjhgvjgh").get();
    if (doc.exists) {
      usersRef.document("ahjvjhgvjgh").delete();
    }
  }

  @override
  Widget build(context) {
    return Scaffold(
        appBar: header(context, isAppTitle: true),
        body: StreamBuilder<QuerySnapshot>(
            stream: usersRef.snapshots(),
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
            }));
  }
}
