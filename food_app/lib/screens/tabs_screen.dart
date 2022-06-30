import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_app/screens/categories_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meal'),
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(Icons.category),
              text: 'Categoryes',
            ),
            Tab(
              icon: Icon(Icons.star),
              text: 'Favorites',
            )
          ]),
        ),
        body: TabBarView(children: [CategoryScreen()]),
      ),
    );
  }
}
