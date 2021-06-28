import 'package:assignment_1/models/product.dart';

class ProductData {
  ProductData._();

  List<Product> _products = [
    Product(
        name: 'Product 1',
        price: 20,
        isLike: false,
        pathImage: 'assets/images/product1.jpg'),
    Product(
        name: 'Product 2',
        price: 100,
        isLike: true,
        pathImage: 'assets/images/product2.jpg'),
    Product(
        name: 'Product 3',
        price: 800,
        isLike: false,
        pathImage: 'assets/images/product3.jpg'),
    Product(
        name: 'Product 4',
        price: 900,
        isLike: true,
        pathImage: 'assets/images/product4.jpg'),
    Product(
        name: 'Product 5',
        price: 50,
        isLike: true,
        pathImage: 'assets/images/product5.jpg'),
    Product(
        name: 'Product 6',
        price: 20,
        isLike: false,
        pathImage: 'assets/images/product6.jpg'),
    Product(
        name: 'Product 7',
        price: 19,
        isLike: false,
        pathImage: 'assets/images/product7.jpg'),
  ];

  static ProductData productData = ProductData._();

  List<Product> getProducts() {
    return _products;
  }
}
