import 'package:assignment_1/data/product.dart';
import 'package:assignment_1/models/product.dart';
import 'package:assignment_1/ui/pages/favorite_screen.dart';
import 'package:assignment_1/ui/pages/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  TabController tabBarController;
  int indexBottom = 0;

  toggleProduct(Product product) {
    int index = ProductData.productData.getProducts().indexOf(product);
    ProductData.productData.getProducts()[index].isLike =
        !ProductData.productData.getProducts()[index].isLike;
    setState(() {});
  }

  @override
  void initState() {
    tabBarController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _drawAppBar(),
      body: _drawBody(),
      bottomNavigationBar: _drawBottomNavigationBar(),
    );
  }

  Widget _drawBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: indexBottom,
      selectedItemColor: Colors.teal,
      onTap: (newIndex) {
        indexBottom = newIndex;
        tabBarController.animateTo(newIndex);
        setState(() {});
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite), title: Text('Favorite')),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded), title: Text('Profile')),
      ],
    );
  }

  PreferredSizeWidget _drawAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        'First App',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      backgroundColor: Colors.teal,
      bottom: TabBar(
        controller: tabBarController,
        indicatorColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.label,
        indicator:
            UnderlineTabIndicator(insets: EdgeInsets.symmetric(horizontal: 10)),
        tabs: [
          Tab(
            icon: Icon(Icons.home),
            text: 'Home',
          ),
          Tab(
            icon: Icon(Icons.favorite),
            text: 'Favorite',
          ),
          Tab(
            icon: Icon(Icons.person_rounded),
            text: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _drawBody() {
    return TabBarView(controller: tabBarController, children: [
      HomeScreen(toggleProduct),
      FavoriteScreen(toggleProduct),
      Center(child: Text('3')),
    ]);
  }
}
