import 'package:assignment_1/models/product.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  Function function;
  Product product;

  ProductWidget(this.product, this.function);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      subtitle: Text('${product.price} \$'),
      leading: Image.asset(
        product.pathImage,
        height: 60,
        width: 70,
        fit: BoxFit.cover,
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.favorite,
          color: (product.isLike) ? Colors.red : Colors.grey,
        ),
        onPressed: () {
          function(product);
        },
      ),
    );
  }
}
