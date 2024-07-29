//
// import 'package:sqflite/sqflite.dart';
//
// class Book{
//   final int id;
//   final String title;
//   final int price;
//
//   Book({this.id, this.title, this.price});
//
//   // It converts a Book into a Map. The keys correspond to the names of the columns in the database.
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'title': title,
//       'price': price,
//     };
//   }
// }
//
// Future<void> insertBook(Book book) async {
//   final Database db = await database;
//   await db.insert(
//     'books',
//     book.toMap(),
//     conflictAlgorithm: ConflictAlgorithm.replace,
//   );
// }
//
// // Create a Book and add it to the books table.
// final b1 = Book(
//   id: 0,
//   title: 'Let Us C',
//   price: 350,
// );
//
// await insertBook(b1);
