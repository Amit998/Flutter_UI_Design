import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui/widgets/destination_carsouel.dart';
import 'package:travel_ui/widgets/hotel_carsouel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  int _currentTab = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        print(_selectedIndex);
      },
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: _selectedIndex == index ? 35 : 25,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Colors.grey,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 120),
              child: Text(
                "What Would you like to find? ",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _icons
                    .asMap()
                    .entries
                    .map((MapEntry map) => _buildIcon(map.key))
                    .toList()),
            DestinationCarousel(),
            SizedBox(height: 10),
            HotelCarsouel(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        currentIndex: _currentTab,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30,
              ),
              // title: Text('Search')
              title: SizedBox.shrink()),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.local_pizza,
                size: 30,
              ),
              title: SizedBox.shrink()),
          // label: ''),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage(
                    'https://m.media-amazon.com/images/M/MV5BMjMwZjhjOTUtNmVjNS00NTM1LWEwOTItN2ZlMzMwMGY5ZGQ2XkEyXkFqcGdeQXVyNDAzNDk0MTQ@._V1_.jpg'),
              ),
              title: SizedBox.shrink()),
          // label: '')
        ],
      ),
    );
  }
}
