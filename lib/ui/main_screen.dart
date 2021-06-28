import 'package:assignment_1/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: _drawAppBar(),
        body: _drawBody(),
      ),
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
        indicatorColor: Colors.white,
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
    return TabBarView(children: [
      HomeScreen(),
      Center(child: Text('2')),
      Center(child: Text('3')),
    ]);
  }
}
