import 'package:flutter/material.dart';
import 'package:netflix_ui/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: () {
          print("Cast");
        },
        child: const Icon(Icons.cast),
      ),
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50),
        child: CustomAppBar(),
      ),
    );
  }
}
