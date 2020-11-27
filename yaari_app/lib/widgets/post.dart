import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yaari_app/models/user.dart';
import 'package:yaari_app/pages/timeline.dart';
import 'package:yaari_app/widgets/progress.dart';

class Post extends StatefulWidget {
  final String postId;
  final String ownerId;
  final String username;
  final String description;
  final String location;
  final String mediaUrl;
  final dynamic likes;

  const Post(
      {Key key,
      this.postId,
      this.ownerId,
      this.username,
      this.description,
      this.location,
      this.mediaUrl,
      this.likes})
      : super(key: key);

  factory Post.fromDocument(DocumentSnapshot doc) {
    return Post(
      postId: doc['postId'],
      ownerId: doc['ownerId'],
      username: doc['username'],
      location: doc['location'],
      description: doc['description'],
      mediaUrl: doc['mediaUrl'],
      likes: doc['likes'],
    );
  }

  int getLikescount(likes) {
    if (likes == null) {
      return 0;
    }
    int count = 0;
    likes.value.forEach((val) {
      if (val == true) {
        count += 1;
      }
    });

    return count;
  }

  @override
  _PostState createState() => _PostState(
        postId: this.postId,
        ownerId: this.ownerId,
        username: this.username,
        location: this.location,
        description: this.description,
        mediaUrl: this.mediaUrl,
        likes: this.likes,
        likeCount: getLikescount(this.likes),
      );
}

class _PostState extends State<Post> {
  final String postId;
  final String ownerId;
  final String username;
  final String location;
  final String description;
  final String mediaUrl;
  int likeCount;
  Map likes;

  _PostState({
    this.postId,
    this.ownerId,
    this.username,
    this.location,
    this.description,
    this.mediaUrl,
    this.likes,
    this.likeCount,
  });
  buildPostHeader() {
    return FutureBuilder(
      future: usersRef.document(ownerId).get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return circularProgress();
        }
        User user = User.fromDocument(snapshot.data);
        print(user);
        // return Text("user");

        return ListTile(
          leading: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(user.photoUrl),
            backgroundColor: Colors.grey,
          ),
          title: GestureDetector(
            onTap: () => print("Showing"),
            child: Text(
              user.username,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          subtitle: Text(location),
          trailing: IconButton(
            onPressed: () => print("object"),
            icon: Icon(Icons.more_vert),
          ),
        );
      },
    );
  }

  buildPostImage() {
    return GestureDetector(
      onDoubleTap: () => print("like"),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.network(mediaUrl),
        ],
      ),
    );
  }

  buildPostFooter() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40.0,left: 20.0),
            ),

            GestureDetector(
              onTap: ()=> print("Liked Post"),
              child: Icon(
                Icons.favorite_border,
                size: 28.0,
                color: Colors.pink,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.0), 
            ),
            GestureDetector(
              onTap: ()=> print("Show Comments"),
              child: Icon(
                Icons.chat,
                size: 28.0,
                color: Colors.blue[900],
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20.0),
              child: Text(
                "$likeCount likes",
                style: TextStyle(color:Colors.black ,fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),

         Row(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Container(
              margin: EdgeInsets.only(left: 20.0),
              child: Text(
                "$username",
                style: TextStyle(color:Colors.black ,fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Text("$description"),
            )
          ],
        ),

      ],
    );
  }
 

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildPostHeader(),
          Divider(height: 0.0),

         

          buildPostImage(),
          buildPostFooter(),
        ],
      ),
    );
  }
}
