import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            forceElevated: true,
            expandedHeight: 100,
            floating: true,
            // pinned: true,
            centerTitle: true,
            leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings,
                  size: 30,
                )),
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Simple Budget"),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.add)),
            ],
          ),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.all(10),
              height: 100.0,
              color: Colors.red,
            );
          }, childCount: 10))
        ],
      ),
    );
  }
}
