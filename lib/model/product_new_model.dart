
class ProductNewModel{
  int id = 1;
  String title= "iPhone 9";
  String description= "An apple mobile which is nothing like apple";
  int price= 549;
  double discountPercentage= 12.96;
  double rating= 4.69;
  int stock= 94;
  String brand= "Apple";
  String category= "smartphones";
  String thumbnail= "https://i.dummyjson.com/data/products/1/thumbnail.jpg";
  List<String> images=  [
  "https://i.dummyjson.com/data/products/1/1.jpg",
  "https://i.dummyjson.com/data/products/1/2.jpg",
  "https://i.dummyjson.com/data/products/1/3.jpg",
  "https://i.dummyjson.com/data/products/1/4.jpg",
  "https://i.dummyjson.com/data/products/1/thumbnail.jpg"
  ];

  ProductNewModel(
      this.id,
      this.title,
      this.description,
      this.price,
      this.discountPercentage,
      this.rating,
      this.stock,
      this.brand,
      this.category,
      this.thumbnail,
      this.images);
}
