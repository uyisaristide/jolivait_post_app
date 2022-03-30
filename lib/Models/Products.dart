class Products {
  int id;
  String names;
  int price;
  int quantity;
  List<String> details;
  String thumbnail;

  Products(
      {required this.id,
      required this.names,
      required this.price,
      required this.quantity,
      required this.details,
      required this.thumbnail});
  // factory Products.fromJson(Map<dynamic, dynamic> fromJson) => Products(
  //     id: fromJson['id'],
  //     names: fromJson['names'],
  //     price: fromJson['price'],
  //     quantity: fromJson['quantity'],
  //     details: fromJson['details'],
  //     thumbnail: fromJson['images']);

  // Map<String, dynamic> toMap() {
  //   return {
  //     "id": id,
  //     "names": names,
  //     "price": price,
  //     "quantity": quantity,
  //     "details": details,
  //     "thum": thumbnail,
  //   };
  // }

  static List<Products> generateItems() {
    return [
      Products(
          id: 1000,
          names: 'Gucci Shirt',
          price: 1000,
          quantity: 240,
          details: ["assets/images/arrival1.png", "assets/images/best1.png"],
          thumbnail: "assets/images/arrival1.png"
      ),
      Products(
          id: 1100,
          names: 'T chirt, Polo',
          price: 12300,
          quantity: 53,
          details: ["assets/images/arrival2.png", "assets/images/detail2.png"],
          thumbnail: "assets/images/arrival2.png"
      ),
    ];
  }
}
