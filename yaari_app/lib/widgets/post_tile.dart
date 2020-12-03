import 'package:flutter/material.dart';
import 'package:yaari_app/widgets/custom_image.dart';
import 'package:yaari_app/widgets/post.dart';

class PostTile extends StatelessWidget {
  final Post post;
  PostTile(this.post);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> print("Showing post"),
      child: cachedNetworkImage(post.mediaURL),
    );
  }
}
