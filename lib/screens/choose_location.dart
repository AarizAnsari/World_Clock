import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'United Kingdom', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Greece', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Egypt', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Kenya', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'USA', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'South Korea', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Indonesia', flag: 'indonesia.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'India', flag: 'india.png'),
  ];
   void updateTime(index) async{
     WorldTime instance= locations[index];
     await instance.gettime();
     Navigator.pop(context,
     {
       'location': instance.location,
       'flag': instance.flag,
       'time': instance.time,
       'isDaytime': instance.isDaytime,
     }
     );
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context , index){
          return Card(
            child: ListTile(
              onTap: (){
               updateTime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),
            ),
          );
        },

      ),
    );
  }
}
