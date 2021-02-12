import 'package:flutter/material.dart';

// https://corona.lmao.ninja/v3/covid-19/countries

class MostAffctedCountry extends StatelessWidget {
  final List countryData;

  const MostAffctedCountry({Key key, this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(countryData[1]);
    return Container(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Image.network(
                  countryData[index]['countryInfo']['flag'],
                  height: 50,
                  width: 50,
                ),
                SizedBox(width: 10),
                Text(
                  countryData[index]['country'].toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                Text(
                  'Death : ' + countryData[index]['deaths'].toString(),
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                )
              ],
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
