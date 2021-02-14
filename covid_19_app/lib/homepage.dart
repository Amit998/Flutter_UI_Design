import 'dart:convert';

import 'package:covid_19_app/datasource.dart';
import 'package:covid_19_app/pages/countryPage.dart';
import 'package:covid_19_app/panels/indoPanel.dart';
import 'package:covid_19_app/panels/mostAffectedCountries.dart';
import 'package:covid_19_app/panels/worldwidepanel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:async/async.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:pie_chart/pie_chart.dart';
// import '';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map worldData;

  fetchWorldWideData() async {
    http.Response response1 =
        await http.get('https://corona.lmao.ninja/v3/covid-19/all');

    setState(() {
      worldData = json.decode(response1.body);
    });
  }

  List countryData;

  fetchCountryData() async {
    http.Response response = await http
        .get('https://corona.lmao.ninja/v3/covid-19/countries?sort=cases');

    print(response);

    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future fetchData() async {
    fetchWorldWideData();
    fetchCountryData();
  }

  @override
  Widget build(BuildContext context) {
    // print(countryData[1]);
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Theme.of(context).brightness == Brightness.light
                  ? Icons.lightbulb_outline
                  : Icons.highlight,
            ),
            onPressed: () {
              DynamicTheme.of(context).setBrightness(
                  Theme.of(context).brightness == Brightness.light
                      ? Brightness.dark
                      : Brightness.light);
            },
          )
        ],
        centerTitle: true,
        title: Text("Covid-19 TRACKER"),
        backgroundColor: Colors.black87,
      ),
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                height: 100,
                color: Colors.orange,
                padding: EdgeInsets.all(10),
                child: Text(
                  DataSource.quote,
                  style: TextStyle(
                      color: Colors.orange[100],
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "WorldWide",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CountryPage(),
                            ));
                      },
                      child: Container(
                        // color: Colors.black,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15)),
                        // decoration: BoxDecoration(
                        //     color: primaryColor,
                        //     borderRadius: BorderRadius.circular(16)),
                        child: Text(
                          "Regional",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              worldData == null
                  ? CircularProgressIndicator()
                  : WorldWidePanel(
                      worldData: worldData,
                    ),
              PieChart(
                dataMap: {
                  'Confirmed': worldData['cases'].toDouble(),
                  'Active': worldData['active'].toDouble(),
                  'Recovered': worldData['recovered'].toDouble(),
                  'Death': worldData['deaths'].toDouble(),
                }, 
                colorList: [
                  Colors.red,
                  Colors.green,
                  Colors.yellow,
                  Colors.black,
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Most Affacted Country",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              countryData == null
                  ? Container()
                  : MostAffctedCountry(
                      countryData: countryData,
                    ),
              SizedBox(height: 10),
              InfoPanel(),
              SizedBox(
                height: 10,
              ),
              Text(
                'We are together in the fight',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
