import 'package:flutter/material.dart';
import 'package:new_project/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  Future<void> setWorldTime() async {
    WorldTime inst=new WorldTime(location: 'Kolkata',flag: 'ind.png',url: 'Asia/Kolkata');
    await inst.getTime();
    Future.delayed(Duration(seconds: 2),
        ()=>Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':inst.location,
      'flag':inst.flag,
      'time':inst.time,
      'isDay':inst.isDay,
    })
    );

  }
  @override
  void initState() {
    super.initState();
    setWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
            child: SpinKitFadingCube(
              color: Colors.white,
              size: 50.0,
            ),
      )
    );
  }
}
