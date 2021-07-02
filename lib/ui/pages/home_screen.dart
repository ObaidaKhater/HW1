import 'package:assignment_1/data/product.dart';
import 'package:assignment_1/models/product.dart';
import 'package:assignment_1/ui/widgets/product_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  Function function;
  HomeScreen(this.function);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 1, child: _drawRowItems()),
          _drawText(),
          Expanded(flex: 2, child: _drawColumnItems()),
        ],
      ),
    );
  }

  Widget _drawText() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Text(
        'Products',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
      ),
    );
  }

  Widget _drawRowItems() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: ProductData.productData.getProducts().map((Product product) {
          return Container(
            width: 300,
            height: double.infinity,
            child: Container(
              color: Colors.black.withOpacity(0.4),
              child: Center(
                  child: Text(
                product.name,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              )),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage(product.pathImage),
                    fit: BoxFit.cover)),
          );
        }).toList(),
      ),
    );
  }

  Widget _drawColumnItems() {
    return ListView(
      children: ProductData.productData.getProducts().map((Product product) {
        return ProductWidget(product,function);
      }).toList(),
    );
  }
}
