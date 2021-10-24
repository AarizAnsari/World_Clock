import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

   String location;
   late String time;
   String flag;
   String url;
   late bool isDaytime;

   WorldTime( {required this.location,required this.flag, required this.url});

  Future<void> gettime() async{
    try{
      Response response  = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'];
      DateTime now= DateTime.parse(datetime);
      now= now.add(Duration(hours:int.parse(offset.substring(1,3)),minutes: int.parse(offset.substring(4,6)) ));

      isDaytime = (now.hour >7 && now.hour < 19) ? true:false ;
      time= DateFormat.jm().format(now);
    }
    catch(e){
      time='no data found';
    }



  }

}

