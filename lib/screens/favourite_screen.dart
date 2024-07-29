
import 'package:flutter/material.dart';
import '../main.dart';

class FavouriteScreen extends StatefulWidget{

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  var arr_name = ['1st' , '2nd', '3rd', '4th', '5th'];

  List<Map<String , dynamic>> _productModel = [];


  @override
  void initState() {
    _query();
    super.initState();
    // deleteAll();
    // Future<List<Map<String, dynamic>>> _productModel = _query();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favourite'), backgroundColor: Colors.red,),
        body: GridView.builder(itemBuilder: (context , index){
      return  GestureDetector( onTap: (){
        setState(() {
          deleteItemById(_productModel[index]['id']);
          debugPrint("NEW SIZE OF LIST    "+_productModel.length.toString());
          // _productModel[index].visible != _productModel[index].visible;
        });
      },child :
        Card(child: Column(children: [
          SizedBox(height : 115 ,child: Image.network(_productModel[index]['image'] ,fit: BoxFit.fitWidth)),
          Text(_productModel[index]['title'] ,maxLines: 1, textAlign: TextAlign.center, style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold)),
          Padding(padding: const EdgeInsets.only(top: 8.0),
            child: Text('€${_productModel[index]['price'].toString()}' , style: TextStyle(fontSize: 16,)),),
        ],),));
    },itemCount: _productModel.length , gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2))
    );
  }
  void deleteAll() async{
    await dbHelper.deleteAllProduct();
  }

  void deleteItemById(id) async{
    await dbHelper.deleteProduct(id);
  }

  void _query() async {
    final allRowsProduct = await dbHelper.queryAllProduct();
    _productModel = allRowsProduct;
    debugPrint('query all rows:  ${_productModel.length}');
    for (final row in allRowsProduct) {
      // _productModel?[row]['image']
      debugPrint(row.toString());
    }
    for (final row in allRowsProduct) {
      // _productModel?[row]['image']
      debugPrint(row.toString());
    }

    // return allRowsProduct;
  }
}