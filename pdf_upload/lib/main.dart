import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File sampleImage;

  Future getImage() async {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      sampleImage = tempImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Image Upload"),
        centerTitle: true,
      ),
      body: Center(
        child: sampleImage == null
            ? Text("There Is No Image")
            : enableUpload(sampleImage),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
    );
  }
}

Widget enableUpload(sampleImage) {
  return Container(
    child: Column(
      children: <Widget>[
        Image.file(sampleImage, height: 300.0, width: 300.0),
        RaisedButton(onPressed: () {
          // final StorageReference firebaseStorageRef =
          //     FirebaseStorage.instance.ref().child('myImage.jpg');
          // final StorageUploadTask task =
          //     firebaseStorageRef.putFile(sampleImage);
        }),
      ],
    ),
  );
}
