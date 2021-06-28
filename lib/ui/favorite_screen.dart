import 'package:assignment_1/data/product.dart';
import 'package:assignment_1/models/product.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FavoriteScreenState();
  }
}

class FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
            children: ProductData.productData
                .getProducts()
                .where((element) => element.isLike == true)
                .map((Product product) {
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
                        product.isLike = !product.isLike;
                        setState(() {});
                      },
                    ),
                  );
            })
                .toList()),
      ),
    );
  }
}
