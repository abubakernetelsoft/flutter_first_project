

import 'package:flutter/material.dart';
import 'package:flutter_first_project/model/product_model.dart';
import '../api/api_service.dart';
import '../main.dart';
import '../sql_db/database_helper.dart';

class HomeScreen extends StatefulWidget{

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<ProductModel>? _productModel = [];
  late List<ProductModel>? _productFavourite = [];



  // List<ItemModel> listOfProduct = {new ItemModel() , };
  var arrName = ['1st' , '2nd', '3rd', '4th', '5th', '46th', '7th'];
  // var arr_product =[{item_model , item_model1}]

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    var apiResponse = ApiService();
    _productModel = (await apiResponse.getProducts());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    String _imgUrl = "https://picsum.photos/seed/picsum/200/300";

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.purple,
        // backgroundColor: Colors.transparent,
        // elevation: 0.0,
      ),
        // extendBodyBehindAppBar: true,
      body: _productModel == null || _productModel!.isEmpty ? const Center(
      child: CircularProgressIndicator(),
    )  :GridView.builder(itemBuilder: (context , index){
       return GestureDetector( onTap: (){
         if (!_productFavourite!.contains(_productModel![index].id)){
           var productModel = ProductModel(id: _productModel![index].id, title: _productModel![index].title,
               description: _productModel![index].description, category: _productModel![index].category, image: _productModel![index].image, price: _productModel![index].price, rating:  _productModel![index].rating);
           _productFavourite?.add(productModel);
           _insertFavourite(_productModel![index].id, _productModel![index].title, _productModel![index].description, _productModel![index].category, _productModel![index].image, _productModel![index].price);
           // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Added.....")));
         }
       },
         child: Card(child: Column(children: [
           SizedBox(height : 115 ,child: Image.network(_productModel![index].image ,fit: BoxFit.fitWidth)),
           Text(_productModel![index].title ,maxLines: 1, textAlign: TextAlign.center, style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold)),
           Padding(padding: const EdgeInsets.only(top: 8.0),
             child: Text('€${_productModel![index].price.toString()}' , style: TextStyle(fontSize: 16,)),),
         ],),),
       );
      },itemCount: _productModel?.length , gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2)
      )

      // ListView.builder(itemBuilder: (context, index){
      //   return Container(margin: EdgeInsets.only(top: 10 , left: 10 , right: 10),
      //     child: Card(color: Colors.blue.shade100,
      //       child: Row(children: [
      //         Container(margin: EdgeInsets.all(10),child: CircleAvatar(radius: 40, backgroundImage: NetworkImage('https://picsum.photos/seed/picsum/200/300'))),
      //         Column(children: [
      //           Text("User Name" ,style: TextStyle(fontSize: 22),),
      //           Text("Qwerty" ,style: TextStyle(fontSize: 16),)
      //         ],)
      //       ],),),
      //   );
      // },itemCount: arr_name.length,
      // separatorBuilder: (context, index){
      //   return Divider(height: 10,);
      // },
  // )
  //     ,

    );
  }

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    debugPrint('query all rows:');
    for (final row in allRows) {
      debugPrint(row.toString());
    }
  }

  void _insertFavourite(id, title ,description , category , image , price) async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnProductId: id,
      DatabaseHelper.columnTitle: title,
      DatabaseHelper.columnDescription: description,
      DatabaseHelper.columnCategory: category,
      DatabaseHelper.columnImage: image,
      DatabaseHelper.columnPrice: price,
    };
    await dbHelper.insertProduct(row);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Added.....")));
    // debugPrint('inserted row id: $id');
  }
}




// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: const Text('REST API Example'),
//     ),
//     body: _userModel == null || _userModel!.isEmpty
//         ? const Center(
//       child: CircularProgressIndicator(),
//     )
//         : ListView.builder(
//       itemCount: _userModel!.length,
//       itemBuilder: (context, index) {
//         return Card(
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Text(_userModel![index].id.toString()),
//                   Text(_userModel![index].name),
//                 ],
//               ),
//               const SizedBox(
//                 height: 20.0,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Text(_userModel![index].email),
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//     ),
//   );
// }
// }