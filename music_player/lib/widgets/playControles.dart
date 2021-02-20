import 'package:flutter/material.dart';
import 'package:music_player/colors.dart';
import 'package:music_player/main.dart';
import 'package:music_player/model/myaudio.dart';
import 'package:provider/provider.dart';

class PlayerControles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Controls(icon: Icons.repeat),
          Controls(icon: Icons.skip_previous),
          PlayControl(),
          Controls(
            icon: Icons.skip_next,
          ),
          Controls(
            icon: Icons.shuffle,
          ),
        ],
      ),
    );
  }
}

class PlayControl extends StatelessWidget {
  const PlayControl({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<MyAudio>(
      builder: (_, myAudioModel, child) => GestureDetector(
        onTap: () {
          // myAudioModel.playAudio();
          // if (myAudioModel.audioState == 'Playing') {
          //   myAudioModel.pauseAudio();
          // } else if (myAudioModel.audioState == 'Paused') {
          //   myAudioModel.playAudio();
          // }
          myAudioModel.audioState == 'Playing'
              ? myAudioModel.pauseAudio()
              : myAudioModel.playAudio();
        },
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: shadowList,
            color: primaryColor,
          ),
          child: Stack(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: darkPrimaryColor,
                      shape: BoxShape.circle,
                      boxShadow: shadowList),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,
                      boxShadow: shadowList),
                  child: Center(
                    child: Icon(
                      myAudioModel.audioState == 'Playing'
                          ? Icons.pause
                          : Icons.play_arrow,
                      size: 50,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Controls extends StatelessWidget {
  final IconData icon;

  const Controls({Key key, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: shadowList,
        color: darkPrimaryColor.withOpacity(0.5),
      ),
      child: Stack(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                  boxShadow: shadowList),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                  boxShadow: shadowList),
              child: Center(
                child: Icon(
                  icon,
                  size: 30,
                  color: darkPrimaryColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
