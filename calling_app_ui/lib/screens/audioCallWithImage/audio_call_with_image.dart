
import 'package:calling_app_ui/screens/audioCallWithImage/components/body.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';



class AudioCallWithImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);


    
    return Scaffold(
      body: Body(),
    );
  }
}
