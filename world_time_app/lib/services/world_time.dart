import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for the UI
  String time; //the time in the location
  String flag;
  String url;
  bool isDayTime; //true false if daytime or not

  WorldTime({this.location, this.flag, this.url});

  void getTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      // print(response.body);
      Map data = jsonDecode(response.body);

      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      print(dateTime + 'offset');
      // print(offset);
      DateTime now = DateTime.parse(dateTime);
      now.add(Duration(hours: int.parse(offset)));

      //setTime Property
      // time = now.toString();
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
      // flag = 'india.png';
      print(time);

    } catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }
  }
}
