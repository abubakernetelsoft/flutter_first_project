
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_first_project/screens/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/constants.dart';
import 'package:badges/badges.dart' as badges;

import '../model/user_model.dart';

class ProfileScreen extends StatefulWidget{

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();

}

class _ProfileScreenState extends State<ProfileScreen> {
  
  String img_url = "https://picsum.photos/seed/picsum/200/300";
  String? userName = '';
  String? email = '';

  @override
  void initState() {
    super.initState();
    setUserInfoFromPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(color: Colors.teal.shade200,
            child: Row(children: [
              // FlutterLogo(size: 60),
              Container(margin: const EdgeInsets.all(10),child: const CircleAvatar(radius: 40, backgroundImage:
              NetworkImage('https://picsum.photos/seed/picsum/200/300'))),
              Column(children: [
                Text(userName ?? 'UserName' ,style: TextStyle(fontSize: 22),),
                Text(email ?? 'xyz@example.com' ,style: TextStyle(fontSize: 16),)
              ],)
            ],),),
            Container(margin: const EdgeInsets.only(top: 20),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly ,children:  [
                Column(children: const [Text('99'), Text('Posts')
              ],),Column(children: const[Text('1500'), Text('Follower')
                ],),Column(children: const[Text('1112'), Text('Following')
                ],)],),),
            Container(margin:const EdgeInsets.only(top: 20 ,left: 20),child: Row(children: [
              const Icon(Icons.email), Text("  Email :  example@example.com" ,style : GoogleFonts.aclonica())
            ]),),
            Container(margin:const EdgeInsets.only(top: 20 ,left: 20),child: Row(children: const[Icon(Icons.phone,
                  color: Colors.green),
              Text("  Phone :  +92-312-3456789" )
            ]),),
            Container(margin:const EdgeInsets.only(top: 20 ,left: 20),child: Row(children:const [Icon(Icons.facebook
                  ,color: Colors.blue),
              Text("  Facebook :  https://www.facebook.com")
            ]),),
            Container(margin:const EdgeInsets.only(top: 20 ,left: 20),child: Row(children: const[
              Icon(Icons.email ,
                  color: Color(0xFFe7006c)),
              Text("  Instagram :  https://www.Instagram.com")
            ]),),
            Container(margin:const EdgeInsets.only(top: 20 ,left: 20),child: Row(children:const [
              Icon(Icons.email), Text("  XYZ :  abc@xyz.com")
            ]),),

            ElevatedButton(onPressed: () async{
              var pref = await SharedPreferences.getInstance();
              pref.setBool(Constants.IS_LOGIN , false);
              pref.setString(Constants.USER_PREF , '');
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            },style: ElevatedButton.styleFrom(backgroundColor: Colors.teal.shade200),child: const Text('Logout'))
            , DropdownButton(
              value: dropdownvalue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(value: items, child: Text(items),);}).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),const
            badges.Badge(badgeContent: Text('3' ,style : TextStyle(color: Colors.white),),badgeAnimation: badges.BadgeAnimation.rotation(
                animationDuration: Duration(seconds: 1),
                colorChangeAnimationDuration: Duration(seconds: 1),
                loopAnimation: false,
                curve: Curves.fastOutSlowIn,
                colorChangeAnimationCurve: Curves.easeInCubic,
              ),badgeStyle: badges.BadgeStyle(badgeColor: Colors.black),
              child: Icon(Icons.phone ,color: Colors.blue)
            ,),
          ],
        ),
      ),
    );
  }

  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
  ];

  void setUserInfoFromPref() async{
    var pref = await SharedPreferences.getInstance();
    String? userPref = pref.getString(Constants.USER_PREF);

    Map<String,dynamic> userMap = jsonDecode(userPref!) as Map<String, dynamic>;
    var user = UserModel.fromJson(userMap);
    userName = user.name;
    email = user.email;
  }
}

//Color Hexadecimal opacity values
// 100% — FF
// 95% — F2
// 90% — E6
// 85% — D9
// 80% — CC
// 75% — BF
// 70% — B3
// 65% — A6
// 60% — 99
// 55% — 8C
// 50% — 80
// 45% — 73
// 40% — 66
// 35% — 59
// 30% — 4D
// 25% — 40
// 20% — 33
// 15% — 26
// 10% — 1A
// 5% — 0D
// 0% — 00