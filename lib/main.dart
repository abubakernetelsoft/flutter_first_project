import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_project/screens/splash_screen.dart';
import 'package:flutter_first_project/sql_db/database_helper.dart';
import 'package:flutter_first_project/widget/CustomButton.dart';

final dbHelper = DatabaseHelper();

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dbHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Login'),
      // ),
        body: Center(
          child: Container(
            width: double.infinity,
            height: 530,
            padding: EdgeInsets.all(10),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 10,

              //...Random Design
              // child: Column(
              //   children: [
              //     // SizedBox(
              //     //     width: 200,
              //     //     height: 200,
              //     //     child: Image.asset('assets/images/ob.png'),
              //     //   ),
              //     // Text('Workout anywhere' ,style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w700 )),
              //     // Text('You can do your workout at home without\nany equipment, outside or at the gym.', textAlign: TextAlign.center),
              //     // FloatingActionButton(onPressed: () {_navigateToNextScreen(context);},
              //     //     child: Icon(Icons.arrow_right)),
              //     Container(margin : EdgeInsets.only(top: 15),
              //   child: Card(
              //     elevation: 5,
              //     child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Text('Main Heading' , style: headingText(textColor: Colors.red)),
              //     )),
              //   ),
              //       Container(margin : EdgeInsets.all(15) ,
              //           child: Text('Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.' , style: (TextStyle(fontSize: 20)) , textAlign: TextAlign.center)),
              //       Container(margin: EdgeInsets.all(10)
              //           ,child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text("Rating bar"), Text("120 Reviews"),],)),
              //       Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              //           Column(children: [Image.asset('assets/images/ob.png', width: 20, height: 20,), Text('PREP'), Text('25 min')],
              //          ),Column(children: [Image.asset('assets/images/ob.png', width: 20, height: 20,), Text('COOK'), Text('1 hr')],
              //          ),Column(children: [Image.asset('assets/images/ob.png', width: 20, height: 20,), Text('FEEDS'), Text('4-6')])
              //         ],
              //       ),
              //     ],
              //   ),

              //...ProfileViewDesign
              //       child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
              //         children: [
              //           Card(elevation: 5, margin: EdgeInsets.all(10), child: Row(children: [
              //                 Padding(padding: const EdgeInsets.all(15), child: CircleAvatar(radius: 40, backgroundImage: NetworkImage('https://picsum.photos/id/237/200/300'),),),
              //                 Column(children: [Text('Android', style: headingText(),), Text('Flutter Development', style: TextStyle(fontSize: 16),)],)
              //               ],
              //             ),),
              //           Padding(
              //             padding: const EdgeInsets.only(left: 8.0 , right: 8.0 , top: 20),
              //             child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              //                 Column(children: [Text("Applied"), Text("20" ,style: TextStyle(fontWeight: FontWeight.w700)),]),
              //                 Column(children: [Text("Reviewed"), Text("15" ,style: TextStyle(fontWeight: FontWeight.w700)),]),
              //                 Column(children: [Text("Contacted"), Text("12" ,style: TextStyle(fontWeight: FontWeight.w700)),]),
              //
              //               ],
              //             ),
              //           ),
              //           Container(margin: EdgeInsets.only(top: 20),child: Text('Complete Profile' ,style: headingText())), Container(margin: EdgeInsets.only(top : 20),
              //             child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Card(
              //                   color: Colors.orangeAccent, child: Padding(padding: const EdgeInsets.only(top: 10, left: 15 , right: 15),
              //               child: Container(height: 100, child: Column(children: [
              //                           Container(margin: EdgeInsets.only(top : 10) ,child: Text("Education")), Row(children: [Container(margin :EdgeInsets.all(10)
              //                                 ,child: Text("02 Steps\nLeft", style: TextStyle(fontWeight: FontWeight.bold))),
              //                             CircleAvatar(radius: 15, backgroundImage: NetworkImage('https://picsum.photos/id/237/200/300'),)
              //                           ],)
              //                         ],
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //                 Card(color: Colors.amber, child: Padding(
              //                     padding: const EdgeInsets.only(top: 10, left: 15 , right: 15),
              //                     child: Container(height: 100, child: Column(
              //                         children: [Container(margin: EdgeInsets.only(top : 10) ,child: Text("Education")),
              //                           Row(children: [Container(margin :EdgeInsets.all(10),child: Text("04 Steps\nLeft" , style: TextStyle(fontWeight: FontWeight.bold))),
              //                               CircleAvatar(radius: 15, backgroundImage: NetworkImage('https://picsum.photos/id/237/200/300'),)
              //                             ],
              //                           ),
              //                         ],
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //
              //           ),
              //           Container(margin: EdgeInsets.all(10),
              //               child: Text('Buy Pro \$23.45')),
              // Container(padding: EdgeInsets.all(10),
              //   height: 70,
              //   child: TextField(keyboardType : TextInputType.phone,obscureText: _isHidden, decoration: InputDecoration(border:
              //   OutlineInputBorder(), labelText: 'Password',
              //   suffix: InkWell(
              //   onTap: _togglePasswordView,  /// This is Magical Function
              //   child: Icon(_isHidden ?         /// CHeck Show & Hide.
              //   Icons.visibility : Icons.visibility_off,
              //   ),
              //   ),
              //   ),
              //   ),
              // ),
              //           // Container(margin: EdgeInsets.all(10),
              //           //     child: Text('🤟Yoo Man Muhammad Hussnain'))
              //         ],
              //       ),

              //Login

              child: Container(
                margin: EdgeInsets.only(
                    left: 10, right: 10, bottom: 10, top: 20),
                child: Column(
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 30,
                          fontWeight: FontWeight.w900),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: TextField(
                        cursorColor: Colors.lightBlue,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                            hintText: 'Enter Email'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: TextField(
                        cursorColor: Colors.lightBlue,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            hintText: 'Enter Password'),
                      ),
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: Container(
                            margin: EdgeInsets.all(10),
                            child: Text('Forgot Password?'))),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                          onPressed: () {
                            // Fluttertoast.showToast(
                            //     msg: "Login Successfully", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 1, textColor: Colors.white, fontSize: 16.0);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Login Successfully"),
                            ));
                          },
                          child: Text("Login Now")),
                    ),
                    InkWell(
                        onTap: () {
                          _navigateToNextScreen(context);
                        },
                        child: Container(
                            margin: EdgeInsets.only(top: 40),
                            child: Text('Not a User? Register Now!'))),
                    RoundedButton(
                      text: 'Custom',
                      callBack: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Custom Button Clicked"),
                        ));
                      },
                    ),
                    RoundedButton(
                      text: 'Custom',
                      iconBtn: Icon(Icons.accessible_forward),
                      bgColor: Colors.orangeAccent,
                      callBack: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Custom Button Clicked"),
                        ));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        )

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  bool _isHidden = true;

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SecondScreen()));
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            height: 500,
            child: Card(
              margin: EdgeInsets.all(10),
              elevation: 7,
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Text('Create Account',
                          style: TextStyle(
                              color: Colors.lightBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: 30))),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: TextField(
                      cursorColor: Colors.lightBlue,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Name',
                          hintText: 'Enter Name'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: TextField(
                      cursorColor: Colors.lightBlue,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          hintText: 'Enter Email'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: TextField(
                      cursorColor: Colors.lightBlue,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter Password'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                        onPressed: () {
                          // Fluttertoast.showToast(
                          //     msg: "Login Successfully", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 1, textColor: Colors.white, fontSize: 16.0);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Login Successfully"),
                          ));
                        },
                        child: Text("Register Now")),
                  ),
                  Text('Already Member?'),
                  InkWell(
                      onTap: () {
                        _navigateToNextScreen(context);
                      },
                      child: Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Text(
                            'Login Now!',
                            style: TextStyle(color: Colors.blue),
                          )))
                ],
              ),
            ),
          ),
        ));
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ThirdScreen()));
  }
}

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: Image.asset('assets/images/ob_3.png'),
              ),
              Text(
                'Workout anywhere',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Text(
                'We want to fully enjoy the programs\nand stay healthy and positive.',
                textAlign: TextAlign.center,
              ),
              FloatingActionButton(
                  onPressed: () {
                    _navigateToNextScreen(context);
                  },
                  child: Icon(Icons.arrow_right))
            ],
          ),
        ));
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => FourthScreen()));
  }
}

class FourthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: Image.asset('assets/images/ob_4.png'),
              ),
              Text(
                'Workout anywhere',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Text(
                'We want to fully enjoy the programs\nand stay healthy and positive.',
                textAlign: TextAlign.center,
              ),
              FloatingActionButton(
                  onPressed: () {}, child: Icon(Icons.arrow_right))
            ],
          ),
        ));
  }
// void _navigateToNextScreen(BuildContext context) {
//   Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondScreen()));
// }
}