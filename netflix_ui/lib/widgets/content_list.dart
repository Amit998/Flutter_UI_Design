import 'package:flutter/material.dart';
import 'package:netflix_ui/models/content_model.dart';

class ContentList extends StatelessWidget {
  final String title;
  final bool isOrignals;
  final List<Content> contentList;

  const ContentList(
      {Key key,
      @required this.title,
      this.isOrignals = false,
      @required this.contentList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 6.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Container(
            height: isOrignals ? 500.0 : 220,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(),
                itemCount: contentList.length,
                itemBuilder: (BuildContext context, int index) {
                  final Content content = contentList[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    height: isOrignals ? 400 : 200.0,
                    width: isOrignals ? 200 : 130.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(content.imageUrl),
                            fit: BoxFit.cover)),
                  );
                }),
          )
        ],
      ),
    );
  }
}
