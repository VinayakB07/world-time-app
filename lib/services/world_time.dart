import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  late String location;
  late String time;
  late String flag;
  late String url;
  late bool isDay;

  WorldTime({required this.location, required this.flag,required this.url});


  Future<void> getTime() async {
    try{
      Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      String datetime=data['datetime'];
      String offset=data['utc_offset'];
      DateTime now=DateTime.parse(datetime);

      now=now.add(Duration(hours: int.parse(offset.substring(1,3)),minutes:int.parse(offset.substring(4,6))));

      isDay=now.hour>6 && now.hour<18 ? true : false;
      time=DateFormat.jm().format(now);
      print(time);
    }catch(e){
      print('Error : $e');
      time='unable to get the time';
    }


  }

}
