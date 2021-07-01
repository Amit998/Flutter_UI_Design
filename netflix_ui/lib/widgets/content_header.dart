import 'package:flutter/material.dart';
import 'package:netflix_ui/models/models.dart';

import 'widgets.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;

  const ContentHeader({Key key, this.featuredContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  featuredContent.imageUrl,
                ),
                fit: BoxFit.cover),
          ),
        ),
        Container(
            height: 500,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter))),
        Positioned(
          bottom: 110,
          child: SizedBox(
            width: 250,
            child: Image.asset(featuredContent.titleImageUrl),
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VerticalIconButton(
                  icon: Icons.add,
                  title: "My List",
                  onTap: () {},
                ),
                _PlayButton(),
                VerticalIconButton(
                  icon: Icons.info_outline,
                  title: "My Info",
                  onTap: () {},
                ),
              ],
            ))
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
        padding: const EdgeInsets.fromLTRB(15.0, 5, 20, 5),
        label: const Text(
          "Play",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        onPressed: () {},
        color: Colors.white,
        icon: const Icon(Icons.play_arrow, size: 30));
  }
}
