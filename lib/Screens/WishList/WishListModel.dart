class WishListModel {
  int? id;
  String name;
  int price;
  int productId;
  int quantity;
  String description;
  String details;
  String thumbnail;
  int userId;

  WishListModel(
      {required this.id,
      required this.name,
        required this.productId,
      required this.price,
        required this.userId,
      required this.quantity,
      required this.description,
      required this.details,
      required this.thumbnail});

  factory WishListModel.fromJson(Map<String, dynamic> fromJson) {
    // print("In constructor factory constructor ${fromJson["name"]}");
    return WishListModel(
        id: fromJson['id'],
        description: fromJson['description'],
        productId: fromJson['id'],
        name: fromJson['name'],
        price: fromJson['price'],
        userId: fromJson['id'],
        quantity: fromJson['quantity'],
        details: "assets/images/arrival1.png",
        thumbnail: "assets/images/arrival1.png");
  }

  Map<String, dynamic> toWishListModel() => {
        "id": null,
        "name": name,
        "price": price,
        "quantity": quantity,
        "description": description,
        "details": details,
        "thumbnail": thumbnail,
        "productId":productId,
        "userId":userId
      };

  static List<WishListModel> generateItems() {
    return [
      WishListModel(
          id: 1000,
          userId: 100,
          name: 'Gucci Shirt',
          price: 1000,
          productId: 200,
          description: "hardcoded strings",
          quantity: 240,
          details: "assets/images/best1.png",
          thumbnail: "assets/images/arrival1.png"),
      WishListModel(
          id: 1100,
          userId: 100,
          name: 'T chirt, Polo',
          price: 12300,
          description: "Hardcoded strings",
          quantity: 53,
          productId: 202,
          details: "assets/images/detail2.png",
          thumbnail: "assets/images/arrival2.png"),
    ];

  }
}
