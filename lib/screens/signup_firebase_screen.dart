
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SignUpFirebaseScreen extends StatefulWidget{

  final String title = 'Registration';

  @override
  State<SignUpFirebaseScreen> createState() => _SignUpFirebaseScreenState();

}

class _SignUpFirebaseScreenState extends State<SignUpFirebaseScreen> {

  final databaseReference = FirebaseDatabase.instance.reference();
  String data  = " ";

  @override
  void initState() {
    super.initState();
    createData();
    readData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text(data)),
    );
  }

  void readData(){
    databaseReference.once().then((DatabaseEvent event) {
      print(event.snapshot.value);
      data = "$data  ${event.snapshot.value}";
    });
  }

  void createData(){
    databaseReference.child("flutterDevsTeam1").set({
      'name': 'Deepak Nishad',
      'description': 'Team Lead'
    });
    databaseReference.child("flutterDevsTeam2").set({
      'name': 'Yashwant Kumar',
      'description': 'Senior Software Engineer'
    });
    databaseReference.child("flutterDevsTeam3").set({
      'name': 'Akshay',
      'description': 'Software Engineer'
    });
    databaseReference.child("flutterDevsTeam4").set({
      'name': 'Aditya',
      'description': 'Software Engineer'
    });
    databaseReference.child("flutterDevsTeam5").set({
      'name': 'Shaiq',
      'description': 'Associate Software Engineer'
    });
    databaseReference.child("flutterDevsTeam6").set({
      'name': 'Mohit',
      'description': 'Associate Software Engineer'
    });
    databaseReference.child("flutterDevsTeam7").set({
      'name': 'Naveen',
      'description': 'Associate Software Engineer'
    });
  }

  void deleteData(){
    databaseReference.child('flutterDevsTeam1').remove();
    databaseReference.child('flutterDevsTeam2').remove();
    databaseReference.child('flutterDevsTeam3').remove();
  }

  void updateData(){
    databaseReference.child('flutterDevsTeam1').update({'description': 'CEO'});
    databaseReference.child('flutterDevsTeam2').update({'description': 'Team Lead'});
    databaseReference.child('flutterDevsTeam3').update({'description': 'Senior Software Engineer'});
  }
}