class Product {
  final String urlLink;
  final String name;
  final String price;

  Product(this.urlLink, this.name, this.price);

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(json['imageUrl'], json['name'], json['price']);
  }
}
