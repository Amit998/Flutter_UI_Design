import 'package:flutter/material.dart';
import 'package:music_player/colors.dart';

class PlayerControles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Controls(icon: Icons.repeat),
          Controls(icon: Icons.skip_previous),
          PlayControl(
            icon: Icons.play_arrow,
          ),
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
  final IconData icon;

  const PlayControl({Key key, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  icon,
                  size: 50,
                ),
              ),
            ),
          )
        ],
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
