import 'package:flutter/material.dart';
import 'package:yaari_app/pages/post_screen.dart';
import 'package:yaari_app/widgets/custom_image.dart';
import 'package:yaari_app/widgets/post.dart';
import 'package:yaari_app/models/user.dart';

class PostTile extends StatelessWidget {
  final Post post;

  PostTile(this.post);
  showPost(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PostScreen(
                  postId: post.postId,
                  userId: post.ownerId,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showPost(context),
      child: cachedNetworkImage(post.mediaURL),
    );
  }
}
