import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_project/api/constants.dart';
import 'package:flutter_first_project/screens/dashboard.dart';
import 'package:flutter_first_project/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var _width = 1.0;
  var _height = 100.0;
  bool flag = true;
  var isLogin = false;

  @override
  void initState() {
    super.initState();
    getValueFromPref();
    Timer(
        const Duration(seconds: 2),
        () => {
              if (isLogin)
                {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => DashBoardScreen()))
                }
              else
                {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()))
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
                opacity: _width,
                curve: Curves.slowMiddle,
                duration: Duration(seconds: 1),
                child: Image.asset('assets/images/google.png')),
            Text('Flutter by Goolge',
                style: TextStyle(fontSize: 20, color: Colors.blue) ),
            // ElevatedButton(onPressed: (){
            //   setState(() {
            //     if(flag){
            //       _width = 0.0;
            //       _height = 150.0;
            //       flag = false;
            //     }else{
            //       _width = 1.0;
            //       _height = 100.0;
            //       flag = true;
            //     }
            //   });
            // }, child: Text('Animate'))
          ],
        ),
      ),
    );
  }

  void getValueFromPref() async {
    var pref = await SharedPreferences.getInstance();
    isLogin = pref.getBool(Constants.IS_LOGIN) ?? false;
  }
}
