import 'package:covid_19_app/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countryData;

  fetchCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v3/covid-19/countries');

    print(response);

    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    super.initState();
    fetchCountryData();
  }

  @override
  Widget build(BuildContext context) {
    // print(countryData);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Country Stats'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: Search(countryData));
              },
            )
          ],
        ),
        body: countryData == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: countryData == null ? 0 : countryData.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      height: 120,
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 160,
                            margin: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  countryData[index]['country'],
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10),
                                Image.network(
                                  countryData[index]['countryInfo']['flag'],
                                  height: 70,
                                  width: 70,
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                children: [
                                  SizedBox(height: 20),
                                  Text(
                                    ' Active : ${countryData[index]['active']}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  ),
                                  Text(
                                    ' Deaths : ${countryData[index]['deaths']}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.grey[100]
                                            : Colors.grey[900],
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    ' Recovered : ${countryData[index]['recovered']}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green),
                                  ),
                                  Text(
                                    ' Confirmed : ${countryData[index]['todayCases']}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }));
  }
}
