import 'package:shopping/Models/Products.dart';

class CartModel {
  int? id;
  int quantity;
  String name;
  int productId;
  int userId;

  CartModel(
      {required this.id,
      required this.name,
      required this.quantity,
      required this.productId,
      required this.userId});

  factory CartModel.fromSqfLite(Map<String, dynamic> fromDatabase) => CartModel(
      id: fromDatabase['id'],
      name: fromDatabase['name'],
      quantity: fromDatabase['quantity'],
      productId: fromDatabase['productId'],
      userId: fromDatabase['userId']);

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "quantity": quantity,
        "productId": productId,
        "userId": userId,
      };
}
