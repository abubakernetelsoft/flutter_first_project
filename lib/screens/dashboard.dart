
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_project/model/QuizModel.dart';
import 'package:flutter_first_project/model/album.dart';
import '../api/api_service.dart';
import '../main.dart';
import 'favourite_screen.dart';
import 'profile_screen.dart';
import 'search_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'home_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {

  var _currentIndex = 0;
  final databaseReference = FirebaseDatabase.instance.ref();

  @override
  void initState() { super.initState(); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Dashboard'),
        // ),

      // double width = MediaQuery.of(context).size.width;
      // double height = MediaQuery.of(context).size.height;
      // print("width    ${width}   Height    $height");
        body: IndexedStack(index: _currentIndex,
          children:  [HomeScreen(), FavouriteScreen(), SearchScreen(), ProfileScreen(),]),
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.purple, onPressed: () async {
        var apiResponse = ApiService();
        // List<String> images=  [
        //   "https://i.dummyjson.com/data/products/1/1.jpg",
        //   "https://i.dummyjson.com/data/products/1/2.jpg",
        //   "https://i.dummyjson.com/data/products/1/3.jpg",
        //   "https://i.dummyjson.com/data/products/1/4.jpg",
        //   "https://i.dummyjson.com/data/products/1/thumbnail.jpg"
        // ];
        // var productNewModel = ProductNewModel(1000 ,'iPhone X' ,'An apple mobile which is nothing like apple' ,550,
        //     12.96 , 4.69, 94, "Apple", "smartphones", "https://i.dummyjson.com/data/products/1/thumbnail.jpg",
        //     images);
        Album response = await apiResponse.createAlbum('SOME TEXT');
        print("API REPOSNSE : ${response.id}" );
        getQuizDataFromDb();
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => AddProductScreen())
        // );
        // _query();
        print(apiResponse.fetchAlbum());
      }, child: const Icon(Icons.add)),
      bottomNavigationBar: SalomonBottomBar(currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [/// Home
          SalomonBottomBarItem(icon: const Icon(Icons.home), title: const Text("Home"), selectedColor: Colors.purple),
          /// Likes
          SalomonBottomBarItem(icon: const Icon(Icons.favorite_border), title: const Text("Favourite"), selectedColor: Colors.red),
          /// Search
          SalomonBottomBarItem(icon: const Icon(Icons.search), title: const Text("Search"), selectedColor: Colors.orange),
          /// Profile
          SalomonBottomBarItem(icon: const Icon(Icons.person), title: const Text("Profile"), selectedColor: Colors.teal),
        ],
      ),
    );
  }

  void _query() async {
    // final allRows = await dbHelper.queryAllRows();
    // debugPrint('query all rows:');
    // for (final row in allRows) {
    //   debugPrint(row.toString());
    // }

    final allRowsProduct = await dbHelper.queryAllProduct();
    debugPrint('query all rows:');
    for (final row in allRowsProduct) {
      debugPrint(row.toString());
    }


  }

  void getQuizDataFromDb() async {
    QuizModel quizModel;

    databaseReference.child("Quiz").child("Math").once().then((DatabaseEvent e){
      print("TESTNGQWETYW${e.snapshot.value}");
    });
  }
}