import 'package:flutter/material.dart';
import 'package:music_player/colors.dart';
import 'package:music_player/model/myaudio.dart';
import 'package:music_player/test/testhome.dart';
import 'package:music_player/widgets/albumArt.dart';
import 'package:music_player/widgets/navbar.dart';
import 'package:music_player/widgets/playControles.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Circular'),
      // home: TestHome(),

      home: ChangeNotifierProvider(
        create: (_) => MyAudio(),
        child: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double sliderValue = 2;
  Map audioData = {
    'image':
        'https://thegrowingdeveloper.org/thumbs/1000x1000r/audios/quiet-time-photo.jpg',
    'url':
        'https://thegrowingdeveloper.org/files/audios/quiet-time.mp3?b4869097e4'
  };

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NavigationBar(),
          Container(
            height: height / 2.5,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return AlbumArt();
              },
              itemCount: 3,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Text(
            "Gidget",
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: darkPrimaryColor),
          ),
          Text(
            "The Free Nationals",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w100,
                color: darkPrimaryColor),
          ),
          SliderTheme(
            data: SliderThemeData(
                trackHeight: 5,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5)),
            child: Consumer<MyAudio>(
              builder: (_, myAudioModel, child) => Slider(
                value: myAudioModel.position == null
                    ? 0
                    : myAudioModel.position.inMilliseconds.toDouble(),
                activeColor: darkPrimaryColor.withOpacity(0.8),
                inactiveColor: darkPrimaryColor.withOpacity(0.2),
                onChanged: (value) {
                  setState(() {
                    // sliderValue = value;
                    myAudioModel
                        .seekAudio(Duration(milliseconds: value.toInt()));
                  });
                },
                min: 0,
                max: myAudioModel.totalDuration == null
                    ? 20
                    : myAudioModel.totalDuration.inMilliseconds.toDouble(),
              ),
            ),
          ),
          PlayerControles(),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
