import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class WebHomePage extends StateLessWidget {
//   const WebHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   WebHomePageState createState() => WebHomePageState();
// }

class WebHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [ Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: SizedBox(
                    width: 150,
                    height: 60,
                    child: Image.asset('assets/images/google.png')),
              ),
              Container(margin: EdgeInsets.only(right: 22),
                child: Row(
                  children: [Text('Home', style: TextStyle(fontSize: 22 ,color: Colors.blue),),
                    SizedBox(width: 15,),
                    Text('Profolio', style: TextStyle(fontSize: 22),),
                    SizedBox(width: 15,),
                    Text('About', style: TextStyle(fontSize: 22),),
                    SizedBox(width: 15,),
                    Text('Contact', style: TextStyle(fontSize: 22),),
                  ],
                ),
              ),
            ],
          ),
            Container(
              width: double.infinity,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Padding(
                  padding: EdgeInsets.only(left:40 ,top: 40),
                  child: Column(
                    children: [
                      Text("Software Development\nConsulting for\nInnovators", style: TextStyle(fontSize: 40
                          ,fontWeight: FontWeight.w900),),
                      Text("InvoZone offers software development consulting services for businesses,\nstartups, and enterprises. Partner with a reliable software development companyto\nscale up your engineering capacity.",
                        style: TextStyle(fontSize: 18),),
                    ],
                  ),
                ),
                  Image.asset('assets/images/fintechs.webp')],
              ),
            ),
            Container(margin:EdgeInsets.only(top: 70),child:
            Text('Software Consulting &\nDevelopment Services...',style: TextStyle(fontSize: 40)))
          ],
        ));
  }
}
