import 'package:assignment_1/data/product.dart';
import 'package:assignment_1/models/product.dart';
import 'package:assignment_1/ui/widgets/product_widget.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  Function function;

  FavoriteScreen(this.function);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
          children: ProductData.productData
              .getProducts()
              .where((element) => element.isLike == true)
              .map((Product product) {
        return ProductWidget(product, function);
      }).toList()),
    );
  }
}
