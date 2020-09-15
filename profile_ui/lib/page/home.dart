import 'package:flutter/material.dart';
import './widgets/card_item.dart';
import './widgets/stack_container.dart';


class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            StackContainer(),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemBuilder:(context,index) => CardItem(),
            shrinkWrap: true,
            itemCount: 6,
            ),
          ],
        ),
      ),
    );
  }
}
