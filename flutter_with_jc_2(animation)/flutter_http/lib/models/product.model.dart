// Product class, it includes a factory constructor for creating an instance of Product from a JSON map

// PRODUCT
class Product {
  // dans json, les 4 sont required pour avoir un Product.
  // Constructor:
  // This is the constructor for the Product class. It takes four parameters (name, description, price, and image) and initializes the corresponding fields.
  Product(this.name, this.description, this.price, this.image);

// Fields: (initialisation des propriétés, déclanché par la méthode factory)
// These are the instance variables (fields) of the Product class. They represent the properties of a product: name, description, price, and image.
  final String name;
  final String description;
  final int price;
  final String image;

  // Factory Constructor:
  // This is a factory constructor named fromJson. It's a special type of constructor used to create an instance of the class based on external data, such as JSON data. It takes a Map<String, dynamic> as a parameter (assumed to be a JSON map) and extracts the values for the fields to create a new Product instance.
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      json['name'],
      json['description'],
      json['price'],
      json['image'],
    );
  }

// Getter Method (pure js):
// These are getter methods for accessing the values of the fields. They provide read-only access to the private fields of the class. For example, you can get the name of a Product instance by calling product.getName.
  String get getName => name;
  String get getDescription => description;
  int get getPrice => price;
  String get getImage => image;
}

// PRODUCTLIST
class ProductList {
  ProductList({required this.products});
// propriété requise par constructor
  final List<Product> products;

  factory ProductList.fromJson(List<dynamic> parseJson) {
    List<Product> products = <Product>[];

    products = parseJson.map((p) => Product.fromJson(p)).toList();

    return ProductList(products: products);
  }
}
