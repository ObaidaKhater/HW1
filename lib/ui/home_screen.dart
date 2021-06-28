import 'package:assignment_1/data/product.dart';
import 'package:assignment_1/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
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
              color: Colors.grey.withOpacity(0.4),
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
      }).toList(),
    );
  }
}
