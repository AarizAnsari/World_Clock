import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

  class _HomeState extends State<Home> {
  Map data={};
  @override
  Widget build(BuildContext context)  {
   data= data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;

  String bgImage = data['isDaytime']? 'dayy.jpg':'nightt.jpg';
  Color bgClr;
  if(data['isDaytime']== true){bgClr = Colors.blueAccent;}
  else bgClr = Colors.indigoAccent;

    return Scaffold(
      backgroundColor: bgClr,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,120,0,0),
              child: Column(
                children: [
                  Center(
                    child: TextButton.icon(
                      onPressed: ()async {
                       dynamic result= await Navigator.pushNamed(context, '/location');
                       setState(() {
                         data = {
                           'time': result['time'],
                           'location': result['location'],
                           'flag': result['flag'],
                           'isDaytime': result['isDaytime'],
                         };
                       });
                      },
                      icon: Icon(Icons.edit_location,
                      color: Colors.grey[200]),
                      label: Text('Edit Location',
                      style: TextStyle(
                        color: Colors.grey[200]
                      ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(data['location'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(data['time']
                  ,style: TextStyle(

                      color: Colors.white,
                      fontSize: 66
                    ),
                  ),
                  ],
              ),
            ),
          )),
    );
  }
}
