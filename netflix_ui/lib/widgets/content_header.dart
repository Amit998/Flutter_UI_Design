import 'package:flutter/material.dart';
import 'package:netflix_ui/models/models.dart';
import 'package:video_player/video_player.dart';

import 'widgets.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;

  const ContentHeader({Key key, this.featuredContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: _ContentHeaderMobile(featuredContent: featuredContent),
        desktop: _ContentHeaderDesktop(featuredContent: featuredContent));
  }
}

class _ContentHeaderMobile extends StatelessWidget {
  final Content featuredContent;

  const _ContentHeaderMobile({Key key, this.featuredContent}) : super(key: key);

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

class _ContentHeaderDesktop extends StatefulWidget {
  final Content featuredContent;

  const _ContentHeaderDesktop({Key key, this.featuredContent})
      : super(key: key);

  @override
  __ContentHeaderDesktopState createState() => __ContentHeaderDesktopState();
}

class __ContentHeaderDesktopState extends State<_ContentHeaderDesktop> {
  VideoPlayerController _videoPlayerController;

  bool _isMuted = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoPlayerController =
        VideoPlayerController.network(widget.featuredContent.videoUrl)
          ..initialize().then((_) => setState(() {}))
          ..setVolume(0)
          ..play();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _videoPlayerController.value.isPlaying
            ? _videoPlayerController.pause()
            : _videoPlayerController.play();
      },
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          AspectRatio(
            aspectRatio: _videoPlayerController.value.initialized
                ? _videoPlayerController.value.aspectRatio
                : 2.344,
            child: _videoPlayerController.value.initialized
                ? VideoPlayer(_videoPlayerController)
                : Image.asset(
                    widget.featuredContent.imageUrl,
                    fit: BoxFit.cover,
                  ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -1.0,
            child: AspectRatio(
              aspectRatio: _videoPlayerController.value.initialized
                  ? _videoPlayerController.value.aspectRatio
                  : 2.344,
              child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.black, Colors.transparent],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter))),
            ),
          ),
          Positioned(
              left: 60,
              right: 60,
              bottom: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 250,
                    child: Image.asset(widget.featuredContent.titleImageUrl),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(widget.featuredContent.description,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          shadows: [
                            Shadow(
                                color: Colors.black,
                                offset: Offset(2.0, 4.0),
                                blurRadius: 6.0)
                          ])),
                  Row(
                    children: [
                      _PlayButton(),
                      const SizedBox(
                        width: 16.0,
                      ),
                      FlatButton.icon(
                          padding: EdgeInsets.fromLTRB(25, 10, 30, 10),
                          onPressed: () {
                            print("More Info");
                          },
                          icon: const Icon(Icons.info_outline),
                          label: const Text(
                            "More Info",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )),
                      SizedBox(
                        width: 20.0,
                      ),
                      if (_videoPlayerController.value.initialized)
                        IconButton(
                            onPressed: () {
                              setState(() {
                                _isMuted
                                    ? _videoPlayerController.setVolume(100)
                                    : _videoPlayerController.setVolume(0);
                                _isMuted =
                                    _videoPlayerController.value.volume == 0;
                              });
                            },
                            color: Colors.white,
                            iconSize: 30,
                            icon: Icon(
                                _isMuted ? Icons.volume_off : Icons.volume_up))
                    ],
                  )
                ],
              )),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
        padding: !Responsive.isDesktop(context)
            ? const EdgeInsets.fromLTRB(15.0, 5, 20, 5)
            : EdgeInsets.fromLTRB(25, 10, 30, 10),
        label: const Text(
          "Play",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        onPressed: () {},
        color: Colors.white,
        icon: const Icon(Icons.play_arrow, size: 30));
  }
}
