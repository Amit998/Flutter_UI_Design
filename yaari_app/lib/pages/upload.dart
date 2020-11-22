import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:image/image.dart' as Im;
import 'package:uuid/uuid.dart';
import 'package:yaari_app/models/user.dart';
import 'package:yaari_app/pages/home.dart';
import 'package:yaari_app/widgets/progress.dart';

class Upload extends StatefulWidget {
  final User currentUser;

  Upload({this.currentUser});
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  TextEditingController locationController = TextEditingController();
  TextEditingController captionController = TextEditingController();
  bool isUploading = false;
  String postId = Uuid().v4();
  File file;

  imageFromGallery() async {
    // print('imageFrom Gallery');

    Navigator.pop(context);
    File file = await ImagePicker.pickImage(
        source: ImageSource.gallery, maxWidth: 960, maxHeight: 675);

    setState(() {
      this.file = file;
    });
  }

  handleTakePhoto() async {
    // print('take Photo');
    Navigator.pop(context);
    File file = await ImagePicker.pickImage(
        source: ImageSource.camera, maxWidth: 960, maxHeight: 675);

    setState(() {
      this.file = file;
    });
  }

  selectImage(parentContext) {
    return showDialog(
        context: parentContext,
        builder: (context) {
          return SimpleDialog(
            title: Text("Create Post"),
            children: [
              SimpleDialogOption(
                child: Text("Photo with Camera"),
                onPressed: () => handleTakePhoto(),
                // onPressed: handleTakePhoto(),
              ),
              SimpleDialogOption(
                child: Text("Image From Gallery"),
                // onPressed: () => print('object'),
                onPressed: () => imageFromGallery(),
              ),
              SimpleDialogOption(
                child: Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              )
            ],
          );
        });
  }

  Container buildSplashScreen() {
    return Container(
      color: Theme.of(context).accentColor.withOpacity(0.4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/images/upload.svg", height: 260),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              color: Colors.deepOrange,
              child: Text(
                "Upload Images",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                ),
              ),
              onPressed: () => selectImage(context),
            ),
          )
        ],
      ),
    );
  }

  clearImage() {}

  Scaffold buildUploadForm() {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView(
        children: [
          isUploading ? linearProgress() : Text(""),
          Container(
            height: 220.0,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Center(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.cover,
                    image: FileImage(file),
                  )),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                widget.currentUser.photoUrl,
              ),
            ),
            title: Container(
              width: 250.0,
              child: TextField(
                controller: captionController,
                decoration: InputDecoration(
                  hintText: "Write a caption...",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.pin_drop,
              color: Colors.orange,
              size: 35.0,
            ),
            title: Container(
              width: 250.0,
              child: TextField(
                controller: locationController,
                decoration: InputDecoration(
                    hintText: "Where Was this Photo Taken?",
                    border: InputBorder.none),
              ),
            ),
          ),
          Container(
            width: 200.0,
            height: 100.0,
            alignment: Alignment.center,
            child: RaisedButton.icon(
              icon: Icon(
                Icons.my_location,
                color: Colors.white,
              ),
              label: Text("Use Current Location",
                  style: TextStyle(color: Colors.white)),
              onPressed: getUserCurrentLocation,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }

  getUserCurrentLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placemarks = await Geolocator()
        .placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark placemark = placemarks[0];

    String completeLocation =
        '${placemark.subThoroughfare} ${placemark.subLocality} ${placemark.locality} , ${placemark.subAdministrativeArea} ,${placemark.postalCode} ,${placemark.country}';

    print(position);
    print(completeLocation);
    String formattedLocation = "${placemark.locality} , ${placemark.country}";
    locationController.text = formattedLocation;
  }

  compressImage() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(file.readAsBytesSync());
    final compressedImageFile = File('$path/img_$postId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 85));

    setState(() {
      file = compressedImageFile;
    });
  }

  Future<String> uploadImage(imgFile) async {
    StorageUploadTask uploadTask =
        storageRef.child("post_$postId.jpg").putFile(imgFile);

    StorageTaskSnapshot storageTaskSnap = await uploadTask.onComplete;
    String downloadURL = await storageTaskSnap.ref.getDownloadURL();
    return downloadURL;
  }

  createPostInFireStore(
      {String mediaURL, String location, String description}) {
    postsRef
        .document(widget.currentUser.id)
        .collection("userPosts")
        .document(postId)
        .setData({
      "postId": postId,
      "Owner_Id": widget.currentUser.id,
      "username": widget.currentUser.username,
      "mediaURL": mediaURL,
      "description": description,
      "location": location,
      "timesramp": timeStamp,
      "likes": {}
    });
  }

  handleSubmit() async {
    setState(() {
      isUploading = true;
    });
    await compressImage();
    String mediaURL = await uploadImage(file);
    createPostInFireStore(
      mediaURL: mediaURL,
      location: locationController.text,
      description: captionController.text,
    );
    captionController.clear();
    locationController.clear();
    setState(() {
      file = null;
      isUploading = false;
      postId = Uuid().v4();
    });
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white70,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => clearImage,
      ),
      centerTitle: true,
      title: Text(
        "Caption Post",
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        FlatButton(
          child: Text(
            "Post",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
          onPressed: isUploading ? null : () => handleSubmit(),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return file == null ? buildSplashScreen() : buildUploadForm();
  }
}
