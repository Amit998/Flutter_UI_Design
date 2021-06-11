import 'package:flutter/material.dart';
import 'package:flutter_notes_ui/models/note_model.dart';
import 'package:intl/intl.dart';

class NoteScreen extends StatefulWidget {
  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen>
    with SingleTickerProviderStateMixin {
  int _selectedCategoryIndex = 0;
  TabController _tabController;
  final DateFormat _dateFormatter = DateFormat('dd MMM');
  final DateFormat _timeFormatter = DateFormat('h:mm');

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  Widget _buildCategoryCard(int index, String title, int count) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategoryIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        height: 240,
        width: 175,
        decoration: BoxDecoration(
            color: _selectedCategoryIndex == index
                ? Color(0xFF417BFB)
                : Color(0xFFF5F7FB),
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              _selectedCategoryIndex == index
                  ? BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 10.0)
                  : BoxShadow(color: Colors.transparent),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 28,
                    color: _selectedCategoryIndex == index
                        ? Colors.white
                        : Color(0xFFAFB4C6)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                count.toString(),
                style: TextStyle(
                    color: _selectedCategoryIndex == index
                        ? Colors.white
                        : Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/user.png"),
                      ),
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  "Jenny Break",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: 280,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return SizedBox(width: 20.0);
                  }
                  return _buildCategoryCard(
                    index - 1,
                    categories.keys.toList()[index - 1],
                    categories.values.toList()[index - 1],
                  );
                }),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Color(0xFFAFB4C6),
              indicatorColor: Color(0xFF417BFB),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 4.0,
              isScrollable: true,
              tabs: [
                Tab(
                  child: Text(
                    "Notes",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    "Important",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    "Performed",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.0),
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Color(0xFFF5F7FB),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      notes[0].title,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      _timeFormatter.format(notes[0].date),
                      style: TextStyle(
                          color: Color(0xFFAFB4C6),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  notes[0].content,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      _dateFormatter.format(notes[0].date),
                      style: TextStyle(
                          color: Color(0xFFAFB4C6),
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Color(0xFF417BFB),
                          borderRadius: BorderRadius.circular(16.0)),
                      child: Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.0),
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Color(0xFFF5F7FB),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      notes[1].title,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      _timeFormatter.format(notes[1].date),
                      style: TextStyle(
                          color: Color(0xFFAFB4C6),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  notes[1].content,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      _dateFormatter.format(notes[0].date),
                      style: TextStyle(
                          color: Color(0xFFAFB4C6),
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Color(0xFF417BFB),
                          borderRadius: BorderRadius.circular(16.0)),
                      child: Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
