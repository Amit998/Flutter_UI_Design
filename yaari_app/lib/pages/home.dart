import 'package:firebase_storage/firebase_storage.dart';
import 'package:yaari_app/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yaari_app/pages/activity_feed.dart';
import 'package:yaari_app/pages/create_accounts.dart';
import 'package:yaari_app/pages/profile.dart';
import 'package:yaari_app/pages/search.dart';
import 'package:yaari_app/pages/timeline.dart';
// import 'package:yaari_app/pages/timeline.dart';
import 'package:yaari_app/pages/upload.dart';
import 'package:yaari_app/widgets/post.dart';
// import 'package:geolocator/geolocator.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();
final StorageReference storageRef = FirebaseStorage.instance.ref();
final userRef = Firestore.instance.collection('users');
final postsRef = Firestore.instance.collection('posts');
final timeStamp = DateTime.now();
User currentUser;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isAuth = false;
  int pageIndex = 0;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    googleSignIn.onCurrentUserChanged.listen((account) {
      handleSignIn(account);
    }, onError: (err) {
      print('Error $err');
    });

    googleSignIn
        .signInSilently(
          suppressErrors: false,
        )
        .then((account) => {handleSignIn(account)})
        .catchError((onError) {
      print('Error $onError');
    });
  }

  handleSignIn(GoogleSignInAccount account) {
    if (account != null) {
      // print('User Signed in $account');
      createUserFireStore();
      setState(() {
        isAuth = true;
      });
    } else {
      setState(() {
        isAuth = false;
      });
    }
  }

  createUserFireStore() async {
    // check if users exists in users collection in DB

    final GoogleSignInAccount user = googleSignIn.currentUser;
    DocumentSnapshot doc = await userRef.document(user.id).get();

    // Id it doesnt exsists

    if (!doc.exists) {
      final username = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreateAccount(),
          ));

      // Get Username from create account useut to make user doccument in users collection
      userRef.document(user.id).setData({
        "id": user.id,
        "username": username,
        "photoUrl": user.photoUrl,
        "email": user.email,
        "displayName": user.displayName,
        "bio": "",
        "timestamp": timeStamp
      });
      doc = await userRef.document(user.id).get();
    }
    currentUser = User.fromDocument(doc);
    // print(currentUser);
    // print(currentUser.displayName);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  login() {
    googleSignIn.signIn();
  }

  logout() {
    googleSignIn.signOut();
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex) {
    pageController.animateToPage(pageIndex,
        duration: Duration(
          milliseconds: 500,
        ),
        curve: Curves.easeInOut);
  }

  Scaffold buildAuthScreen() {
    return Scaffold(
      body: PageView(
        children: [
          Timeline(),
          // Post(),
          // RaisedButton(
          //   child: Text("Logout"),
          //   onPressed: logout,
          // ),

          ActivityFeed(),
          Upload(currentUser: currentUser),
          Search(),
          Profile(profileId: currentUser?.id),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: pageIndex,
        onTap: onTap,
        activeColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.whatshot)),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_active)),
          BottomNavigationBarItem(icon: Icon(Icons.photo_camera, size: 35.0)),
          BottomNavigationBarItem(icon: Icon(Icons.search)),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle)),
        ],
      ),
    );
  }

  // Widget buildAuthScreen() {
  // return Scaffold(
  //     body: RaisedButton(
  //   onPressed: () {
  //     logout();
  //   },
  //   child: Text("LogOut"),
  // ));
  // }

  Widget buildUnAuthScreen() {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).accentColor
            ])),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "YaariApp",
              style: TextStyle(
                fontFamily: "Signatra",
                fontSize: 49.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                login();
              },
              child: Container(
                width: 260,
                height: 60,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/google_signin_button.png'),
                        fit: BoxFit.cover)),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? buildAuthScreen() : buildUnAuthScreen();
  }
}
