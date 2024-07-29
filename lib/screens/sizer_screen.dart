
import 'package:flutter/material.dart';

class SizerScreen extends StatelessWidget{
  const SizerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(child: Container(width : double.infinity,
          child: Column( children: [
            Text("TEXT !"),  Text("TEXT !"),  Text("TEXT !"),  Text("TEXT !"),  Text("TEXT !"),  Text("TEXT !"),  Text("TEXT !"),
            Text("TEXT !"),  Text("TEXT !"),  Text("TEXT !"),  Text("TEXT !"),  Text("TEXT !"),  Text("TEXT !"),  Text("TEXT !"),
            Text("TEXT !"),  Text("TEXT !"),  Text("TEXT !"),  Text("TEXT !"),  Text("TEXT !"),  Text("TEXT !"),  Text("TEXT !"),
            Text("TEXT !"),  Text("TEXT !"),  Text("TEXT !"),  Text("TEXT !"),  Text("TEXT !"),  Text("TEXT !"),  Text("TEXT !"),
            Text("TEXT !"),  Text("TEXT !"),  Text("TEXT !"),  Text("TEXT !"),  Text("TEXT !"),  Text("TEXT !"),  Text("TEXT !"),
            Text("TEXT !"),  Text("TEXT !"),  Text("TEXT !"),  Text("TEXT !"),  Text("TEXT !"),  Text("TEXT !"),  Text("TEXT !"),
            Text("TEXT !"),  Text("TEXT !"),  Text("TEXT !"),  Text("TEXT !"),  Text("TEXT !"),  Text("TEXT !"),  Text("TEXT !"),
          ],),
        )),
      ),
    );
  }
  
}