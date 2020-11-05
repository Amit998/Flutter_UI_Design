import 'package:calling_app_ui/screens/audioCallWithImage/audio_call_with_image.dart';
import 'package:calling_app_ui/size_config.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AudioCallWithImage(),
    );
  }
}

