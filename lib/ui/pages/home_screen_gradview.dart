import 'package:assignment_1/data/product.dart';
import 'package:assignment_1/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreenGridView extends StatelessWidget {
  Function function;

  HomeScreenGridView(this.function);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          itemCount: ProductData.productData.getProducts().length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisExtent: 250),
          itemBuilder: (context, index) {
            Product product = ProductData.productData.getProducts()[index];
            return Container(
              child: Container(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          width: double.infinity,
                          height: 100,
                          child: Card(
                            color: Colors.grey.withOpacity(0.4),
                            child: ListTile(
                              title: Text(product.name),
                              subtitle: Text('${product.price} \$'),
                              trailing: IconButton(
                                onPressed: () {
                                  function(product);
                                },
                                icon: Icon(Icons.favorite),
                                color: (product.isLike) ? Colors.redAccent : Colors.grey,
                              ),
                            ),
                            elevation: 10,
                          )))),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: ExactAssetImage(product.pathImage))),
            );
          }),
    );
  }
}
