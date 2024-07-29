

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DemoScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(

     ),
     body: Column(
       children: [
         Text("bdasgas"),
         ElevatedButton(onPressed: (){}, child: Text("Click"))
       ],
     ),
   );
  }

}