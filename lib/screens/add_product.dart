
import 'package:flutter/material.dart';

class AddProductScreen extends StatelessWidget{

  var nameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(margin: EdgeInsets.only(top: 30 , left: 10 , right: 10),
            child: Center(
              child: Column(children: [
                Text('Add Product' , style: TextStyle(fontSize: 30 , color: Colors.blue.shade500, fontWeight: FontWeight.bold)),
                Container(height : 50,margin: EdgeInsets.only(top: 50),
                  child: TextField(controller : nameController ,cursorColor: Colors.lightBlue,
                    decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Name', hintText: 'Enter Name'),
                  ),
                ),Container(height : 50,margin: EdgeInsets.only(top: 10),
                  child: TextField(controller : nameController ,cursorColor: Colors.lightBlue,
                    decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Description', hintText: 'Enter Name'),
                  ),
                ),Container(height : 50,margin: EdgeInsets.only(top: 10),
                  child: TextField(controller : nameController ,cursorColor: Colors.lightBlue,
                    decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Price', hintText: 'Enter Name'),
                  ),
                ),Container(height : 50,margin: EdgeInsets.only(top: 10),
                  child: TextField(controller : nameController ,cursorColor: Colors.lightBlue,
                    decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Category', hintText: 'Enter Name'),
                  ),
                ),Container(height : 50,margin: EdgeInsets.only(top: 10),
                  child: TextField(controller : nameController ,cursorColor: Colors.lightBlue,
                    decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Category', hintText: 'Enter Name'),
                  ),
                ),
              ],),
            ),
          ),
        ),
      ),
    );
  }

}