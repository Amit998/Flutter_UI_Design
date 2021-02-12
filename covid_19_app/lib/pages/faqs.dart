import 'package:flutter/material.dart';
import 'package:covid_19_app/datasource.dart';

class FAQsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs'),
      ),
      body: ListView.builder(
          itemCount: DataSource.questionAnswers.length,
          itemBuilder: (context, index) {
            return ExpansionTile(
              title: Text(
                DataSource.questionAnswers[index]['question'],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              children: [
                Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      DataSource.questionAnswers[index]['answer'],
                      style: TextStyle(fontSize: 18),
                    ))
              ],
            );
          }),
    );
  }
}
