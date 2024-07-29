import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  var arr_name = ['1st', '2nd', '3rd', '4th', '5th', '46th', '7th'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Search'),
          backgroundColor: Colors.orange),
        body: SafeArea(
      child: GridView.builder(itemBuilder: (context, index) {
            return SizedBox(width: double.infinity,
              child: Card(child: Column(
                  children: [Image.asset("assets/images/obb.png", fit: BoxFit.fitWidth),
                    Column(children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.center,
                          children: [Text("User Name",maxLines: 1, style: TextStyle(fontSize: 22)),
                            SizedBox(width: 20, height: 20, child: Image.asset("assets/images/red_heart.png"))],),
                        Text("Qwerty", style: TextStyle(fontSize: 16),)],)
                  ],
                ),
              ),
            );
          }, itemCount: arr_name.length, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2)),
    ));
  }
}
