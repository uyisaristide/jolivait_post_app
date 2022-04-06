class Products {
  int id;
  String names;
  int price;
  int quantity;
  String descriptions;
  List<String> details;
  String thumbnail;

  Products(
      {required this.id,
      required this.names,
      required this.price,
      required this.quantity,
      required this.descriptions,
      required this.details,
      required this.thumbnail});

  factory Products.fromJson(Map<String, dynamic> fromJson) {
    // print("In constructor factory constructor ${fromJson["names"]}");
    return Products(
        id: fromJson['id'],
        descriptions: fromJson['description'],
        names: fromJson['name'],
        price: fromJson['price'],
        quantity: fromJson['quantity'],
        details: ["assets/images/arrival1.png", "assets/images/best1.png"],
        thumbnail: "assets/images/arrival1.png");
  }

  factory Products.wishList(Map<String, dynamic> fromJson) {
    // print("In constructor factory constructor ${fromJson["names"]}");
    return Products(
        id: fromJson['id'],
        descriptions: fromJson['description'],
        names: fromJson['name'],
        price: fromJson['price'],
        quantity: fromJson['quantity'],
        details: ["assets/images/arrival1.png", "assets/images/best1.png"],
        thumbnail: "assets/images/arrival1.png");
  }

  // Map<String, dynamic> toMap() {
  //   return {
  //     "id": id,
  //     "names": names,
  //     "price": price,
  //     "descriptions":descriptions,
  //     "quantity": quantity,
  //     "details": details,
  //     "thumbnail": thumbnail,
  //   };
  // }

  static List<Products> generateItems() {
    return [
      Products(
          id: 1000,
          names: 'Gucci Shirt',
          price: 1000,
          descriptions: "hardcoded strings",
          quantity: 240,
          details: ["assets/images/arrival1.png", "assets/images/best1.png"],
          thumbnail: "assets/images/arrival1.png"),
      Products(
          id: 1100,
          names: 'T chirt, Polo',
          price: 12300,
          descriptions: "Hardcoded strings",
          quantity: 53,
          details: ["assets/images/arrival2.png", "assets/images/detail2.png"],
          thumbnail: "assets/images/arrival2.png"),
    ];
  }
}
