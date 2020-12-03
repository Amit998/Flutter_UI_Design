import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yaari_app/widgets/progress.dart';

Widget cachedNetworkImage(String mediaURL) {
  return CachedNetworkImage(
    imageUrl: mediaURL,
    fit: BoxFit.cover,
    placeholder: (context,url) => Padding(
      child: CircularProgressIndicator(),
      padding: EdgeInsets.all(20.0),
    ),
    errorWidget: (context, url, error) => Icon(Icons.error),
    
  );
}
