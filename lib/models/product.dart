class Product {
  final String imageUrl;
  final String name;
  final String price;

  Product({required this.imageUrl, required this.name, required this.price});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        imageUrl: json['imageUrl'], name: json['name'], price: json['price']);
  }
}
