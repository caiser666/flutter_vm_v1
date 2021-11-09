import 'package:flutter_vm_v1/app/models/product_model.dart';

class MyCartModel {
  final ProductModel product;
  late int quantity;

  MyCartModel({
    required this.product,
    this.quantity = 1,
  });
}
