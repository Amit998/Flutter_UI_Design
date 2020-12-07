import 'package:flutter/material.dart';
import 'package:yaari_app/pages/home.dart';
import 'package:yaari_app/widgets/header.dart';
import 'package:yaari_app/widgets/progress.dart';
import 'package:yaari_app/widgets/post.dart';

class PostScreen extends StatelessWidget {
  final String userId;
  final String postId;

  const PostScreen({this.userId, this.postId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: postsRef
          .document(userId)
          .collection('userPosts')
          .document(postId)
          .get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return circularProgress();
        }
        Post post = Post.fromDocument(snapshot.data);
        return Center(
          child: Scaffold(
            appBar: header(context,titleText: post.description),
            body: ListView(
              children: [
                Container(
                  child: post,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
