import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yaari_app/pages/home.dart';
import 'package:yaari_app/widgets/header.dart';
import 'package:yaari_app/widgets/progress.dart';
import 'package:timeago/timeago.dart' as timeago;

class Comments extends StatefulWidget {
  final String postId;
  final String postOwnerId;
  final String mediaUrl;

  Comments({Key key, this.postId, this.postOwnerId, this.mediaUrl});

  @override
  CommentsState createState() => CommentsState(
      postId: this.postId,
      postOwnerId: this.postOwnerId,
      mediaUrl: this.mediaUrl);
}

class CommentsState extends State<Comments> {
  TextEditingController commentController = TextEditingController();
  final String postId;
  final String postOwnerId;
  final String mediaUrl;

  CommentsState({this.postId, this.postOwnerId, this.mediaUrl});

  buildComment() {
    // print(postId);
    return StreamBuilder(
      stream: commentsRef
          .document(postId)
          .collection('comments')
          .orderBy('timestamp', descending: false)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return circularProgress();
        }
        List<Comment> comments = [];
        print(snapshot.data.documents.length);
        snapshot.data.documents.forEach((doc) {
          // print('doc');
          comments.add(Comment.fromDocument(doc));
        });
        // print('comments');
        return ListView(
          children: comments,
        );
      },
    );
  }

  addComment() {
    commentsRef.document(postId).collection("comments").add({
      "username": currentUser.username,
      "comment": commentController.text,
      "timestamp": timeStamp,
      "avatarUrl": currentUser.photoUrl,
      "userId": currentUser.id
    });
    bool isNotPostOwner = postOwnerId != currentUser.id;
    if (isNotPostOwner) {
      activityFeedRef.document(postOwnerId).collection('feedItems').add({
        "type": "comment",
        "commentData": commentController.text,
        "username": currentUser.username,
        "userId": currentUser.id,
        "userProfileImg": currentUser.photoUrl,
        "postId": postId,
        "mediaUrl": mediaUrl,
        "timestamp": timeStamp
      });
    }

    commentController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, titleText: "Comments"),
      body: Column(
        children: [
          Expanded(
            child: buildComment(),
          ),
          Divider(),
          ListTile(
            title: TextFormField(
              controller: commentController,
              decoration: InputDecoration(labelText: "Write a comment..."),
            ),
            trailing: OutlineButton(
              onPressed: () => addComment(),
              borderSide: BorderSide.none,
              child: Text("POST"),
            ),
          )
        ],
      ),
    );
  }
}

class Comment extends StatelessWidget {
  final String username;
  final String userId;
  final String avatarUrl;
  final String comment;
  final Timestamp timestamp;

  Comment(
      {this.username,
      this.userId,
      this.avatarUrl,
      this.comment,
      this.timestamp});

  factory Comment.fromDocument(DocumentSnapshot doc) {
    return Comment(
        username: doc['username'],
        userId: doc['userId'],
        comment: doc['comment'],
        timestamp: doc['timestamp'],
        avatarUrl: doc['avatarUrl']);
  }
  @override
  Widget build(BuildContext context) {
    // print('$username uname');
   
    return Column(
      children: [
        ListTile(
          title: RichText(
            
              text: TextSpan(
                
                style: TextStyle(fontSize: 16.0,color: Colors.black),
                children: [
                TextSpan(text: "$username \n",style: TextStyle(fontWeight: FontWeight.bold)),
                
                TextSpan(text: comment,style: TextStyle(fontSize: 15.0))
              ]
            )
          ),
          leading: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(avatarUrl),
          ),
          
          
          subtitle: Row(
            children: [
              SizedBox(height: 30.0),
              Text(timeago.format(timestamp.toDate()))
            ],
          ),
          isThreeLine: true,
        ),
        Divider(),
      ],
    );
  }
}
