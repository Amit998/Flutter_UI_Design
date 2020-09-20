import 'package:http/http.dart';
import 'dart:convert';


class WorldTime{
  String location;//location name for the UI
  String time; //the time in the location
  String flag;
  String url;

  WorldTime({this.location,this.flag,this.url});

  void getTime() async {
    Response response =
    await get('http://worldtimeapi.org/api/timezone/$url');
    // print(response.body);
    Map data=jsonDecode(response.body);

    String dateTime=data['datetime'];
    String offset=data['utc_offset'].substring(1,3);
    print(offset);

    DateTime now=DateTime.parse(dateTime);

    now.add(Duration(hours: int.parse(offset) ));

    //setTime Property
    time =now.toString();
    // print(time);

  }

}