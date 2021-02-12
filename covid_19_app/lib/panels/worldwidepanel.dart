import 'package:flutter/material.dart';

class WorldWidePanel extends StatelessWidget {
  final Map worldData;

  const WorldWidePanel({Key key, this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: [
          StatusPanel(
            title: 'Conformed',
            count: '${worldData['cases']}',
            panelColor: Colors.red,
            textColor: Colors.red[100],
          ),
          StatusPanel(
            title: 'Active',
            count: '${worldData['active']}',
            panelColor: Colors.blue,
            textColor: Colors.blue[100],
          ),
          StatusPanel(
            title: 'Recovered',
            count: '${worldData['recovered']}',
            panelColor: Colors.green,
            textColor: Colors.green[100],
          ),
          StatusPanel(
            title: 'Death',
            count: '${worldData['deaths']}',
            panelColor: Colors.grey,
            textColor: Colors.grey[100],
          ),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel(
      {Key key, this.panelColor, this.textColor, this.title, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(8),
      height: 80,
      width: width / 2,
      color: panelColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: textColor),
          ),
          Text(count,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16, color: textColor)),
        ],
      ),
    );
  }
}
