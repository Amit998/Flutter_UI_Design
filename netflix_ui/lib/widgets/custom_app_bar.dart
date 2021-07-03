import 'package:flutter/material.dart';
import 'package:netflix_ui/assets.dart';
import 'package:netflix_ui/widgets/widgets.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffSet;

  const CustomAppBar({Key key, this.scrollOffSet = 0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      color:
          Colors.black.withOpacity((scrollOffSet / 350).clamp(0, 1).toDouble()),
      child: Responsive(
          mobile: _CustomAppBarMobile(), desktop: _CustomAppBarDesktop()),
    );
  }
}

class _CustomAppBarDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo1),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(
                  title: "Home",
                  onTap: () {
                    print("Home");
                  },
                ),
                _AppBarButton(
                  title: "Movies",
                  onTap: () {
                    print("Movies");
                  },
                ),
                _AppBarButton(
                  title: "Tv Shows",
                  onTap: () {
                    print("TV Shows");
                  },
                ),
                _AppBarButton(
                  title: "Latest",
                  onTap: () {
                    print("Latest");
                  },
                ),
                _AppBarButton(
                  title: "Tv List",
                  onTap: () {
                    print("TV List");
                  },
                )
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 28,
                    color: Colors.white,
                    onPressed: () {
                      print('Search');
                    },
                    icon: Icon(Icons.search)),
                _AppBarButton(
                  title: "KIDS",
                  onTap: () {
                    print("KIDS");
                  },
                ),
                _AppBarButton(
                  title: "DVD",
                  onTap: () {
                    print("DVD");
                  },
                ),
                IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 28,
                    color: Colors.white,
                    onPressed: () {
                      print('Gifts');
                    },
                    icon: Icon(Icons.card_giftcard)),
                IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 28,
                    color: Colors.white,
                    onPressed: () {
                      print('Notifications');
                    },
                    icon: Icon(Icons.notification_add)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBarMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo0),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(
                  title: "TV Shows",
                  onTap: () {
                    print("Tv Shows");
                  },
                ),
                _AppBarButton(
                  title: "Movies",
                  onTap: () {
                    print("Movies");
                  },
                ),
                _AppBarButton(
                  title: "Tv List",
                  onTap: () {
                    print("TV List");
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final String title;
  final Function onTap;

  const _AppBarButton({Key key, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white),
      ),
    );
  }
}
