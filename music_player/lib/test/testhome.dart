import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

Map audioData = {
  'image':
      'https://thegrowingdeveloper.org/thumbs/1000x1000r/audios/quiet-time-photo.jpg',
  'url':
      'https://thegrowingdeveloper.org/files/audios/quiet-time.mp3?b4869097e4'
};

class TestHome extends StatefulWidget {
  @override
  _TestHomeState createState() => _TestHomeState();
}

class _TestHomeState extends State<TestHome> {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration totalDuration;
  Duration position;
  String audioState;

  initAudio() {
    audioPlayer.onDurationChanged.listen((updateDuration) {
      setState(() {
        totalDuration = updateDuration;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((updatePosition) {
      setState(() {
        position = updatePosition;
      });
    });

    audioPlayer.onPlayerStateChanged.listen((playerState) {
      if (playerState == AudioPlayerState.STOPPED) {
        audioState = "Stopped";
      }
      if (playerState == AudioPlayerState.PLAYING) {
        audioState = "Playing";
      }
      if (playerState == AudioPlayerState.PAUSED) {
        audioState = "Paused";
      }

      setState(() {});
    });
  }

  playAudio() {
    audioPlayer.play(
        'https://thegrowingdeveloper.org/files/audios/quiet-time.mp3?b4869097e4');
  }

  pauseAudio() {
    audioPlayer.pause();
  }

  stopAudio() {
    audioPlayer.stop();
  }

  @override
  void initState() {
    initAudio();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              totalDuration.toString().split('.').first,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              position.toString().split('.').first,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              audioState.toString(),
              style: TextStyle(fontSize: 20),
            ), 
            FlatButton(
              child: Text("Play The Auido"),
              onPressed: () {
                playAudio();
              },
              color: Colors.blueGrey,
            ),
            FlatButton(
              child: Text("Pause The Auido"),
              onPressed: () {
                pauseAudio();
              },
              color: Colors.orange,
            ),
            FlatButton(
              child: Text("Stop The Auido"),
              onPressed: () {
                stopAudio();
              },
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
