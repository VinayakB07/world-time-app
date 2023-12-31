import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty?data:ModalRoute.of(context)?.settings.arguments as Map;
    String img=data['isDay']?'day.png':'night.png';
    Color bgcolor= data['isDay'] ? Colors.lightBlue:Colors.indigo;
    return Scaffold(
      backgroundColor: bgcolor,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/$img'),
              fit: BoxFit.cover
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: <Widget>[
                  TextButton.icon(
                      onPressed:()async{
                        dynamic result=await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data={
                            'time':result['time'],
                            'location':result['location'],
                            'isDay':result['isDay'],
                            'flag':result['flag'],
                          };
                        });
                      } ,
                     icon: Icon(
                         Icons.edit_location,
                         color: Colors.grey[300],
                     ),
                    label: Text(
                        'Edit Location',
                    style: TextStyle(
                      color:Colors.grey[300],
                    ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28,
                          letterSpacing: 2,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
