import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_project/model/user_model.dart';
import 'package:flutter_first_project/screens/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/constants.dart';
import 'dashboard.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  LoginScreen();
}

class _LoginScreenState extends State<LoginScreen> {

  final databaseReference = FirebaseDatabase.instance.ref();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Login Screen $valueFromSplasg'),
      // ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),

          ],
        ),
    ),
      body: Stack(children: [
        Container(width : double.infinity , height : double.infinity ,child: Image.asset('assets/images/bg.jpg',fit: BoxFit.fill,)),
      Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 20 ,left: 15 , right: 15, bottom: 20),
            width: double.infinity,
            child:(Card ( shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
              child: Container(padding: EdgeInsets.all(10),margin: EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Text('Login' , style: TextStyle(fontSize: 30 , color: Colors.blue.shade500, fontWeight: FontWeight.bold)),
                    Container(height : 50 ,margin: EdgeInsets.only(top: 50),
                      child: TextField(controller : emailController ,cursorColor: Colors.lightBlue,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Email', hintText: 'Enter Email'),
                      ),
                    ),Container(height : 50 ,margin: EdgeInsets.only(top: 10),
                      child: TextField(controller : passwordController ,keyboardType : TextInputType.text,obscureText: _isHidden, decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Password', suffix: InkWell(
                          onTap: _togglePasswordView,  /// This is Magical Function
                          child: Icon(_isHidden ?         /// CHeck Show & Hide.
                          Icons.visibility : Icons.visibility_off,
                          ),),),
                      ),),
                    Container(margin: EdgeInsets.only(top: 10),
                      child: Align(alignment: Alignment.topRight,child:
                      Text('Forgot Password?')),
                    ),
                    Container(margin:EdgeInsets.only(top: 20),child: ElevatedButton(onPressed: () async{
                      // var pref = await SharedPreferences.getInstance();
                      // pref.setBool(Constants.IS_LOGIN, true);
                      // Navigator.pushReplacement(context,
                      //     MaterialPageRoute(builder:
                      //         (context) => DashBoardScreen()
                      //     )
                      // );
                      var email  = emailController.text.toString();
                      var password  = passwordController.text.toString();
                      FocusManager.instance.primaryFocus?.unfocus();
                      print(email+"   "+password);
                     signInUsingEmailPassword(email : email , password : password , context:context );
                    }, child: Text('     Login     '))),
                    Container(margin: EdgeInsets.only(top: 22 ,bottom: 20),
                      child: InkWell(onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterScreen()));
                      },
                        child: RichText(text: TextSpan(
                          text: 'Don\'t have an account? ', style:
                          TextStyle(fontSize: 16 , color: Colors.grey),
                          children: const <TextSpan>[
                            TextSpan(text: 'Register Now', style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.blue)),
                          ],
                        )),
                      ),
                    )
                  ],),
              ),
            )),
          ),
        )),],
      ),
    );
  }

  var valueFromSplash = "";

  void signInUsingEmailPassword({required String email, required String password, required BuildContext context,}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      print(userCredential.user!.uid);
        getUserDataFromDb(userCredential.user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showDialog(message: 'No user found for that email.');
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showDialog(message: 'Wrong password provided.');
        print('Wrong password provided.');
      } else {
        showDialog(message: 'Wrong password provided.');
        print(e.message);
      }
    }

  }

  void showDialog({required String message}) {
    AlertDialog(
      title: Text(message),
      // To display the title it is optional
      content: Text('GeeksforGeeks'),
      // Message which will be pop up on the screen
      // Action widget which will provide the user to acknowledge the choice
      actions: [
        TextButton(
          onPressed: () {},
          child: Text('Ok'),
        ),
      ],
    );
  }

  bool _isHidden = true;

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void getUserDataFromDb(String id) async {
    UserModel userModel;
    var pref = await SharedPreferences.getInstance();

    databaseReference.child('Users').child(id).once().then((DatabaseEvent event) {
      userModel = UserModel.fromJson(jsonDecode(jsonEncode(event.snapshot.value)));
          print(userModel.password);
          pref.setBool(Constants.IS_LOGIN, true);
          Map<String, dynamic> map = userModel.toJson();
          pref.setString(Constants.USER_PREF, json.encode(map));
          pref.getString(Constants.USER_PREF);
          print("email___Name${pref.getString(Constants.USER_PREF)}   ${userModel.email}");
        })
        .then((value) => {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashBoardScreen()))})
        .catchError((error) {
          print('Exception : ${error.message}');
        });
  }
}