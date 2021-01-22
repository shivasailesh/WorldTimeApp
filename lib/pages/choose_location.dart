import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:world_time/services/world_time.dart';
import 'dart:convert';

import 'package:world_time/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> location=[
    WorldTime(url:'Asia/Kolkata',location: 'Kolkata',flag:'india.png'),
    WorldTime(url:'Europe/London',location: 'London',flag:'uk.png'),
    WorldTime(url:'Europe/Berlin',location: 'Athens',flag:'greece.png'),
    WorldTime(url:'Europe/Cairo',location: 'Cairo',flag:'egypt.png'),
    WorldTime(url:'Europe/Nairobi',location: 'Nairobi',flag:'kenya.png'),
    WorldTime(url:'Europe/Chicago',location: 'Chicago',flag:'usa.png'),
    WorldTime(url:'Europe/New_York',location: 'New York',flag:'usa.png'),
    WorldTime(url:'Europe/Seoul',location: 'Seoul',flag:'south_korea.png'),
    WorldTime(url:'Europe/Jakarta',location: 'Jakarta',flag:'indonesia.png'),
  ];

  void updateTime(index) async{
    WorldTime instance =location[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context, {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime,
    });

}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: location.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical:1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                 updateTime(index);
                  },
                title: Text(location[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/${location[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
