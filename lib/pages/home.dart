import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};
  @override
  Widget build(BuildContext context) {

    data=ModalRoute.of(context).settings.arguments;
    print(data);
    String bgImage=data['isDaytime']? 'day.jpg' :'night.jpeg';
    Color bgcolor =data['isDaytime'] ? Colors.blue :Colors.indigo;
    return Scaffold(
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit:BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(onPressed: (){
                    Navigator.pushNamed(context, '/location');
                  },
                      icon: Icon(Icons.edit_location,
                      color: Colors.orange,),
                  label: Text('Edit Location',
                  style:TextStyle(
                    color: Colors.orange,

                  )),
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          data['location'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                      ),)
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                      data['time'],
                    style: TextStyle(
                        color: Colors.white,
                      fontSize: 66.0),

                  ),
                ],
    ),
            ),
          ),
      ),
    );
  }
}
