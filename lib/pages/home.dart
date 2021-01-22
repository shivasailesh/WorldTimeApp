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

    data= data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);
    String bgImage=data['isDaytime']? 'day.png' :'night.png';
    String img=data['flag'];
    Color bgcolor =data['isDaytime'] ? Colors.blue :Colors.indigo;
    return Scaffold(
      appBar: AppBar(
      title: Text('World Time'),
          centerTitle: true,
          backgroundColor: Colors.blue[900],),
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
                  FlatButton.icon(onPressed: () async {
                    dynamic result= await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data={
                        'time':result['time'],
                        'location':result['location'],
                        'isDaytime':result['isDaytime'],
                        'flag':result['flag'],
                      };
                    });
                    },
                      icon: Icon(Icons.edit_location,
                      color: Colors.amber,
                      size: 25.0,),
                  label: Text('Edit Location',
                  style:TextStyle(
                    fontSize: 25.0,
                    color: Colors.amber,

                  )),
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/$img'),
                      ),
                      SizedBox(width: 40.0,),

                      Text(
                          data['location'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                      ),)
                    ],
                  ),
                  SizedBox(height: 40.0,),
                  Text(
                      data['time'],
                    style: TextStyle(
                        color: Colors.white,
                      fontSize: 60.0),

                  ),
                ],
    ),
            ),
          ),
      ),
    );
  }
}
